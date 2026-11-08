#!/usr/bin/env python3
"""Fetch detail+MARC pages for every biblio hit found by stem_sweep. Output: <cat>/hits-detail.jsonl"""
import json, os, re, subprocess, sys, time

BASE = {"acl": "http://118.185.210.241:8001", "kcl": "http://122.184.84.190:1011"}
ROOT = "/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/full-sweep"
UA = "AramResearchDesk/1.0 (public-interest catalog audit)"

def fetch(url, out, timeout=45):
    r = subprocess.run(["curl","-s","-m",str(timeout),"-A",UA,"-o",out,"-w","%{http_code}",url],
                       capture_output=True, text=True)
    return r.stdout.strip()

def run(cat):
    hits = json.load(open(f"{ROOT}/{cat}/stem-hits.json"))
    biblios = sorted({b for v in hits.values() for b in v}, key=int)
    outf = f"{ROOT}/{cat}/hits-detail.jsonl"
    have = set()
    if os.path.exists(outf):
        for line in open(outf):
            try: have.add(json.loads(line)["biblio"])
            except Exception: pass
    with open(outf, "a") as w:
        for b in biblios:
            if b in have: continue
            d = f"{ROOT}/{cat}/d-{b}.html"; m = f"{ROOT}/{cat}/m-{b}.html"
            ok = 0
            for url, out in ((f"{BASE[cat]}/cgi-bin/koha/opac-detail.pl?biblionumber={b}", d),
                             (f"{BASE[cat]}/cgi-bin/koha/opac-detail.pl?biblionumber={b}&view=marc", m)):
                for attempt in range(2):
                    if fetch(url, out) == "200" and os.path.getsize(out) > 4000:
                        ok += 1; break
                    time.sleep(6)
                time.sleep(2.0)
            if ok == 2:
                det = open(d, encoding="utf-8", errors="replace").read()
                mar = open(m, encoding="utf-8", errors="replace").read()
                title = re.search(r'<h1 class="title">(.*?)</h1>', det, re.S)
                def clean(s): return re.sub(r'\s+',' ',re.sub(r'<[^>]+>',' ',s)).strip()
                rec = {"biblio": b, "stems": [s for s,v in hits.items() if b in v],
                       "title": clean(title.group(1)) if title else "",
                       "author": clean(m.group(1)) if (title:=None) else "",
                       "raw_detail": det[:120000], "raw_marc": mar[:120000]}
                w.write(json.dumps(rec, ensure_ascii=False)+"\n"); w.flush()
                os.remove(d); os.remove(m)
                print(f"{cat} {b} ok ({sum(1 for _ in open(outf))}/{len(biblios)})", flush=True)
            else:
                print(f"{cat} {b} FAIL", flush=True)
    print(f"{cat} DETAIL DONE {sum(1 for _ in open(outf))}/{len(biblios)}", flush=True)

run(sys.argv[1])
