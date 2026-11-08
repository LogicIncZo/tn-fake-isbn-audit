#!/usr/bin/env python3
"""Single source of truth: merge acquisitions into the verification JSON, print every site figure.

- ACL acquisitions from data/acl-full-ledger.csv (MARC-188 harvest, biblio-keyed)
- KCL acquisitions from data/kcl-books.jsonl (354-row MARC harvest, biblio-keyed)
- Verdicts/registry/links already in docs/data/fakeisbn-verification.json
"""
import csv, json, collections, os

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"

d = json.load(open(f"{ROOT}/docs/data/fakeisbn-verification.json"))

acl_items = list(csv.DictReader(open(f"{ROOT}/data/acl-full-ledger.csv")))
acl_by_biblio = {r["biblio"]: r for r in acl_items}

kcl_items = [json.loads(l) for l in open(
    "/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/kcl/data/kcl-books.jsonl")]
kcl_by_biblio = {str(r["biblio"]): r for r in kcl_items}

def clean_price(p):
    p = (p or "").strip()
    try:
        v = float(p)
        return f"{v:.2f}" if v > 0 else ""
    except ValueError:
        return ""

for r in d:
    b = str(r.get("biblio") or "")
    if r["library"] == "ACL Chennai" and b in acl_by_biblio:
        it = acl_by_biblio[b]
        r["copies"] = it["copies"] or ""
        r["date_acquired"] = it["dates_acquired"] or ""
        r["price_shown"] = clean_price(it["price_shown"])
        r["fake_imprint"] = (r.get("fake_imprint") or it.get("imprint", "")).strip() or it.get("imprint", "")
        r["accessions"] = it.get("accessions", "")
    elif r["library"] == "KCL Madurai" and b in kcl_by_biblio:
        it = kcl_by_biblio[b]
        r["copies"] = str(it.get("copies") or "")
        r["date_acquired"] = ";".join(it.get("date_acquired") or [])
        r["price_shown"] = clean_price(str(it.get("cost_total") or ""))
        r["fake_imprint"] = (r.get("fake_imprint") or it.get("imprint", "")).strip() or it.get("imprint", "")
        r["bills"] = ";".join(str(x) for x in (it.get("bill_numbers") or []) if x is not None)

json.dump(d, open(f"{ROOT}/docs/data/fakeisbn-verification.json", "w"), ensure_ascii=False, indent=0)
cols = ["library","city","opac_link","biblio","fake_title","fake_author","fake_imprint","isbn",
        "copies","date_acquired","price_shown","registry_verdict","registry_original_title",
        "registry_original_publisher","registry_original_lang","registry_original_date",
        "verify_isbn_gov_in","verify_openlibrary","verify_worldcat","verify_google_books","accessions","bills"]
with open(f"{ROOT}/data/fakeisbn-verification.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=cols); w.writeheader()
    for r in d: w.writerow({k: r.get(k, "") for k in cols})

# ---------- figure table ----------
def block(r):
    i = (r.get("isbn") or "").replace("-", "")
    for tag, pre in (("978-93-9461", "978939461"), ("978-93-9235", "978939235"), ("978-93-9236", "978939236")):
        if i.startswith(pre): return tag
    return None

hij = [r for r in d if r["registry_verdict"] == "HIJACKED-ALLOCATED-ELSEWHERE"]
print("=== HEADLINE ===")
print(f"total {len(d)} | hijacked {len(hij)} | never {sum(1 for r in d if r['registry_verdict']=='NOT-IN-REGISTRY')} | noisbn {sum(1 for r in d if r['registry_verdict']=='NO-ISBN-IN-CATALOG')}")
for lib in ("ACL Chennai", "KCL Madurai"):
    rs = [r for r in d if r["library"] == lib]
    h = [r for r in rs if r["registry_verdict"] == "HIJACKED-ALLOCATED-ELSEWHERE"]
    print(f"{lib}: rows {len(rs)} hijacked {len(h)} blocks {collections.Counter(x for x in (block(r) for r in h) if x)}")
print(f"hijacked blocks total: {collections.Counter(x for x in (block(r) for r in hij) if x)}")
imp = [r for r in hij if any(x in (r.get("fake_imprint") or "").lower() for x in ("phoenix", "akalvilakku", "akal vilakku"))]
print(f"hijacked with fake imprint on book: {len(imp)}")
print("=== ACQUISITION ===")
allcop = sum(int(r["copies"]) for r in d if r.get("copies") and str(r["copies"]).isdigit())
print(f"copies total: {allcop}")
for lib in ("ACL Chennai", "KCL Madurai"):
    rs = [r for r in d if r["library"] == lib]
    dc = collections.Counter(); pc = collections.Counter()
    for r in rs:
        n = int(r["copies"]) if r.get("copies") and str(r["copies"]).isdigit() else 0
        for dt in filter(None, (r.get("date_acquired") or "").split(";")):
            dc[dt] += n; pc[dt] += 1
    cost = sum(float(r["price_shown"]) for r in rs if r.get("price_shown"))
    priced = sum(1 for r in rs if r.get("price_shown"))
    print(f"{lib}: dated-records {sum(pc.values())} waves(copies) {dc.most_common(3)} priced {priced} cost ₹{cost:,.2f}")
prices = [float(r["price_shown"]) for r in d if r.get("price_shown")]
print(f"price range ₹{min(prices):,.0f}–₹{max(prices):,.0f} | priced rows {len(prices)} | visible ₹{sum(prices):,.2f}")
pcc = collections.Counter(round(float(r["price_shown"])) for r in d if r.get("price_shown"))
print("recurring price points (≥3):", [f"₹{p:,}×{n}" for p, n in pcc.most_common(8) if n >= 3])
print("=== DONE — JSON + CSV rewritten ===")
