#!/usr/bin/env python3
"""Full-catalog audit classifier for KCL Madurai (extends to any library snapshot).

Inputs (all under data/):
- kcl-books-full.jsonl            : catalog sweep snapshot {bib, isbn, title, author, imprint, letter}
- kcl-registry-full.jsonl         : isbn.gov.in lookups {isbn, registry_total, rows:[...]}
- full-registry-lookup.jsonl      : earlier cache (same shape)
- kcl-registry-lookup.json        : earlier cache ({isbn, registry_total, top})
- kcl-books.csv                   : 354-row Phoenix detail ledger (copies/cost/dates joins by isbn)

Outputs:
- data/kcl-full-audit.json        : per-record classification
- data/kcl-publisher-audit.csv    : per-publisher rollup
- stdout: figure table
"""
import json, csv, re, sys, html
from collections import defaultdict

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"
DATA = f"{ROOT}/data"

STOP = {"the", "a", "an", "of", "and", "in", "on", "for", "to", "by", "&", "ed", "edition", "pb", "pbk", "vol", "volume", "reprint", "reissue", "revised", "new", "nd", "st", "rd", "th"}
# bibliographic-format noise, present on one side only (catalog "(Pb 2022)",
# registry "(Edition 2)") — stripping these is what the first classifier missed
EDNOISE = {"edition", "ed", "eds", "edn", "pb", "pbk", "paperback", "hardcover",
           "hardback", "reissue", "reprint", "vol", "vols", "volume", "volumes",
           "pt", "part", "nd", "rev", "revised", "enlarged", "updated",
           "first", "second", "third", "fourth", "fifth", "sixth", "seventh",
           "eighth", "ninth", "tenth", "new"}
def toks(s):
    s = re.sub(r"[^\w\s]", " ", (s or "").lower())
    out = set()
    for t in s.split():
        if not t or t in STOP or t in EDNOISE:
            continue
        if t.isdigit() or re.fullmatch(r"\d+(st|nd|rd|th|ed|edn)", t):
            continue
        out.add(t)
    return out
def tover(a, b):
    ta, tb = toks(a), toks(b)
    if not ta or not tb: return 0.0
    return len(ta & tb) / min(len(ta), len(tb))
def atop(a, b):
    ta, tb = toks(a), toks(b)
    if not ta or not tb: return 0.0
    return len(ta & tb) / min(len(ta), len(tb))
def pubnorm(p):
    p = re.sub(r"[^\w\s]", " ", (p or "").lower())
    p = re.sub(r"\b(put|pvt|private|ltd|limited|publications?|pub|publishers?|books?|house|press|tr)\b", " ", p)
    return re.sub(r"\s+", " ", p).strip()
def pubmatch(a, b):
    na, nb = pubnorm(a), pubnorm(b)
    return bool(na and nb) and (na == nb or na in nb or nb in na)

# ---- load catalog
books = {}
order = []
for line in open(f"{DATA}/kcl-books-full.jsonl"):
    line = line.strip()
    if not line: continue
    r = json.loads(line)
    b = r["bib"]
    if b in books: continue
    books[b] = r; order.append(b)

# ---- load registry caches (latest wins)
reg = {}
for line in open(f"{DATA}/full-registry-lookup.jsonl"):
    if line.strip():
        r = json.loads(line); r["registry_total"] = r.get("total", r.get("registry_total", 0)); reg[r["isbn"]] = r
kprev = json.load(open(f"{DATA}/kcl-registry-lookup.json"))
for r in kprev:
    isbn = re.sub(r"[^0-9Xx]", "", str(r.get("isbn", "")))
    if len(isbn) == 13:
        reg.setdefault(isbn, {"isbn": isbn, "registry_total": r.get("registry_total", 0),
                              "rows": r.get("top", [])})
for line in open(f"{DATA}/kcl-registry-full.jsonl"):
    if line.strip():
        r = json.loads(line); r["registry_total"] = r.get("total", r.get("registry_total", 0)); reg[r["isbn"]] = r

# ---- 10 Nov backfill: valid ISBNs the stem-sweep cache never queried
try:
    for line in open(f"{DATA}/kcl-registry-backfill.jsonl"):
        if line.strip():
            r = json.loads(line); r["registry_total"] = r.get("total", r.get("registry_total", 0)); reg[r["isbn"]] = r
except FileNotFoundError:
    pass

# ---- publisher enrichment from detail pages (122.184.84.190 front-end)
import os
detail_pubs = {}
import glob as _glob
for fn in _glob.glob("/tmp/kcl-details-full/d-*.html"):
    raw = open(fn, encoding="utf-8", errors="replace").read()
    pm = re.search(r'publisher_name\"[^>]*>(?:<a[^>]*>)?([^<]+)', raw)
    bm = re.search(r'd-(\d+)\.html$', fn)
    if pm and bm:
        detail_pubs[bm.group(1)] = pm.group(1).strip()
print(f"publisher enrichment from detail pages: {len(detail_pubs)}")

# ---- copies/cost/dates from the 354-row detail ledger
detail = {}
for r in csv.DictReader(open(f"{DATA}/kcl-ledger.csv")):
    isbn = re.sub(r"[^0-9]", "", r.get("isbn", ""))
    if isbn: detail.setdefault(isbn, r)

def norm_isbn(raw):
    d = re.sub(r"[^0-9Xx]", "", raw or "")
    return d if len(d) in (10, 13) else ""

def cd_ok(d):
    if len(d) == 13 and d.isdigit():
        s = sum((1 if k % 2 == 0 else 3) * int(c) for k, c in enumerate(d[:12]))
        return (10 - s % 10) % 10 == int(d[12])
    if len(d) == 10 and re.fullmatch(r"\d{9}[\dXx]", d):
        s = sum((10 - k) * (10 if c in "Xx" else int(c)) for k, c in enumerate(d))
        return s % 11 == 0
    return False




def pub_from_imprint(raw):
    """'Chennai : Sri R J Y Publications, 2021 .' -> 'Sri R J Y Publications'"""
    s = (raw or "").strip()
    if not s:
        return ""
    if s.endswith("."):
        s = s[:-1]
    s = re.sub(r",\s*\d{4}\s*$", "", s).strip()
    if s.endswith(","):
        s = s[:-1]
    segs = [t.strip() for t in s.rsplit(":", 1)]
    p = segs[-1].strip()
    p = re.sub(r",\s*\d{4}\s*$", "", p).strip().rstrip(",").strip()
    return p

# ---- classify
out = []
pubstats = defaultdict(lambda: defaultdict(int))
for b in order:
    r = books[b]
    isbn = norm_isbn(r.get("isbn"))
    fake_pub = pub_from_imprint(r.get("imprint")) or detail_pubs.get(b, "")
    fake_imprint_raw = (r.get("imprint") or "").strip() or None
    fake_title = (r.get("title") or "").strip()
    fake_author = (r.get("author") or "").strip()
    rec = {"biblio": b, "isbn": isbn, "fake_title": fake_title, "fake_author": fake_author,
           "fake_imprint": fake_imprint_raw, "fake_publisher": fake_pub, "letter": r.get("letter", "")}
    d = detail.get(isbn)
    if d:
        rec["copies"] = d.get("copies", ""); rec["costs"] = d.get("costs", "")
        rec["dates"] = d.get("dates", ""); rec["bills"] = d.get("bills", "")
        if not fake_pub and d.get("imprint"): rec["fake_imprint"] = d["imprint"]
    ent = reg.get(isbn)
    if not isbn:
        verdict = "MALFORMED-ISBN" if (r.get("isbn") or "").strip() else "NO-ISBN-IN-CATALOG"
        rec["registry_verdict"] = verdict
    elif ent and ent.get("error"):
        rec["registry_verdict"] = "LOOKUP-ERROR"
    elif ent and ent.get("error"):
        rec["registry_verdict"] = "LOOKUP-ERROR"
    elif not ent:
        rec["registry_verdict"] = "NOT-IN-REGISTRY"
    elif not cd_ok(isbn):
        rec["registry_verdict"] = "MALFORMED-ISBN"; rec["bad_check_digit"] = True
    elif ent.get("registry_total", 0) == 0:
        rec["registry_verdict"] = "NOT-IN-REGISTRY"
    else:
        rows = ent.get("rows") or []
        best, best_ov = None, 0.0
        for row in rows:
            ov = tover(fake_title, row.get("title", ""))
            if ov > best_ov: best, best_ov = row, ov
        dconf = False
        if best:
            da = set(re.findall(r"\d+", fake_title.lower()))
            dr = set(re.findall(r"\d+", (best.get("title") or "").lower()))
            dconf = bool(da and dr and da != dr)
        rec["best_title_overlap"] = round(best_ov, 2)
        rec["digit_conflict"] = dconf
        reg_title = (best.get("title", "") if best else "").strip()
        # cross-script guard: a Tamil-script catalog title cannot token-overlap an
        # English registry title; zero overlap there is not hijack evidence.
        ta = re.sub(r"[\x00-\x7f]", "", fake_title)
        tr_ = re.sub(r"[\x00-\x7f]", "", reg_title)
        cross_script = bool((ta and not tr_) or (tr_ and not ta))
        if best and cross_script:
            rec["registry_verdict"] = "UNRESOLVED-CROSS-SCRIPT"
            rec["registry_original_title"] = reg_title
            rec["registry_original_publisher"] = best.get("publisher", "")
            out.append(rec)
            continue
        same_work = (best is not None and best_ov >= 0.60 and not dconf)
        reg_author = (best.get("Author", "") if best else "") or ""
        aov = tover(fake_author, reg_author)
        pub_ok = pubmatch(fake_pub or "", best.get("publisher", "")) if best else False
        author_ok = aov >= 0.5
        both_no_author = not fake_author.strip() and not reg_author.strip()
        if best and same_work and (pub_ok or author_ok or (both_no_author and not (fake_pub or "").strip())):
            rec["registry_verdict"] = "LEGIT"
            rec["author_overlap"] = round(aov, 2)
        elif best and same_work and not (fake_pub or "").strip():
            rec["registry_verdict"] = "TITLE-MATCH-PUB-MISSING"
            rec["author_overlap"] = round(aov, 2)
        elif best and best_ov >= 0.60 and dconf:
            rec["registry_verdict"] = "EDITION-MISMATCH-SAME-WORK"
            rec["registry_original_title"] = best.get("title", "")
            rec["registry_original_publisher"] = best.get("publisher", "")
        elif not reg_title:
            rec["registry_verdict"] = "REGISTRY-ROW-INCOMPLETE"
            if best:
                rec["registry_original_publisher"] = best.get("publisher", "")
                rec["registry_isbn_number"] = best.get("isbn_number", "")
        elif best_ov < 0.35:
            rec["registry_verdict"] = "HIJACKED-ALLOCATED-ELSEWHERE"
            rec["registry_original_title"] = best.get("title", "")
            rec["registry_original_publisher"] = best.get("publisher", "")
            rec["registry_original_author"] = best.get("Author", "")
            rec["registry_isbn_number"] = best.get("isbn_number", "")
        else:
            rec["registry_verdict"] = "UNRESOLVED-TITLE-PARTIAL"
            rec["registry_original_title"] = best.get("title", "")
            rec["registry_original_publisher"] = best.get("publisher", "")
    out.append(rec)
    p = (html.unescape(rec.get("fake_publisher")) if rec.get("fake_publisher") else "") or "(publisher unknown — detail pages not harvested)"
    s = pubstats[p]
    s["records"] += 1
    s[rec["registry_verdict"]] += 1
    if d := detail.get(isbn):
        try: s["cost_total"] += float(d.get("costs") or 0)
        except ValueError: pass

# ---- rollup
pubs = sorted(pubstats.items(), key=lambda kv: -kv[1]["records"])
with open(f"{DATA}/kcl-publisher-audit.csv", "w", newline="") as f:
    w = csv.writer(f)
    w.writerow(["publisher", "records", "LEGIT", "HIJACKED-ALLOCATED-ELSEWHERE",
                "NOT-IN-REGISTRY", "NO-ISBN-IN-CATALOG", "MALFORMED-ISBN", "cost_total"])
    for p, s in pubs:
        w.writerow([p, s["records"], s.get("LEGIT", 0), s.get("HIJACKED-ALLOCATED-ELSEWHERE", 0),
                    s.get("NOT-IN-REGISTRY", 0), s.get("NO-ISBN-IN-CATALOG", 0),
                    s.get("MALFORMED-ISBN", 0), round(s.get("cost_total", 0), 2)])

json.dump(out, open(f"{DATA}/kcl-full-audit.json", "w"), ensure_ascii=False, indent=1)

# ---- figure table
ver = defaultdict(int)
for r in out: ver[r["registry_verdict"]] += 1
print(f"records {len(out)}  unique bibs {len(books)}")
for k in ("LEGIT", "TITLE-MATCH-PUB-MISSING", "EDITION-MISMATCH-SAME-WORK", "HIJACKED-ALLOCATED-ELSEWHERE", "NOT-IN-REGISTRY", "NO-ISBN-IN-CATALOG", "MALFORMED-ISBN"):
    print(f"  {k}: {ver.get(k, 0)}")
reg_l = [r for r in out if r["registry_verdict"] != "NO-ISBN-IN-CATALOG" and r.get("isbn")]
print(f"ISBN-bearing screened: {len(reg_l)}")
hij = [r for r in out if r["registry_verdict"] == "HIJACKED-ALLOCATED-ELSEWHERE"]
print(f"hijack rate among registry hits: {len(hij)}/{sum(1 for r in out if r['registry_verdict'] in ('LEGIT','HIJACKED-ALLOCATED-ELSEWHERE'))}")
print(f"publishers: {len(pubs)}")
print("top 15 by records:")
for p, s in pubs[:15]:
    print(f"  {p[:46]:48} rec={s['records']:4} hij={s.get('HIJACKED-ALLOCATED-ELSEWHERE',0):4} "
          f"legit={s.get('LEGIT',0):3} notreg={s.get('NOT-IN-REGISTRY',0):3}")
sidecar = os.environ.get("KCL_DETAIL_PUBS", f"{DATA}/kcl-detail-pubs.jsonl")
if os.path.exists(sidecar):
    for line in open(sidecar):
        if line.strip():
            j = json.loads(line)
            detail_pubs.setdefault(j["bib"], j["publisher"])
print(f"publisher enrichment total: {len(detail_pubs)}")
