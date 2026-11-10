#!/usr/bin/env python3
"""ACL Phoenix-wave expansion sweep: search ACL OPAC publisher index (idx=pb)
for the fake publishers found in KCL (Phoenix Publications, Ed-Tech),
fetch every hit's detail page, classify ISBNs against the merged
isbn.gov.in registry cache. Resumable; ~1.2 s between calls.

Usage: python3 acl_phoenix_sweep.py collect|details|classify
"""
import json, os, re, subprocess, sys, time, html as H, urllib.parse

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"
BASE = "http://118.185.210.241:8001"
UA = "AramResearchDesk/1.0 (public-interest catalog audit)"
EV = f"{ROOT}/evidence/acl-phoenix-sweep"
BIBS = f"{ROOT}/data/acl-phoenix-bibs.json"
DETAILS = f"{ROOT}/data/acl-phoenix-details.jsonl"
PAGES = f"{EV}/search-pages"
QUERIES = [("Phoenix", ["idx=pb&q=Phoenix", "idx=pb&q=%22Phoenix%20Publications%22"]),
           ("Ed-Tech", ["idx=pb&q=%22Ed-Tech%22"])]
SLEEP = 1.2

os.makedirs(PAGES, exist_ok=True)

def http(url, out=None):
    tmp = out or "/tmp/acl-phx-page.html"
    for _ in range(3):
        r = subprocess.run(["curl", "-s", "-m", "35", "-A", UA, "-o", tmp, "-w", "%{http_code}", url],
                           capture_output=True, text=True)
        if r.stdout.strip() == "200" and os.path.exists(tmp) and os.path.getsize(tmp) > 2000:
            body = open(tmp, encoding="utf-8", errors="replace").read()
            if out is None:
                try: os.remove(tmp)
                except OSError: pass
            return body
        time.sleep(8)
    return ""

def collect():
    bibs = {}
    if os.path.exists(BIBS):
        bibs = json.load(open(BIBS))
    for label, qs in QUERIES:
        q = qs[0].replace("idx=pb&q=", "idx=pb&q=").replace("%22", '"')
        rss_q = q + "&format=rss"
        # total from first page
        url = f"{BASE}/cgi-bin/koha/opac-search.pl?{rss_q}&do=Search&count=50&offset=0"
        fn = f"{PAGES}/{label.replace(' ','')}-rss-0.xml"
        h = http(url, fn)
        m = re.search(r"<opensearch:totalResults>\s*(\d+)", h)
        total = int(m.group(1)) if m else 0
        print(f"  {label}: total={total}", flush=True)
        page = 0
        while page * 50 < (total or 0):
            off = page * 50
            url = f"{BASE}/cgi-bin/koha/opac-search.pl?{rss_q}&do=Search&count=50&offset={off}"
            fn = f"{PAGES}/{label.replace(' ','')}-rss-{page}.xml"
            h = http(url, fn)
            ids = sorted(set(re.findall(r"biblionumber=(\d+)", h)))
            for b in ids:
                bibs.setdefault(b, label)
            print(f"    off={off}: {len(ids)} ids (pool={len(bibs)})", flush=True)
            if not ids:
                break
            page += 1
            time.sleep(SLEEP)
    json.dump(bibs, open(BIBS, "w"), indent=1)
    print(f"collect done: {len(bibs)} unique bibs -> {BIBS}")

def clean(s): return re.sub(r"\s+", " ", H.unescape(re.sub(r"<[^>]+>", " ", s))).strip()

def parse(b, raw):
    r = {"biblio": b, "wave": None}
    m = re.search(r'<h1 class="title"[^>]*>([^<]*)', raw)
    if m: r["title"] = clean(m.group(1))[:200]
    m = re.search(r'results_summary author.*?q=au:%22([^"]*?)%22', raw, re.S)
    if m: r["author"] = clean(urllib.parse.unquote(m.group(1)))[:120]
    isbns = re.findall(r'property="isbn">([0-9Xx \-]+)<', raw)
    r["isbn"] = isbns[0].replace(" ", "").replace("-", "") if isbns else None
    m = re.search(r'results_summary publisher">(.*?)</span>\s*</div>', raw, re.S) or re.search(r'results_summary publisher">(.*?)</span>', raw, re.S)
    if m: r["imprint"] = clean(m.group(1))[:140]
    r["copies"] = len(re.findall(r'<td class="barcode"[^>]*>(\d+)', raw))
    r["accessions"] = sorted(set(re.findall(r'<td class="barcode"[^>]*>(\d+)', raw)))
    r["date_acquired"] = None
    r["costs"] = None
    m = re.search(r'Date acquired(.*?)(?=Full call number|Withdrawn|Lost status)', raw, re.S)
    if m:
        h = clean(m.group(1))
        r["date_acquired"] = sorted(set(re.findall(r"\d{2}\.\d{2}\.\d{4}", h)))
        r["accessions"] = sorted(set(re.findall(r"\b(6\d{5}|7\d{5})\b", h)))
        costs = re.findall(r"([\d,]+\.\d{2})", h)
        r["costs"] = [float(c.replace(",", "")) for c in costs if float(c.replace(",", "")) > 100]
    return r

def details():
    done = set()
    if os.path.exists(DETAILS):
        for l in open(DETAILS):
            try: done.add(str(json.loads(l)["biblio"]))
            except Exception: pass
    bibs = json.load(open(BIBS))
    todo = [b for b in bibs if b not in done]
    print(f"details: {len(todo)} to fetch ({len(done)} done)", flush=True)
    for i, b in enumerate(todo):
        raw = http(f"{BASE}/cgi-bin/koha/opac-detail.pl?biblionumber={b}")
        if not raw or "opac-detail" not in raw[:4000]:
            print(f"FAIL {b}", flush=True); continue
        rec = parse(b, raw)
        rec["wave"] = bibs[b]
        with open(DETAILS, "a") as f:
            f.write(json.dumps(rec, ensure_ascii=False) + "\n")
        if (i + 1) % 25 == 0:
            print(f"  {i+1}/{len(todo)}", flush=True)
        time.sleep(SLEEP)
    print("details done")

def classify():
    regs = {}
    for f in ("full-registry-lookup.jsonl", "kcl-registry-full.jsonl"):
        p = f"{ROOT}/data/{f}"
        for l in open(p):
            try:
                d = json.loads(l); regs[d["isbn"]] = d
            except Exception: pass
    recs = [json.loads(l) for l in open(DETAILS)]
    out, hij = [], 0
    for r in recs:
        isbn = r.get("isbn") or ""
        d = regs.get(isbn)
        if d is None:
            v = "NEEDS-LOOKUP"
        else:
            rows = d.get("rows") or []
            if d.get("total", 0) == 0:
                v = "NEVER-ALLOCATED"
            elif rows and any("Phoenix" in (x.get("registrant") or "") for x in rows):
                v = "REGISTERED-PHOENIX"
            else:
                v = "HIJACKED-ALLOCATED-ELSEWHERE"; hij += 1
        r["verdict"] = v
        out.append(r)
    json.dump(out, open(f"{ROOT}/data/acl-phoenix-audit.json", "w"), indent=1)
    import collections
    print("verdicts:", collections.Counter(r["verdict"] for r in out).most_common())
    need = sorted({r["isbn"] for r in out if r["verdict"] == "NEEDS-LOOKUP" and r["isbn"]})
    json.dump(need, open(f"{ROOT}/data/acl-phoenix-need-lookup.json", "w"))
    print(f"{len(need)} ISBNs need registry lookup -> acl-phoenix-need-lookup.json")

if __name__ == "__main__":
    {"collect": collect, "details": details, "classify": classify}[sys.argv[1]]()
