#!/usr/bin/env python3
"""Fill the imprint column of data/acl-full-ledger.csv from saved MARC
detail captures (evidence/acl-marc-188/m-<biblio>.html), parsing the
MARC 260 field (place / publisher / year)."""
import re, html, csv, os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EV = f"{ROOT}/evidence/acl-marc-188"
LEDGER = f"{ROOT}/data/acl-full-ledger.csv"

def imp_from_page(path):
    h = open(path, encoding="utf-8", errors="replace").read()
    m = re.search(r"260 ##(.*?)(?=<th>\s*\d{3} ##|;\d{2,3} ##|</table)", h, re.S)
    if not m:
        return ""

    def grab(label):
        mm = re.search(r"<td>\s*" + label + r"\s*</td>\s*<td>(.*?)</td>", m.group(1), re.S)
        return html.unescape(re.sub(r"<[^>]+>", "", mm.group(1))).strip() if mm else ""

    place = grab("Place of publication")
    pub = grab("Name of publisher")
    year = grab("Year of publication")
    parts = [p for p in (place, pub, year) if p]
    if not parts:
        return ""
    s = " : ".join(parts[:2])
    if year and len(parts) > 2:
        s += ", " + year
    return s

rows = list(csv.DictReader(open(LEDGER)))
filled = 0
for r in rows:
    p = f"{EV}/m-{r['biblio']}.html"
    if os.path.exists(p):
        v = imp_from_page(p)
        if v:
            r["imprint"] = v
            filled += 1

with open(LEDGER, "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
    w.writeheader()
    w.writerows(rows)
print("imprints filled:", filled, "/", len(rows))
