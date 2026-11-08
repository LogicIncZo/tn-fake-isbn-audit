import json, subprocess

def q(prefix):
    payload = json.dumps({
        "data": {"draw": 1, "start": 0, "length": 2000, "search": {"value": ""}},
        "_obj": {"Type": "isbn_number_Nodash", "SearchValue": prefix, "ViewReport": 1},
    })
    out = subprocess.run(
        ["curl", "-s", "-m", "40", "-X", "POST", "https://isbn.gov.in/Home/FillSearchText",
         "-H", "Content-Type: application/json; charset=utf-8",
         "-H", "X-Requested-With: XMLHttpRequest",
         "-A", "Mozilla/5.0", "--data", payload],
        capture_output=True, text=True).stdout
    d = json.loads(out)
    recs = json.loads(d["data"]) if isinstance(d.get("data"), str) else d.get("data", [])
    from collections import Counter
    pc = Counter(r.get('publisher','') for r in recs)
    pubs = sorted({r.get("publisher", "") for r in recs})
    langs = sorted({r.get("language", "") for r in recs})
    print(f"{prefix}: {d['recordsTotal']} total | publishers: {dict(pc)} | langs: {langs}")
    return d["recordsTotal"]

for p in ["978937450", "978937700", "9789389780", "9789347000", "9789392360", "978937583", "978937771", "978938979", "978934701"]:
    q(p)
    q(p)
