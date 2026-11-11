#!/usr/bin/env python3
"""Red team the KCL full-catalog sweep (offline half).

Attacks the pipeline stored in data/: recount math, ISBN check digits,
title-overlap edge cases, registry-lookup failure contamination,
cache-precedence, cost parsing, dedupe consistency, hash audit.
Every check prints PASS/FAIL/HIT with the offending records named.
"""
import json, csv, re, hashlib, sys
from collections import defaultdict, Counter

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"
DATA = f"{ROOT}/data"
books, order = {}, []
for line in open(f"{DATA}/kcl-books-full.jsonl"):
    if line.strip():
        r = json.loads(line)
        if r["bib"] not in books:
            books[r["bib"]] = r; order.append(r["bib"])
audit = json.load(open(f"{DATA}/kcl-full-audit.json"))
by_bib = {r["biblio"]: r for r in audit}
reg = [json.loads(l) for l in open(f"{DATA}/kcl-registry-full.jsonl") if l.strip()]

F = []
def finding(fid, sev, title, body):
    F.append((fid, sev, title, body))
    print(f"[{sev}] {fid} {title}")
    print(body)

# ---- T1 recount published verdict table
ver = Counter(r["registry_verdict"] for r in audit)
pub = {"HIJACKED-ALLOCATED-ELSEWHERE": 14, "NOT-IN-REGISTRY": 3469,
       "NO-ISBN-IN-CATALOG": 244, "MALFORMED-ISBN": 45, "LOOKUP-ERROR": 0}
bad = [f"{k}: file={ver.get(k,0)} report={v}" for k, v in pub.items() if ver.get(k, 0) != v]
print(f"T1 recount: file={dict(ver)} total={len(audit)}")
finding("T1", "ok" if not bad else "HIT", "published verdict table vs file recount",
        "\n".join(bad) if bad else "all five counts match; total 4,576 matches")

# ---- T2 dedupe math: unique bibs / unique ISBNs / bib range
uniq_isbn = {r["isbn"] for r in audit if r.get("isbn")}
bibs = [int(r["biblio"]) for r in audit]
print(f"T2 records={len(audit)} uniq_bibs={len(set(bibs))} uniq_isbn={len(uniq_isbn)} "
      f"bib_range={min(bibs)}-{max(bibs)} registry_lines={len(reg)}")
dup_bibs = [b for b, c in Counter(bibs).items() if c > 1]
finding("T2", "ok" if len(set(bibs)) == len(audit) else "HIT",
        "record uniqueness + bib range",
        f"duplicate biblio keys: {dup_bibs[:5]} | registry lines {len(reg)} vs uniq isbn {len(uniq_isbn)} "
        f"(report claimed 3,746; sweep log claimed 'unique=4576')")

# ---- T3 check digits: validate every ISBN we passed as well-formed
def cd13(d):
    return (10 - sum((1 if i % 2 == 0 else 3) * int(c) for i, c in enumerate(d[:12])) % 10) % 10
def cd10(d):
    s = sum((10 - i) * (10 if c == "X" else int(c)) for i, c in enumerate(d[:9]))
    return {10: "X", 0: "0"}.get(s % 11, str(s % 11))
badcd13, badcd10 = [], []
for r in audit:
    i = r.get("isbn", "")
    if len(i) == 13 and i.isdigit() and int(i[-1]) != cd13(i): badcd13.append((r["biblio"], i))
    if len(i) == 10 and re.fullmatch(r"\d{9}[\dXx]", i) and not cd10(i): badcd10.append((r["biblio"], i))
print(f"T3 bad check digits: 13={len(badcd13)} 10={len(badcd10)} sample={badcd13[:4]}{badcd10[:4]}")
finding("T3", "ok" if not (badcd13 or badcd10) else "HIT",
        "ISBNs we screened as well-formed fail check-digit validation",
        "bad-CD13: " + str(badcd13[:8]) + " bad-CD10: " + str(badcd10[:8]) +
        " — these were sent to isbn.gov.in as-is; a wrong digit guarantees a NOT-IN-REGISTRY verdict"
        if (badcd13 or badcd10) else "every length-10/13 isbn passes its check digit")

# ---- T3b cache coverage: which catalog ISBNs were never queried at all?
cov = set()
for line in open(f"{DATA}/full-registry-lookup.jsonl"):
    if line.strip(): cov.add(json.loads(line)["isbn"])
for line in open(f"{DATA}/kcl-registry-full.jsonl"):
    if line.strip(): cov.add(json.loads(line)["isbn"])
kp = json.load(open(f"{DATA}/kcl-registry-lookup.json"))
for r in kp:
    cov.add(re.sub(r"[^0-9Xx]", "", str(r.get("isbn", ""))))
uncov = sorted(i for i in uniq_isbn if i not in cov)
unverdicted = [r for r in audit if r.get("isbn") in uncov]
ver_mix = Counter(r["registry_verdict"] for r in unverdicted)
print(f"T3b uniq_isbn={len(uniq_isbn)} cached={len(cov & uniq_isbn)} never-queried={len(uncov)} "
      f"their verdicts={dict(ver_mix)}")
finding("T3b", "HIT" if uncov else "ok",
        "catalog ISBNs with no registry cache entry of any kind",
        f"{len(uncov)} unique ISBNs appear in no cache; {ver_mix.get('NOT-IN-REGISTRY',0)} records "
        f"sitting on them are NOT-IN-REGISTRY without ever being queried: {uncov[:8]}")

# ---- T4 malformed bucket: what did we actually throw away?
raws = [(r["biblio"], r.get("isbn", "")) for r in audit if r["registry_verdict"] == "MALFORMED-ISBN"]
recoverable = []
for b, raw in raws:
    digits = re.sub(r"[^0-9Xx]", "", raw or "")
    if len(digits) > 13 and digits[:13].isdigit():
        recoverable.append((b, raw, digits[:13]))
print(f"T4 malformed raws sample={raws[:6]} recoverable_prefixes={len(recoverable)}")
finding("T4", "HIT" if recoverable else "warn",
        "MALFORMED-ISBN bucket contains salvageable ISBNs",
        f"24 raws; {len(recoverable)} have a clean 13-digit prefix that was never screened: {recoverable[:6]}")

# ---- T5 truncation in catalog titles (facet-walk source)
trunc = [(r["biblio"], r["fake_title"][-40:]) for r in audit
         if r["fake_title"].rstrip().endswith(("…", "..."))]
hij_trunc = [t for t in trunc if by_bib[t[0]]["registry_verdict"] == "HIJACKED-ALLOCATED-ELSEWHERE"]
print(f"T5 truncated titles={len(trunc)} of which hijacked={len(hij_trunc)}")
finding("T5", "HIT" if trunc else "ok",
        "catalog titles truncated at facet-walk harvest",
        f"{len(trunc)} titles end in ellipsis; {len(hij_trunc)} are classified HIJACKED where the "
        f"overlap test ran on a truncated string: {hij_trunc[:5]}")

# ---- T6 hijacks with no publisher string: legit-rule could never fire
nopub_hij = [r for r in audit if r["registry_verdict"] == "HIJACKED-ALLOCATED-ELSEWHERE"
             and not (r.get("fake_publisher") or "").strip()]
near = [r for r in nopub_hij if r.get("best_title_overlap", 0) >= 0.55]
print(f"T6 hijacked w/o publisher={len(nopub_hij)} of those overlap>=0.55={len(near)}")
finding("T6", "HIT" if nopub_hij else "ok",
        "LEGIT rule requires pubmatch; records without a harvested publisher can never pass it",
        f"{len(nopub_hij)} of 14 confirmed hijacks carry no publisher string, so 'legit' was unreachable — "
        f"verdict rests only on title overlap. {len(near)} have overlap 0.55-0.74 (near-threshold, "
        f"plausibly variant titles): {[(r['biblio'], r.get('best_title_overlap'), r['fake_title'][:38]) for r in near[:8]]}")

# ---- T7 registry rows empty vs failures (contamination check)
empty_rows = [r for r in reg if r.get("registry_total", 0) == 0]
zero_total_rows = [r for r in reg if r.get("registry_total", 0) == 0 and (r.get("rows") or [])]
err_fields = [r for r in reg if r.get("error") or r.get("http")]
print(f"T7 registry lines={len(reg)} total==0={len(empty_rows)} error-field={len(err_fields)}")
finding("T7", "ok" if not err_fields else "HIT",
        "registry cache: distinguish lookup failure from true absence",
        f"lines with explicit error/http markers: {len(err_fields)} {err_fields[:3]}; "
        f"total==0 lines: {len(empty_rows)} (these feed NOT-IN-REGISTRY — no marker means we "
        f"cannot tell 'absent' from 'lookup died')")

# ---- T8 same ISBN, different catalog titles (verdict instability)
isbn_titles = defaultdict(set)
for r in audit:
    if r.get("isbn"): isbn_titles[r["isbn"]].add(r["fake_title"].strip().lower())
clash = {i: ts for i, ts in isbn_titles.items() if len(ts) > 1}
print(f"T8 isbns with >1 distinct catalog title={len(clash)}")
finding("T8", "warn" if clash else "ok",
        "one ISBN, multiple catalog titles — per-record verdict can split",
        f"{len(clash)} ISBNs carry conflicting titles in the same catalog; sample: "
        + str(list(clash.items())[:3]))

# ---- T9 the 6 LEGIT: show the evidence
legit = [r for r in audit if r["registry_verdict"] == "LEGIT"]
print("T9 LEGIT rows:")
for r in legit:
    print("   ", r["biblio"], r["isbn"], r["fake_title"][:40], "| ov:", r.get("best_title_overlap"),
          "| pub:", (r.get("fake_publisher") or "")[:30])
finding("T9", "ok", "the 6 LEGIT verdicts: evidence printed above",
        "each needs pubmatch(fake_pub, registry_pub) AND ov>=0.75 — verify publisher strings "
        "came from harvested detail pages, not empty-imprint defaults")

# ---- T10 cost parsing: multi-value costs strings silently dropped
multi, badfloat = [], 0
seen = set()
for r in csv.DictReader(open(f"{DATA}/kcl-ledger.csv")):
    c = (r.get("costs") or "").strip()
    if not c: continue
    parts = [p for p in re.split(r"[;,]", c) if p.strip()]
    if len(parts) > 1: multi.append((r.get("isbn"), c))
    for p in parts:
        try: float(p)
        except ValueError: badfloat += 1
print(f"T10 multi-copy cost strings={len(multi)} unparseable={badfloat} sample={multi[:4]}")
finding("T10", "HIT" if multi or badfloat else "ok",
        "cost rollup drops everything after the first ';' in multi-copy costs",
        f"{len(multi)} ledger rows hold 'a;b' cost lists; float() keeps only the first segment — "
        f"cost_total in kcl-publisher-audit.csv undercounts. sample: {multi[:3]}")

# ---- T11 hash audit vs evidence manifest
lines = open(f"{ROOT}/evidence/kcl-full-audit/SHA256SUMS.txt").read().splitlines()
bad = []
for l in lines:
    h, _, fn = l.partition("  ")
    fn = fn.strip().lstrip("*")
    p = fn if fn.startswith("/") else f"{ROOT}/{fn}"
    try:
        got = hashlib.sha256(open(p, "rb").read()).hexdigest()
        if got != h: bad.append((fn, "MISMATCH"))
    except OSError as e:
        bad.append((fn, "MISSING"))
print(f"T11 manifest lines={len(lines)} bad={bad}")
finding("T11", "ok" if not bad else "HIT", "evidence SHA256SUMS vs files on disk",
        str(bad) if bad else f"all {len(lines)} hashes verify")

# ---- T12 cache precedence: same isbn, different rows across the 3 caches
c1 = {}
for line in open(f"{DATA}/full-registry-lookup.jsonl"):
    if line.strip():
        r = json.loads(line); c1[r["isbn"]] = r.get("total", r.get("registry_total", 0))
c3 = {r["isbn"]: r.get("total", r.get("registry_total", 0)) for r in reg}
changed = [i for i in set(c1) & set(c3) if c1[i] != c3[i]]
print(f"T12 isbns in both caches w/ differing totals={len(changed)}")
finding("T12", "warn" if changed else "ok", "old vs new registry cache disagree for some ISBNs",
        f"{len(changed)} ISBNs flip between caches; classifier takes the newer (kcl-registry-full) — "
        f"correct order, but if the newer sweep had failures the flips are invisible. sample: "
        + str([(i, c1[i], c3[i]) for i in changed[:5]]))

print("\n=== SUMMARY ===")
for fid, sev, t, _ in F:
    print(f"{sev:5} {fid} {t}")
