import json, subprocess, sys, time

D = "/home/workspace/Projects/tn-fake-isbn-audit"
ROOT = D
OUT = f"{D}/data/full-registry-lookup.jsonl"
UA = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"

def isbns(p):
    out = []
    seen = set()
    for l in open(p):
        r = json.loads(l)
        i = r.get("isbn")
        if not i or i in ("null", ""):
            continue
        n = i.replace(" ", "").replace("-", "")
        if n not in seen:
            seen.add(n)
            out.append(n)
    return out

targets = json.load(open(f"{ROOT}/data/acl-phoenix-todo.json"))
done = set()
try:
    for l in open(OUT):
        done.add(json.loads(l)["isbn"])
except FileNotFoundError:
    pass
targets = [t for t in targets if t not in done]
print(f"to verify: {len(targets)} (done: {len(done)})", flush=True)

script = r'''
import json, sys, subprocess
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
    return json.loads(r.stdout)
out = open(sys.argv[1], "a")
for n in sys.argv[2:]:
    rec = {"isbn": n, "total": 0, "rows": []}
    d = None
    for attempt in range(3):
        try:
            d = search(n)
            if d.get("recordsTotal") is not None:
                break
        except Exception:
            pass
        import time; time.sleep(3)
    if d is not None:
        try:
            rec["total"] = int(d.get("recordsTotal") or 0)
            rec["rows"] = json.loads(d.get("data") or "[]")[:3]
        except Exception as e:
            rec["error"] = str(e)[:120]
    else:
        rec["error"] = "no response after retries"
    out.write(json.dumps(rec) + "\n")
    out.flush()
'''
open("/tmp/regverify.py", "w").write(script)
# push script + run in batches over ocitwo
subprocess.run(["/home/workspace/Skills/ocitwo-access/scripts/ocitwo.sh", "put", "/tmp/regverify.py", "/tmp/regverify.py"], check=True)

B = 12
for i in range(0, len(targets), B):
    batch = targets[i:i+B]
    subprocess.run(["/home/workspace/Skills/ocitwo-access/scripts/ocitwo.sh", "exec", "rm -f /tmp/regverify-out.jsonl"], capture_output=True)
    r = subprocess.run(["/home/workspace/Skills/ocitwo-access/scripts/ocitwo.sh", "exec",
                        f"python3 /tmp/regverify.py /tmp/regverify-out.jsonl {' '.join(batch)}"],
                       capture_output=True, text=True, timeout=600)
    if r.returncode != 0:
        print("batch err:", r.stderr[:200], flush=True)
    # pull results
    subprocess.run(["/home/workspace/Skills/ocitwo-access/scripts/ocitwo.sh", "get", "/tmp/regverify-out.jsonl", "/tmp/regverify-out.jsonl"], check=False)
    try:
        for l in open("/tmp/regverify-out.jsonl"):
            rec = json.loads(l)
            if rec["isbn"] not in done:
                done.add(rec["isbn"])
                with open(OUT, "a") as f:
                    f.write(json.dumps(rec) + "\n")
        open("/tmp/regverify-out.jsonl", "w").close()
    except FileNotFoundError:
        pass
    print(f"{min(i+B, len(targets))}/{len(targets)}", flush=True)
print("VERIFY DONE", flush=True)
