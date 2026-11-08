#!/usr/bin/env python3
"""Parse KCL detail + MARC HTML into kcl-books.jsonl + kcl-summary.json."""
import json, os, re, html, glob

ROOT = "/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/kcl"
OUT  = open(f"{ROOT}/data/kcl-books.jsonl", "w")

def clean(s): return re.sub(r"\s+", " ", html.unescape(re.sub(r"<[^>]+>", " ", s))).strip()

bibs = json.load(open(f"{ROOT}/data/phoenix-biblio-list.json"))
rows = []
for b in bibs:
    det = f"{ROOT}/marc/kd-{b}.html"
    mar = f"{ROOT}/marc/km-{b}.html"
    raw = open(det, encoding="utf-8", errors="replace").read()
    i = raw.find("Normal view")
    t = clean(raw[i:i+3000])
    title = re.split(r"\sBy:\s|\sMaterial type:", t)[0].replace("Normal view MARC view ISBD view", "").strip()
    author = (re.search(r"By:\s(.*?)(?:\sMaterial type:|\sPublication details:)", t) or [None,""])[1].strip()
    pub = (re.search(r"Publication details:\s(.*?)(?:\sDescription:|\sISBN:)", t) or [None,""])[1].strip()
    isbn = ((re.search(r"ISBN:\s*([0-9\-Xx ]{10,20})", t) or [None,""])[1]).strip()
    year = (re.search(r"\b(19|20)\d{2}\b", pub) or [None,""])[0]
    rawm = open(mar, encoding="utf-8", errors="replace").read()
    j = rawm.find("Date acquired")
    h = clean(rawm[j:j+20000])
    copies = re.findall(
        r"(\d{2}/\d{2}/\d{4})\s+(?:([\d,]+\.\d{2})\s+)?(\S+?)\s+(\d{4,8})\s+(?=\d{1,3}\.\d+[A-Z ])",
        h)
    fixed = []
    for date, cost, bill, acc in copies:
        if re.fullmatch(r"[\d,]+\.\d{2}", bill):
            cost = cost or bill
            bill = None
        fixed.append((date, cost, bill, acc))
    copies = fixed
    acq = sorted(set(c[0] for c in copies))
    bills = sorted(set(c[2] for c in copies))
    accs  = [c[3] for c in copies]
    costs = [c[1] for c in copies if c[1]]
    rows.append(dict(biblio=b, title=title[:200], author=author[:120], imprint=pub[:120],
                     year=year, isbn=isbn, copies=len(accs), accessions=accs,
                     date_acquired=acq, bill_numbers=bills,
                     costs=costs, cost_total=sum(float(c.replace(',','')) for c in costs)))
    OUT.write(json.dumps(rows[-1], ensure_ascii=False) + "\n")
OUT.close()

tot = sum(r["cost_total"] for r in rows)
priced = sum(r["copies"] for r in rows if r["cost_total"])
nocost = sum(r["copies"] for r in rows if not r["cost_total"])
bills = {}
for r in rows:
    for bl in r["bill_numbers"]:
        bills[bl] = bills.get(bl, 0) + r["copies"]
waves = {}
for r in rows:
    for d in r["date_acquired"]:
        waves[d] = waves.get(d, 0) + 1
years = {}
for r in rows:
    years[r["year"]] = years.get(r["year"], 0) + 1
summary = dict(records=len(rows), copies=sum(r["copies"] for r in rows),
               cost_visible=round(tot, 2), priced_copies=priced, unpriced_copies=nocost,
               waves=waves, bills=bills, years=years)
json.dump(summary, open(f"{ROOT}/data/kcl-summary.json", "w"), indent=1, ensure_ascii=False)
print(json.dumps(summary, indent=1, ensure_ascii=False))
