#!/usr/bin/env python3
"""Merge the two ACL extractions into one full ledger.

Input:
  data/acl-full-ledger.csv   (biblio 526xxx: copies, dates, prices, shelf; ISBN lossy)
  data/acl-books.jsonl       (biblio 510xxx: title, imprint, ISBN complete)
Output:
  data/acl-full-ledger.csv   (rewritten in place: biblio + copies/dates/price/shelf + isbn/imprint)
"""
import csv, json, re, os, collections

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"
LED = os.path.join(ROOT, "data", "acl-full-ledger.csv")
SRC = os.path.expanduser("/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/acl/data/acl-books.jsonl")

def norm_title(t):
    t = (t or "").lower()
    t = re.sub(r"[^a-z0-9]+", " ", t)
    return t.strip()

def norm_isbn(i):
    return re.sub(r"[^0-9Xx]", "", i or "")

ledger = list(csv.DictReader(open(LED)))
src = [json.loads(l) for l in open(SRC)]
src_by_title = collections.defaultdict(list)
for r in src:
    src_by_title[norm_title(r["title"])].append(r)

matched, unmatched = 0, []
for row in ledger:
    cands = src_by_title.get(norm_title(row["title"]), [])
    pick = None
    li = norm_isbn(row.get("isbn"))
    if len(cands) == 1:
        pick = cands[0]
    else:
        for c in cands:
            if norm_isbn(c.get("isbn")) == li and li:
                pick = c
                break
        if pick is None and len(cands) == 1:
            pick = cands[0]
    if pick:
        row["isbn"] = pick.get("isbn") or row.get("isbn", "")
        row["imprint"] = pick.get("imprint") or row.get("imprint", "")
        matched += 1
    else:
        unmatched.append(row["biblio"])

fields = ["biblio", "title", "author", "imprint", "isbn", "copies", "accessions", "dates_acquired", "price_shown", "shelf"]
with open(LED, "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=fields)
    w.writeheader()
    w.writerows(ledger)

isbns = sum(1 for r in ledger if norm_isbn(r.get("isbn")))
print(f"matched {matched}/188; isbn coverage now {isbns}/188; unmatched: {unmatched[:6]}")
