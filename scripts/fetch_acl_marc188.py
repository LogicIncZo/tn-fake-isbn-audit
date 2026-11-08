import json, os, re, subprocess, time, html as H

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"
EV = f"{ROOT}/evidence/acl-marc-188"
BASE = "http://118.185.210.241:8001"
UA = "Mozilla/5.0 (X11; Linux x86_64) ZoResearch/1.0"
rows = [r for r in json.load(open(f"{ROOT}/docs/data/fakeisbn-verification.json")) if r["library"] == "ACL Chennai"]
def fetch(b):
    out = f"{EV}/m-{b}.html"
    if os.path.exists(out) and os.path.getsize(out) > 20000: return
    subprocess.run(["curl", "-s", "-m", "35", "-A", UA, "-o", out,
                    f"{BASE}/cgi-bin/koha/opac-MARCdetail.pl?biblionumber={b}"], check=False)
    time.sleep(0.6)
for i, r in enumerate(rows, 1):
    fetch(r["biblio"])
    if i % 30 == 0: print(i, flush=True)
print("DONE", len(rows))
