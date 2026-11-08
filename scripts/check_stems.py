#!/usr/bin/env python3
"""Registry stem checker: isbn.gov.in allocations per ISBN prefix stem.

Input: stems CSV (stem,count) or bare stems on argv. Runs on ocitwo (Indian vantage).
POSTs isbn.gov.in/Home/FillSearchText prefix query per stem, 1 rps, resumable
state in stems-state.json. Output: stems-registry.json {stem: {recordsTotal, sample}}.
Honest UA; like-search (ViewReport=1) so partially-allocated stems are visible.
"""
import json, os, sys, time, urllib.request

UA = "AramResearchDesk/1.0 (academic audit; contact via zocomputer)"
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "stems-registry.json")
STATE = OUT.replace(".json", "-state.json")

def load_state():
    if os.path.exists(STATE):
        with open(STATE) as f: return json.load(f)
    return {}

def query_stem(stem):
    body = json.dumps({
        "data": {"draw": 1, "start": 0, "length": 5, "search": {"value": ""}},
        "_obj": {"Type": "isbn_number_Nodash", "SearchValue": stem, "ViewReport": 1}
    }).encode()
    req = urllib.request.Request(
        "https://isbn.gov.in/Home/FillSearchText", data=body,
        headers={"Content-Type": "application/json; charset=utf-8",
                 "X-Requested-With": "XMLHttpRequest", "Referer": "https://isbn.gov.in/Home/IsbnSearch",
                 "User-Agent": UA})
    with urllib.request.urlopen(req, timeout=40) as r:
        d = json.loads(r.read().decode())
    n = d.get("recordsTotal", 0)
    sample = []
    try:
        recs = json.loads(d.get("data") or "[]")
        for x in recs[:5]:
            sample.append({"publisher": (x.get("publisher") or "")[:40],
                           "lang": (x.get("language") or "")[:20],
                           "date": x.get("publicationdate", "")})
    except Exception:
        pass
    return {"total": n, "sample": sample}

def main():
    stems = []
    if len(sys.argv) > 1:
        stems = sys.argv[1:]
    else:
        with open(sys.argv[1] if False else "/dev/stdin") as f:
            for line in f:
                line = line.strip()
                if not line: continue
                stems.append(line.split(",")[0])
    stems = sorted(set(s for s in stems if s.isdigit() and len(s) >= 8))
    state = load_state()
    out = json.load(open(OUT)) if os.path.exists(OUT) else {}
    for i, s in enumerate(stems):
        if state.get(s): continue
        try:
            res = query_stem(s)
        except Exception as e:
            res = {"error": str(e)[:120]}
            state[s] = "err1"
        out[s] = res
        if "error" not in res: state[s] = "ok"
        json.dump(out, open(OUT, "w"), ensure_ascii=False, indent=1)
        json.dump(state, open(STATE, "w"))
        print(f"[{i+1}/{len(stems)}] {s}: {res.get('total', 'ERR')} {[(x['publisher']) for x in res.get('sample', [])][:3]}", flush=True)
        time.sleep(1.0)
    print("done ->", OUT)

if __name__ == "__main__":
    main()
