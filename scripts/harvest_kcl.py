#!/usr/bin/env python3
"""Harvest all 352 KCL Phoenix biblio records: detail + MARC views, resumable."""
import json, os, subprocess, time

ROOT = "/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/kcl"
BIBS = json.load(open(f"{ROOT}/data/phoenix-biblio-list.json"))
BASE = "http://122.184.84.190:1011/cgi-bin/koha"
UA = "AramResearchDesk/1.0 (academic audit)"

def fetch(url, out):
    if os.path.exists(out) and os.path.getsize(out) > 5000:
        return True
    for attempt in range(2):
        r = subprocess.run(["curl", "-s", "-m", "45", "-A", UA, url, "-o", out],
                           capture_output=True, text=True)
        if os.path.exists(out) and os.path.getsize(out) > 5000:
            return True
        time.sleep(4)
    return False

done = fail = 0
for b in BIBS:
    ok1 = fetch(f"{BASE}/opac-detail.pl?biblionumber={b}", f"{ROOT}/marc/kd-{b}.html")
    ok2 = fetch(f"{BASE}/opac-MARCdetail.pl?biblionumber={b}", f"{ROOT}/marc/km-{b}.html")
    if ok1 and ok2:
        done += 1
    else:
        fail += 1
        print(f"FAIL {b}", flush=True)
    time.sleep(1.5)

print(f"DONE {done} OK, {fail} failed", flush=True)
