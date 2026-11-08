import csv, json, re, html as H, os, collections

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"
EV = f"{ROOT}/evidence/acl-marc-188"
vjson = json.load(open(f"{ROOT}/docs/data/fakeisbn-verification.json"))
acl = [r for r in vjson if r["library"] == "ACL Chennai"]

def strip(s): return H.unescape(re.sub(r"\s+", " ", re.sub(r"<[^>]+>", "|", s)))

def parse(b):
    p = f"{EV}/m-{b}.html"
    if not os.path.exists(p): return None
    h = open(p, encoding="utf-8", errors="replace").read()
    h = re.sub(r"<script.*?</script>", "", h, flags=re.S)
    cells = [c.strip() for c in strip(h).split("|")]
    cells = [c for c in cells if c and c != "\xa0"]
    items, cur = [], []
    for c in cells:
        cur.append(c)
        if re.fullmatch(r"\d{5,7}", c) and len(cur) >= 7:
            items.append(cur[-8:]); cur = []
    out = []
    for it in items:
        date = next((c for c in it if re.fullmatch(r"\d{2}\.\d{2}\.\d{4}", c)), "")
        accession = next((c for c in it if re.fullmatch(r"\d{5,7}", c)), "")
        price = next((c for c in it if re.fullmatch(r"\d+\.\d{2}", c)), "")
        shelf = next((c for c in it if re.search(r"[A-Za-z]", c) and c != date), "")
        out.append({"shelf": shelf, "date": date, "price": price, "accession": accession})
    return out

ledger = []
for r in acl:
    b = r["biblio"]
    items = parse(b) or []
    dates = sorted({i["date"] for i in items if i["date"]})
    prices = [float(i["price"]) for i in items if i["price"]]
    shelf = "; ".join(sorted({i["shelf"] for i in items if i["shelf"]}))
    ledger.append({"biblio": b, "title": r["fake_title"], "author": r["fake_author"],
        "isbn": r["isbn"], "copies": len(items), "accessions": ";".join(i["accession"] for i in items),
        "dates_acquired": ";".join(dates), "price_shown": f"{prices[0]:.2f}" if prices else "",
        "shelf": shelf})

with open(f"{ROOT}/data/acl-full-ledger.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=list(ledger[0].keys())); w.writeheader(); w.writerows(ledger)

n = sum(r["copies"] for r in ledger)
waves = collections.Counter()
for r in ledger:
    for d in r["dates_acquired"].split(";"):
        if d: waves[d] += r["copies"]
pr = collections.Counter(r["price_shown"] for r in ledger if r["price_shown"])
print("rows:", len(ledger), "copies:", n)
print("waves:", waves.most_common(4))
print("top prices:", pr.most_common(5))
print("rows with price:", sum(1 for r in ledger if r["price_shown"]), "with dates:", sum(1 for r in ledger if r["dates_acquired"]))
