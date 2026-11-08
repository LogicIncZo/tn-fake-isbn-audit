#!/usr/bin/env python3
"""KCL full-catalog sweep: letter-by-letter title search, 20/page.
Output: data/kcl-full-catalog.jsonl (biblio, title, author). Resumable via done-set."""
import json, os, re, subprocess, time, html, string

BASE = "http://122.184.84.190:1011/cgi-bin/koha/opac-search.pl"
UA = "AramResearchDesk/1.0 (public-interest catalog audit)"
OUT = "/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/data/kcl-full-catalog.jsonl"
LETTERS = list(string.ascii_lowercase) + [str(d) for d in range(0, 10)]

def fetch(url):
    r = subprocess.run(["curl","-s","-m","45","-A",UA,url], capture_output=True, text=True)
    return r.stdout

def clean(s): return re.sub(r'\s+',' ',html.unescape(re.sub(r'<[^>]+>',' ',s))).strip()

done = set()
if os.path.exists(OUT):
    for line in open(OUT):
        try: done.add(json.loads(line)["biblio"])
        except Exception: pass
w = open(OUT, "a")
total = 0
for L in LETTERS:
    q = f"ti:{L}"
    off = 0
    while True:
        html = fetch(f"{BASE}?q={q}&offset={off}")
        entries = re.findall(r'opac-detail\.pl\?biblionumber=(\d+)" class="title"[^>]*>(.*?)</a>', html, re.S)
        authors = re.findall(r'<ul class="author resource_list">(.*?)</ul>', html, re.S)
        pairs = list(zip(entries, authors)) or [(e, "") for e in entries]
        if not pairs: break
        new = 0
        for (b, t), a in pairs:
            if b in done: continue
            w.write(json.dumps(dict(biblio=b, title=clean(t), author=clean(a), query=q), ensure_ascii=False) + "\n")
            done.add(b); new += 1
        w.flush()
        total += new
        print(f"{L} off={off}: page {len(entries)} entries, {new} new, cumulative {total}", flush=True)
        if len(entries) < 20: break
        off += 20
        time.sleep(1.8)
print(f"LETTER SWEEP DONE: {total} records, {len(done)} unique", flush=True)
