#!/usr/bin/env python3
"""Fetch KCL opac-detail page for every unique biblio from the full-catalog sweep."""
import json, os, subprocess, time, sys

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"
EV = f"{ROOT}/evidence/kcl-detail-full"
BASE = "http://14.139.56.29:8000"
UA = "Mozilla/5.0 (X11; Linux x86_64) ZoResearch/1.0"
os.makedirs(EV, exist_ok=True)

rows = [json.loads(l) for l in open(f"{ROOT}/data/kcl-books-full.jsonl")]
bibs = sorted({r["bib"] for r in rows}, key=int)
todo = [b for b in bibs if not (os.path.exists(f"{EV}/d-{b}.html") and os.path.getsize(f"{EV}/d-{b}.html") > 15000)]
print(f"bibs {len(bibs)} todo {len(todo)}", flush=True)

for i, b in enumerate(todo, 1):
    out = f"{EV}/d-{b}.html"
    try:
        subprocess.run(["curl", "-s", "-m", "35", "-A", UA, "-o", out,
                        f"{BASE}/cgi-bin/koha/opac-detail.pl?biblionumber={b}"], check=False)
    except Exception as e:
        print("fail", b, e, flush=True)
    if i % 50 == 0:
        print(i, flush=True)
    time.sleep(0.6)
print("DONE", flush=True)
