#!/usr/bin/env python3
"""Probe NIC eGranthalaya 4.0 cloud OPACs (eg4.nic.in) for the fake-ISBN factory fingerprints.

eGranthalaya = NIC's ILMS for government libraries, cloud-hosted, ASP.NET WebForms.
Clients probed: TAMILNADU (10 libraries) + PUBLICLIBRARIES (151 public libraries, multi-state).

Mechanics per search: GET Default.aspx -> harvest all hidden inputs (__VIEWSTATE etc.)
-> POST back with txt_Search + Basic_Search_Bttn -> parse result count from response.

GET/POST only, ~1 req/s, every request logged, responses saved.
GET only, ~1 req/s, every request logged, responses saved.

Outputs:
  evidence/eg4-sweep/*.html        raw responses
  data/probes-eg4-sweep.jsonl      one line per request
  data/eg4-sweep.csv               results table
"""
import hashlib, html, json, os, re, subprocess, sys, time, urllib.parse, ssl
import http.cookiejar

JAR = http.cookiejar.CookieJar()
OPENER = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(JAR),
                                     urllib.request.HTTPSHandler(context=ssl.create_default_context()))
OPENER.addheaders = [("User-Agent", UA)] if False else []

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EV = f"{ROOT}/evidence/eg4-sweep"
os.makedirs(EV, exist_ok=True)
PROBES = f"{ROOT}/data/probes-eg4-sweep.jsonl"

UA = "Mozilla/5.0 (X11; Linux x86_64) FakeISBN-Audit/1.0 (research; contact cashlessconsumer.in)"
CTX = ssl.create_default_context(); CTX.check_hostname = False; CTX.verify_mode = ssl.CERT_NONE
BASE = "https://eg4.nic.in/OPAC/Default.aspx"

def log(rec):
    with open(PROBES, "a") as f:
        f.write(json.dumps(rec, ensure_ascii=False) + "\n")

def save(name, body):
    fn = re.sub(r"[^A-Za-z0-9._-]", "_", name)[:110]
    with open(f"{EV}/{fn}", "wb") as f:
        f.write(body)

def fetch(url, data=None, referer=None, tag=""):
    """curl-subprocess transport: urllib POSTs are silently ignored by the OPAC."""
    args = ["curl", "-s", "-m", "45", "-k",
            "-c", "/tmp/eg4cj.txt", "-b", "/tmp/eg4cj.txt",
            "-A", UA, "-H", "Accept: text/html"]
    if referer:
        args += ["-H", f"Referer: {referer}"]
    bodyfile = None
    if data is not None:
        bodyfile = "/tmp/eg4-postbody.txt"
        with open(bodyfile, "wb") as f:
            f.write(data)
        args += ["-H", "Content-Type: application/x-www-form-urlencoded",
                 "--data-binary", f"@{bodyfile}"]
    args += ["-o", "/tmp/eg4-resp.bin", "-w", "%{http_code} %{size_download}", url]
    t0 = time.time()
    p = subprocess.run(args, capture_output=True, text=True)
    code, _, nbytes = p.stdout.partition(" ")
    body = open("/tmp/eg4-resp.bin", "rb").read() if nbytes != "0" else b""
    rec = {"url": url, "tag": tag, "ts": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
           "status": int(code or 0), "bytes": len(body), "ms": int((time.time()-t0)*1000)}
    rec["sha256"] = hashlib.sha256(body).hexdigest() if body else ""
    log(rec)
    return rec, body

def hidden_fields(t):
    fields = {}
    for m in re.finditer(r'<input[^>]*type="hidden"[^>]*>', t):
        tag = m.group(0)
        n = re.search(r'name="([^"]+)"', tag)
        v = re.search(r'value="([^"]*)"', tag)
        if n:
            fields[n.group(1)] = v.group(1) if v else ""
    return fields

def result_markers(t):
    """Extract visible signals about result counts."""
    low = t.lower()
    out = {}
    m = re.search(r"Your Search Returned\s+(\d+)\s+Record", low)
    if m:
        out["returned"] = m.group(1)
    for rx, name in [
        (r"no\s+records?\s+found", "no_records"),
        (r"(\d[\d,]*)\s+results?\s+found", "n_found"),
        (r"(\d[\d,]*)\s+records?\s+found", "n_found2"),
        (r"total\s+(?:no\.?\s*of\s+)?(?:records?|results?)\s*[:\-]?\s*(\d[\d,]*)", "total"),
        (r"found\s+(\d[\d,]*)\s+(?:records?|results?|documents)", "found_n"),
    ]:
        m = re.search(rx, low)
        if m:
            out[name] = m.group(1) if m.groups() else True
    return out

QUERIES = [
    ("isbn_9789392360091", "9789392360091", "STANDARD_NO"),
    ("isbn_9789394612709", "9789394612709", "STANDARD_NO"),
    ("isbn_9789394612778", "9789394612778", "STANDARD_NO"),
    ("kw_phoenix", "Phoenix", "PUB_NAME"),
    ("kw_thenmozhi", "Thenmozhi", "PUB_NAME"),
    ("control_oxford", "Oxford", "PUB_NAME"),
]

CLIENTS = sys.argv[1].split(",") if len(sys.argv) > 1 else ["TAMILNADU", "PUBLICLIBRARIES"]
LIB_FILTER = sys.argv[2] if len(sys.argv) > 2 else ""   # optional DDL_Library value

def main():
    for cl in CLIENTS:
        url = f"{BASE}?CL_NAME={cl}"
        rec, body = fetch(url, tag=f"{cl}:page")
        if rec["status"] != 200 or not body:
            print(f"[{cl}] page fetch failed: {rec.get('err')} status={rec['status']}")
            continue
        t = body.decode("utf-8", "replace")
        save(f"{cl}-default.html", body)
        fields = hidden_fields(t)
        libs = re.findall(r'<option[^>]*value="([^"]*)"[^>]*>\s*([^<]*Library[^<]*)</option>', t)
        print(f"[{cl}] hidden={len(fields)} libs_in_dropdown={len(libs)}")

        for qname, q, fld in QUERIES:
            time.sleep(1.1)
            post = dict(fields)
            post["txt_Search"] = q
            post["DDL_Field"] = fld
            post["DDL_Materials"] = "Books"
            post["DDL_Boolean"] = "LIKE"
            post["DDL_OrderBy"] = "Title"
            post["DDL_SortBy"] = "ASC"
            post["DDL_Pages"] = "20"
            post["Basic_Search_Bttn"] = "Search"
            post.setdefault("__EVENTTARGET", "")
            post.setdefault("__EVENTARGUMENT", "")
            if LIB_FILTER:
                post["DDL_Library"] = LIB_FILTER
            data = urllib.parse.urlencode(post).encode()
            rec, rbody = fetch(url, data=data, referer=url, tag=f"{cl}:{qname}")
            rt = rbody.decode("utf-8", "replace") if rbody else ""
            save(f"{cl}-{qname}.html", rbody)
            marks = result_markers(rt)
            m = re.search(r"Your\s+Search\s+Returned\s+(\d+)\s+Record", rt, re.I)
            returned = int(m.group(1)) if m else None
            hits = sum(rt.count(x) for x in ("9789392360091", "9789394612709", "9789394612778"))
            phoenix_row = len(re.findall(r"Phoenix[^<]{0,40}(?:Publications|Publishers|Book House|Printers)", rt, re.I))
            detail_rows = rt.count("Details.aspx?ctr=")
            print(f"  {qname} [{q} @{fld}] status={rec['status']} bytes={rec['bytes']} returned={returned} marks={marks} isbnhits={hits} phoenix_pubrows={phoenix_row} detailrows={detail_rows}")

if __name__ == "__main__":
    main()
