#!/usr/bin/env python3
"""isbn.gov.in registry lookups on ocitwo (Indian vantage).
Usage (on ocitwo): python3 lookups.py <isbn_list.txt> <out.jsonl>
Resumable: skips ISBNs already in out.jsonl. ~1.1s/lookup."""
import json, subprocess, sys, time, os

LIST, OUT = sys.argv[1], sys.argv[2]
done = set()
if os.path.exists(OUT):
    with open(OUT) as f:
        for line in f:
            try:
                done.add(json.loads(line)["isbn"])
            except Exception:
                pass
todo = [l.strip() for l in open(LIST) if l.strip() and l.strip() not in done]
print(f"{len(todo)} to fetch ({len(done)} cached)", flush=True)

def search(n):
    body = json.dumps({"data": {"draw": 1, "start": 0, "length": 100, "search": {"value": ""}},
                       "_obj": {"Type": "isbn_number_Nodash", "SearchValue": n, "ViewReport": 11}})
    cmd = ["curl", "-s", "-m", "25",
           "-H", "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36",
           "-H", "Content-Type: application/json",
           "-H", "X-Requested-With: XMLHttpRequest",
           "-H", "Referer: https://isbn.gov.in/Home/IsbnSearch",
           "--data-raw", body, "https://isbn.gov.in/Home/FillSearchText"]
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
    d = json.loads(r.stdout)
    rows = []
    if d.get("data") and isinstance(d["data"], str):
        rows = json.loads(d["data"])
    return {"isbn": n, "total": d.get("recordsTotal", 0), "rows": rows}

out = open(OUT, "a", encoding="utf-8")
t0 = time.time()
for i, n in enumerate(todo):
    rec = {"isbn": n, "total": 0, "rows": [], "error": None}
    for attempt in range(3):
        try:
            rec = search(n)
            break
        except Exception as e:
            rec["error"] = str(e)[:120]
            time.sleep(4)
    out.write(json.dumps(rec, ensure_ascii=False) + "\n")
    out.flush()
    if (i + 1) % 100 == 0:
        rate = (i + 1) / (time.time() - t0)
        print(f"{i+1}/{len(todo)}  {rate:.2f}/s", flush=True)
    time.sleep(1.1)
print("done", flush=True)
