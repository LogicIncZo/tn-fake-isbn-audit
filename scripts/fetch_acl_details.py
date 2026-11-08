#!/usr/bin/env python3
"""Fetch ACL biblio detail pages for stem-sweep hits; extract to acl-books.jsonl. Resumable."""
import json, os, re, subprocess, sys, time, html as H

D = "/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit"
BASE = "http://118.185.210.241:8001"
UA = "AramResearchDesk/1.0 (public-interest catalog audit)"
MARC = f"{D}/full-sweep/acl/marc"
OUT = f"{D}/acl/data/acl-books.jsonl"
os.makedirs(MARC, exist_ok=True); os.makedirs(f"{D}/acl/data", exist_ok=True)

def clean(s): return re.sub(r"\s+", " ", H.unescape(re.sub(r"<[^>]+>", " ", s))).strip()

def fetch(url, out):
    for _ in range(3):
        r = subprocess.run(["curl","-s","-m","35","-A",UA,"-o",out,"-w","%{http_code}",url], capture_output=True, text=True)
        if r.stdout.strip() == "200" and os.path.exists(out) and os.path.getsize(out) > 3000:
            return True
        time.sleep(8)
    return False

def parse(b, path):
    raw = open(path, encoding="utf-8", errors="replace").read()
    r = {"biblio": b}
    m = re.search(r'<h1[^>]*>(.*?)</h1>', raw, re.S)
    if m: r["title"] = clean(m.group(1))[:150]
    m = re.search(r'class="author resource_list">(.*?)</ul>', raw, re.S)
    if m: r["author"] = clean(m.group(1))[:100]
    isbns = re.findall(r'property="isbn">([0-9Xx \-]+)<', raw)
    r["isbn"] = isbns[0].replace(" ","").replace("-","") if isbns else None
    m = re.search(r'Publisher info(.*?)</span>', raw, re.S) or re.search(r'class="publisherInfo">(.*?)</span>', raw, re.S)
    if not m:
        m = re.search(r'<span class="results_summary publisher">(.*?)</span>', raw, re.S)
    if m: r["imprint"] = clean(m.group(1))[:120]
    m = re.search(r'Date acquired(.*?)(?=Full call number|Withdrawn|Lost status)', raw, re.S)
    if m:
        h = clean(m.group(1))
        r["date_acquired"] = sorted(set(re.findall(r"\d{2}\.\d{2}\.\d{4}", h)))
        r["accessions"] = sorted(set(re.findall(r"\b(6\d{5}|7\d{5})\b", h)))
        costs = re.findall(r"([\d,]+\.\d{2})", h)
        r["costs"] = [float(c.replace(",","")) for c in costs if float(c.replace(",","")) > 100]
    return r

done = set()
if os.path.exists(OUT):
    for l in open(OUT):
        try: done.add(str(json.loads(l)["biblio"]))
        except Exception: pass
new = json.load(open(f"{D}/full-sweep/new-to-fetch.json"))["acl"]["new"]
todo = [b for b in new if b not in done]
print(f"{len(todo)} to fetch ({len(done)} already done)", flush=True)
for i, b in enumerate(todo):
    det = f"{MARC}/k-{b}.html"
    if not fetch(f"{BASE}/cgi-bin/koha/opac-detail.pl?biblionumber={b}", det):
        print(f"FAIL {b}", flush=True); continue
    try:
        rec = parse(b, det)
        with open(OUT, "a") as f: f.write(json.dumps(rec, ensure_ascii=False) + "\n")
    except Exception as e:
        print(f"PARSE-FAIL {b}: {e}", flush=True)
    if i % 20 == 0: print(f"{i}/{len(todo)}", flush=True)
    time.sleep(1.2)
print("DONE", flush=True)
