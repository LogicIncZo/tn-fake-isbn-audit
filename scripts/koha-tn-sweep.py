#!/usr/bin/env python3
"""Sweep TN Koha OPACs for the fake-ISBN factory fingerprints.

Stage 1: discovery — fetch candidate library pages, find Koha/OPAC links.
Stage 2: probe every confirmed Koha OPAC with publisher/ISBN fingerprints.
GET only, ~1 req/s per host, every response saved + logged.

Outputs:
  evidence/koha-tn-sweep/*.html     raw responses
  data/probes-koha-tn-sweep.jsonl   one line per request
  data/koha-tn-sweep.csv            probe results table
"""
import csv, html, json, os, re, sys, time, urllib.request, urllib.error, ssl

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EV = f"{ROOT}/evidence/koha-tn-sweep"
os.makedirs(EV, exist_ok=True)
PROBES = f"{ROOT}/data/probes-koha-tn-sweep.jsonl"
OUT = f"{ROOT}/data/koha-tn-sweep.csv"

UA = "Mozilla/5.0 (X11; Linux x86_64) FakeISBN-Audit/1.0 (research; contact cashlessconsumer.in)"
CTX = ssl.create_default_context(); CTX.check_hostname = False; CTX.verify_mode = ssl.CERT_NONE

def fetch(url, timeout=25):
    req = urllib.request.Request(url, headers={"User-Agent": UA, "Accept": "text/html"})
    t0 = time.time()
    try:
        with urllib.request.urlopen(req, timeout=timeout, context=CTX) as r:
            body = r.read()
            rec = {"url": url, "ts": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
                   "status": r.status, "bytes": len(body), "ms": int((time.time()-t0)*1000)}
    except urllib.error.HTTPError as e:
        body = b""; rec = {"url": url, "ts": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
                           "status": e.code, "bytes": 0, "ms": int((time.time()-t0)*1000), "err": "http"}
    except Exception as e:
        body = b""; rec = {"url": url, "ts": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
                           "status": 0, "bytes": 0, "ms": int((time.time()-t0)*1000), "err": str(e)[:120]}
    rec["sha256"] = __import__("hashlib").sha256(body).hexdigest() if body else ""
    with open(PROBES, "a") as f:
        f.write(json.dumps(rec, ensure_ascii=False) + "\n")
    if body and rec["status"] == 200:
        name = re.sub(r"[^A-Za-z0-9._-]", "_", url.split("://",1)[1])[:90]
        with open(f"{EV}/{name}", "wb") as f:
            f.write(body)
    return rec, body

# ---------- fingerprints ----------
PROBES_Q = [
    ("phoenix",  "pb%3Aphoenix"),
    ("thenmozhi","pb%3AThenmozhi"),
    ("isbn_acl", "nb%3A9789392360091"),
    ("isbn_xlib", "nb%3A9789394612709"),
    ("isbn_reg", "nb%3A9789394612778"),
    ("control",  "pb%3Aoxford"),
]
COUNT_RES = [
    re.compile(r"(\d[\d,]*)\s+results", re.I),
    re.compile(r"1\s*-\s*\d+\s*of\s*(\d[\d,]*)", re.I),
    re.compile(r'id="numresults"[^>]*>\s*.*?(\d[\d,]*)', re.S),
    re.compile(r"(\d[\d,]*)\s*results?\s*found", re.I),
]

def parse_count(body):
    t = body.decode("utf-8", "replace")
    m = re.search(r'id="numresults"[^>]*>([^<]*)', t)
    if m:
        seg = m.group(1)
        if re.search(r"No results", seg, re.I):
            return 0
        d = re.search(r"(\d[\d,]*)", seg)
        if d:
            return int(d.group(1).replace(",", ""))
    for rx in COUNT_RES[:2]:
        m = rx.search(t)
        if m:
            return int(m.group(1).replace(",", ""))
    return None

def koha_sig(body):
    t = body.decode("utf-8", "replace")
    return ("cgi-bin/koha" in t) or ("Powered by" in t and "Koha" in t)

def search_url(base, q):
    b = base.rstrip("/")
    if not b.endswith("/cgi-bin/koha"):
        b += "/cgi-bin/koha" if "/cgi-bin/koha" not in b else ""
    return f"{b}/opac-search.pl?q={q}"

# ---------- Stage 1: discovery ----------
DISCOVER = {
    # candidate -> page to mine for OPAC links
    "cutn": "https://centrallibrary.cutn.ac.in/services/opac",
    "tnpublib_root": "https://bookprocurement.tamilnadupubliclibraries.org/",
    "tnpublib_main": "https://www.tamilnadupubliclibraries.org/",
    "annauniv_lib": "https://www.annauniv.edu/",
    "mkuniv": "https://mkuniversity.ac.in/",
    "bharathiar": "https://www.b-u.ac.in/",
    "bharathidasan": "https://www.bdu.ac.in/",
    "periyar": "https://www.periyaruniversity.ac.in/",
    "alagappa": "https://alagappauniversity.ac.in/",
    "msuniv": "https://www.msuniv.ac.in/",
    "tndalu": "https://www.tndalu.ac.in/",
    "tnou": "https://www.tnou.ac.in/",
    "tanuvas": "https://www.tanuvas.ac.in/",
    "tnnlu": "https://www.tnnlu.ac.in/",
}

def stage1():
    found = {}
    for name, url in DISCOVER.items():
        rec, body = fetch(url)
        links = []
        if body and rec["status"] == 200:
            t = body.decode("utf-8", "replace")
            for m in re.finditer(r'href="([^"]+)"[^>]*>([^<]{0,60})', t):
                href, txt = m.group(1), m.group(2).strip()
                if re.search(r"opac|koha|catalogue|catalog|webopac|library", href, re.I) or \
                   re.search(r"opac|koha|catalogue|web ?opac", txt, re.I):
                    links.append(href[:160])
            links = list(dict.fromkeys(links))[:12]
        found[name] = {"probe": rec, "links": links}
        print(f"[disc] {name}: {rec['status']} links={len(links)}", flush=True)
        time.sleep(1.1)
    with open(f"{ROOT}/data/koha-tn-discovery.json", "w") as f:
        json.dump(found, f, indent=1)
    return found

# ---------- Stage 2: probes ----------
KOHA = {
    # name -> [candidate OPAC bases to try]
    "acl_chennai":   ["http://118.185.210.241:8001/cgi-bin/koha"],
    "kcl_madurai":   ["http://122.184.84.190:1011/cgi-bin/koha"],
    "unom_ip117":    ["http://117.239.156.200/cgi-bin/koha"],
    "ssn":           ["https://opac.ssn.edu.in/cgi-bin/koha"],
    "vit":           ["https://webopaccc.vit.ac.in/cgi-bin/koha"],
    "tamil_fr":      ["https://kopac.tamil.fr/cgi-bin/koha"],
    "periyar":       ["http://14.139.186.90:8081/cgi-bin/koha"],
}

def stage2(extra=None):
    rows = []
    targets = dict(KOHA)
    if extra:
        targets.update(extra)
    for name, bases in targets.items():
        base = None
        for b in bases:
            rec, body = fetch(b + "/opac-main.pl")
            if rec["status"] == 200 and body and koha_sig(body):
                base = b; break
            time.sleep(1.1)
        if not base:
            rows.append({"library": name, "opac_base": "", "note": "no live koha base"})
            print(f"[koha] {name}: NO BASE", flush=True)
            continue
        print(f"[koha] {name}: base={base}", flush=True)
        for tag, q in PROBES_Q:
            rec, body = fetch(search_url(base, q))
            n = parse_count(body) if body else None
            rows.append({"library": name, "opac_base": base, "query": tag,
                         "q": q, "status": rec["status"], "count": n,
                         "bytes": rec["bytes"], "sha256": rec["sha256"]})
            print(f"   {tag}: {rec['status']} count={n}", flush=True)
            time.sleep(1.2)
    with open(OUT, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=["library","opac_base","query","q","status","count","bytes","sha256","note"])
        w.writeheader(); w.writerows(rows)
    print(f"wrote {OUT} ({len(rows)} rows)", flush=True)

if __name__ == "__main__":
    if "disc" in sys.argv:
        stage1()
    if "probe" in sys.argv:
        extra = {}
        # pick up discovery-found bases
        try:
            disc = json.load(open(f"{ROOT}/data/koha-tn-discovery.json"))
            for name, v in disc.items():
                for ln in v.get("links", []):
                    if "opac-search" in ln or "opac-main" in ln or re.search(r"cgi-bin/koha", ln):
                        base = ln.split("?")[0].rsplit("/opac-", 1)[0]
                        extra[name + "_found"] = [base]
                        break
        except FileNotFoundError:
            pass
        stage2(extra)
