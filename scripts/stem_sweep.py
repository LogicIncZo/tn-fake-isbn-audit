#!/usr/bin/env python3
"""Tier-1 sweep: search every fake-publisher ISBN stem in ACL + KCL catalogs.
Throttled 2s, resumable (state file per catalog). Output: <cat>/stem-hits.json"""
import json, os, re, subprocess, sys, time, fcntl
PID = os.getpid()

CATS = {
 "acl": "http://118.185.210.241:8001",
 "kcl": "http://122.184.84.190:1011",
}
ROOT = "/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/full-sweep"
UA = "AramResearchDesk/1.0 (public-interest catalog audit)"
STEMS = json.load(open(f"{ROOT}/../data/fake-stems.json"))

def fetch(url, out, timeout=40):
    r = subprocess.run(["curl","-s","-m",str(timeout),"-A",UA,"-o",out,"-w","%{http_code}",url],
                       capture_output=True, text=True)
    return r.stdout.strip()

def parse_biblios(path):
    if not os.path.exists(path): return []
    html = open(path, encoding="utf-8", errors="replace").read()
    return sorted(set(re.findall(r'biblionumber=(\d+)', html)), key=int)

def sweep(cat, base):
    lock = open(f"{ROOT}/{cat}.lock", "w")
    try:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
    except OSError:
        print(f"{cat} sweep already running, exiting", flush=True); return
    state = f"{ROOT}/{cat}/stem-hits.json"
    done = {}
    if os.path.exists(state):
        done = json.load(open(state))
    for st in STEMS:
        if st in done: continue
        biblios = set()
        offset = 0
        for page in range(40):
            out = f"{ROOT}/{cat}/search-{st}-{page}-{PID}.html"
            url = f"{base}/cgi-bin/koha/opac-search.pl?q={st}&offset={offset}"
            code = fetch(url, out)
            if code != "200":
                time.sleep(6); code = fetch(url, out)          # one retry
            if code != "200":
                print(f"{cat} {st} page{page} HTTP {code}, aborting stem", flush=True)
                break
            got = parse_biblios(out)
            if not got:
                if os.path.exists(out): os.remove(out)
                break
            biblios |= set(got)
            if os.path.exists(out): os.remove(out)
            if len(got) < 20: break
            offset += 20
            time.sleep(2.0)
        done[st] = sorted(biblios, key=int)
        json.dump(done, open(state, "w"))
        print(f"{cat} {st}: {len(done[st])} biblio hits", flush=True)
        time.sleep(2.0)
    print(f"{cat} SWEEP DONE: {sum(len(v) for v in done.values())} hits across {sum(1 for v in done.values() if v)} stems", flush=True)

if __name__ == "__main__":
    which = sys.argv[1]
    sweep(which, CATS[which])
