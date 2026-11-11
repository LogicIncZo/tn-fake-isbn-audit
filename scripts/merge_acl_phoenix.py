#!/usr/bin/env python3
"""Merge the ACL Phoenix/Ed-Tech publisher-sweep audit (698 records) into site data.

Updates:
- docs/data/final-classification.csv      (build_site.py input)
- docs/data/fakeisbn-verification.json    (ledger page asset)
- docs/data/fakeisbn-verification.csv     (ledger CSV twin)
- docs/data/acl-phoenix-ledger.csv        (wave-2 evidence: full schema + verdict)
- docs/data/full-registry-lookup.jsonl    (registry snapshot, resynced)

ACL rows = old wave (kept verbatim) + the 698 publisher-search records.
Registry original-title/publisher from data/full-registry-lookup.jsonl;
wave detail (copies/dates/costs) from data/acl-phoenix-audit.json.
"""
import csv, json, os, shutil, collections

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA = os.path.join(ROOT, "docs", "data")

audit = json.load(open(f"{ROOT}/data/acl-phoenix-audit-v2.json"))
reg = {}
for line in open(f"{ROOT}/data/full-registry-lookup.jsonl"):
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
old_acl = [r for r in old if r["library"] == "ACL Chennai"]
kcl = [r for r in old if r["library"] == "KCL Madurai"]
old_acl_by_bib = {r["biblio"]: r for r in old_acl}
old_acl_bibs = set(old_acl_by_bib)
overlap = old_acl_bibs & {str(a["biblio"]) for a in audit}
print(f"v2 re-verdicts {len(overlap)} existing ACL rows in place")

ver = json.load(open(f"{DATA}/fakeisbn-verification.json"))
old_ver_acl = [r for r in ver if r["library"] == "ACL Chennai"]
kcl_ver = [r for r in ver if r["library"] == "KCL Madurai"]

OPAC = "http://118.185.210.241:8001"
CLS_HEADER = ["library","biblio","title","author","isbn","verdict",
              "registry_publisher","registry_title","date_acquired","price"]

VERDICT_MAP = {"NEVER-ALLOCATED": "NOT-IN-REGISTRY",
               "NEEDS-LOOKUP": "NO-ISBN-IN-CATALOG",
               "UNRESOLVED-TITLE-PARTIAL": "UNRESOLVED-TITLE-PARTIAL",
               "EDITION-MISMATCH-SAME-WORK": "EDITION-MISMATCH-SAME-WORK",
               "REGISTRY-ROW-INCOMPLETE": "REGISTRY-ROW-INCOMPLETE"}
new_cls, new_ver, led_rows = [], [], []
skipped = 0
for a in audit:
    bib = str(a["biblio"])
    isbn = a.get("isbn") or ""
    verdict = VERDICT_MAP.get(a["verdict"], a["verdict"])
    t, p, lang, pdate = reg_fields(isbn)
    dates = ";".join(a.get("date_acquired") or [])
    cost = sum(a.get("costs") or [])
    copies = a.get("copies") or ""
    if bib in old_acl_by_bib:
        old_cls_row = old_acl_by_bib[bib]
        old_cls_row.update({"isbn": isbn, "verdict": verdict,
                            "registry_publisher": p, "registry_title": t})
    old_ver_row = next((r for r in old_ver_acl if str(r.get("biblio")) == bib), None)
    if old_ver_row:
        old_ver_row.update({"registry_verdict": verdict,
                            "registry_original_title": a.get("registry_title") or t,
                            "registry_original_publisher": a.get("registry_publisher") or p})
        continue
    new_cls.append({
        "library": "ACL Chennai", "biblio": bib,
        "title": a.get("title") or "", "author": a.get("author") or "",
        "isbn": isbn, "verdict": verdict,
        "registry_publisher": p, "registry_title": t,
        "date_acquired": dates,
        "price": round(cost, 2) if cost else "",
    })
    new_ver.append({
        "library": "ACL Chennai", "city": "Chennai",
        "opac_link": OPAC,
        "biblio": bib,
        "fake_title": a.get("title") or "",
        "fake_author": a.get("author") or "",
        "fake_imprint": a.get("imprint") or "",
        "isbn": isbn,
        "copies": copies,
        "date_acquired": dates,
        "price_shown": round(cost, 2) if cost else "",
        "registry_verdict": verdict,
        "registry_original_title": t,
        "registry_original_publisher": p,
        "registry_original_lang": lang,
        "registry_original_date": pdate,
        "verify_isbn_gov_in": f"https://isbn.gov.in/Home/IsbnSearch (search {isbn})" if isbn else "https://isbn.gov.in/Home/IsbnSearch",
        "verify_openlibrary": f"https://openlibrary.org/search?q={isbn}" if isbn else "",
        "verify_worldcat": f"https://search.worldcat.org/search?q={isbn}" if isbn else "",
        "verify_google_books": f"https://www.google.com/search?q=%22{isbn}%22" if isbn else "",
        "bills": "",
    })
    led_rows.append({
        "biblio": bib, "title": a.get("title") or "", "author": a.get("author") or "",
        "imprint": a.get("imprint") or "", "isbn": isbn, "copies": copies,
        "accessions": ";".join(a.get("accessions") or []),
        "dates_acquired": dates,
        "price_shown": round(cost, 2) if cost else "",
        "shelf": "", "wave": a.get("wave") or "", "verdict": a["verdict"],
    })

with open(f"{DATA}/final-classification.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=CLS_HEADER)
    w.writeheader()
    for r in old_acl:
        w.writerow({k: r.get(k, "") for k in CLS_HEADER})
    for r in new_cls:
        w.writerow(r)
    for r in kcl:
        w.writerow({k: r.get(k, "") for k in CLS_HEADER})

json.dump(old_ver_acl + new_ver + kcl_ver, open(f"{DATA}/fakeisbn-verification.json", "w"),
          ensure_ascii=False, indent=1)
VER_HEADER = list(new_ver[0].keys()) if new_ver else list(old_ver_acl[0].keys())
with open(f"{DATA}/fakeisbn-verification.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=VER_HEADER)
    w.writeheader()
    for r in old_ver_acl + new_ver + kcl_ver:
        w.writerow({k: r.get(k, "") for k in VER_HEADER})

if led_rows:
    with open(f"{DATA}/acl-phoenix-ledger.csv", "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(led_rows[0].keys()))
        w.writeheader()
        w.writerows(led_rows)

cnt = collections.Counter(r["verdict"] for r in new_cls)
copies = sum(int(r["copies"]) for r in led_rows if str(r["copies"]).isdigit())
spend = sum(float(r["price_shown"]) for r in led_rows if r["price_shown"])
dates = sorted({d for r in led_rows for d in r["dates_acquired"].split(";") if d})
print(f"phoenix rows: {len(new_cls)}  (skipped {skipped} already in old ACL wave)  verdicts: {dict(cnt)}")
dd = f"acq dates: {dates[0]} .. {dates[-1]} ({len(dates)} days)" if dates else "acq dates: none exposed on wave-2 detail pages"
print(f"copies: {copies}  visible spend: Rs {spend:,.2f}  {dd}")
print(f"ledger assets rewritten: final-classification.csv, fakeisbn-verification.json/csv, acl-phoenix-ledger.csv, full-registry-lookup.jsonl")
