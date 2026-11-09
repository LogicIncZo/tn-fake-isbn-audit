#!/usr/bin/env python3
"""Merge the KCL full-catalog audit (4,576 records) into the site data.

Updates:
- docs/data/final-classification.csv      (build_site.py input)
- docs/data/fakeisbn-verification.json    (ledger page asset)
- docs/data/fakeisbn-verification.csv     (ledger CSV twin)

Verdicts + registry original-title/publisher always come from the new
audit (data/kcl-full-audit.json + data/kcl-registry-full.jsonl); wave
detail (copies / dates / prices / bills) is preserved from the original
354-wave rows, matched by biblionumber. ACL rows pass through untouched.
"""
import csv, json, os, collections

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA = os.path.join(ROOT, "docs", "data")

audit = json.load(open(f"{ROOT}/data/kcl-full-audit.json"))
reg = {}
for line in open(f"{ROOT}/data/kcl-registry-full.jsonl"):
    d = json.loads(line)
    reg[d["isbn"]] = d

def reg_fields(isbn):
    d = reg.get(isbn)
    if not d or not d.get("rows"):
        return "", "", "", ""
    r = d["rows"][0]
    return (r.get("title") or "", r.get("publisher") or r.get("Inprint") or "",
            r.get("language") or "", str(r.get("publicationdate") or ""))

old = list(csv.DictReader(open(f"{DATA}/final-classification.csv")))
old_kcl = {r["biblio"]: r for r in old if r["library"] == "KCL Madurai"}
acl = [r for r in old if r["library"] == "ACL Chennai"]

ver = json.load(open(f"{DATA}/fakeisbn-verification.json"))
old_ver = {r["biblio"]: r for r in ver if r["library"] == "KCL Madurai"}
acl_ver = [r for r in ver if r["library"] == "ACL Chennai"]

OPAC = "http://122.184.84.190:1011"

CLS_HEADER = ["library","biblio","title","author","isbn","verdict",
              "registry_publisher","registry_title","date_acquired","price"]

new_cls, new_ver, diffs, multi = [], [], [], 0
for a in audit:
    bib = str(a["biblio"])
    isbn = a.get("isbn") or ""
    ov = old_kcl.get(bib)
    if ov and ov["verdict"] != a["registry_verdict"]:
        diffs.append((bib, ov["verdict"], a["registry_verdict"]))
    d = reg.get(isbn)
    if d and d.get("total", 0) > 1:
        multi += 1
    t, p, lang, pdate = reg_fields(isbn)
    wv = old_ver.get(bib, {})
    new_cls.append({
        "library": "KCL Madurai", "biblio": bib,
        "title": a.get("fake_title") or "", "author": a.get("fake_author") or "",
        "isbn": isbn, "verdict": a["registry_verdict"],
        "registry_publisher": p, "registry_title": t,
        "date_acquired": (ov or {}).get("date_acquired", ""),
        "price": (ov or {}).get("price", ""),
    })
    new_ver.append({
        "library": "KCL Madurai", "city": "Madurai",
        "opac_link": wv.get("opac_link", OPAC),
        "biblio": bib,
        "fake_title": a.get("fake_title") or "",
        "fake_author": a.get("fake_author") or "",
        "fake_imprint": a.get("fake_imprint") or "",
        "isbn": isbn,
        "copies": wv.get("copies", ""),
        "date_acquired": wv.get("date_acquired", ""),
        "price_shown": wv.get("price_shown", ""),
        "registry_verdict": a["registry_verdict"],
        "registry_original_title": t,
        "registry_original_publisher": p,
        "registry_original_lang": lang,
        "registry_original_date": pdate,
        "verify_isbn_gov_in": f"https://isbn.gov.in/Home/IsbnSearch (search {isbn})" if isbn else "https://isbn.gov.in/Home/IsbnSearch",
        "verify_openlibrary": f"https://openlibrary.org/search?q={isbn}" if isbn else "",
        "verify_worldcat": f"https://search.worldcat.org/search?q={isbn}" if isbn else "",
        "verify_google_books": f"https://www.google.com/search?q=%22{isbn}%22" if isbn else "",
        "bills": wv.get("bills", ""),
    })

with open(f"{DATA}/final-classification.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=CLS_HEADER)
    w.writeheader()
    for r in acl:
        w.writerow({k: r.get(k, "") for k in CLS_HEADER})
    for r in new_cls:
        w.writerow(r)

json.dump(acl_ver + new_ver, open(f"{DATA}/fakeisbn-verification.json", "w"),
          ensure_ascii=False, indent=1)
VER_HEADER = list(new_ver[0].keys())
with open(f"{DATA}/fakeisbn-verification.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=VER_HEADER)
    w.writeheader()
    for r in acl_ver:
        w.writerow({k: r.get(k, "") for k in VER_HEADER})
    for r in new_ver:
        w.writerow(r)

tal = collections.Counter(r["verdict"] for r in new_cls)
print("KCL verdicts:", dict(tal))
print("ACL rows kept:", len(acl), "| total rows:", len(acl) + len(new_cls))
print("hijacked ISBNs with >1 registry row (rows[0] shown):", multi)
print("verdict diffs vs old wave rows:", len(diffs))
for bib, o, n in diffs[:12]:
    print("  ", bib, o, "->", n)
