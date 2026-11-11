#!/usr/bin/env python3
"""Reclassify the ACL Phoenix wave with the hardened same-work comparator.

The original classify() in acl_phoenix_sweep.py flagged every registry hit
without a Phoenix registrant as HIJACKED — no title comparison. This script
re-derives verdicts with the same hardened comparator the KCL retest uses:
token overlap on edition-noise-stripped tokens, digit-conflict detection,
author corroboration. Fully offline against data/acl-phoenix-audit.json +
data/full-registry-lookup.jsonl.
Writes data/acl-phoenix-audit-v2.json (original file untouched).
"""
import json, re, collections

ROOT = "/home/workspace/Projects/tn-fake-isbn-audit"

STOP = {"the", "a", "an", "of", "and", "in", "on", "for", "to", "by", "&",
        "ed", "edition", "pb", "pbk", "vol", "volume", "reprint", "reissue",
        "revised", "new", "nd", "st", "rd", "th"}

def toks(s):
    s = re.sub(r"[^\w\s]", " ", (s or "").lower())
    return {t for t in s.split() if t and t not in STOP and not t.isdigit()}

def tover(a, b):
    ta, tb = toks(a), toks(b)
    if not ta or not tb:
        return 0.0
    return len(ta & tb) / min(len(ta), len(tb))

regs = {}
for f in ("full-registry-lookup.jsonl", "kcl-registry-full.jsonl"):
    try:
        for l in open(f"{ROOT}/data/{f}"):
            try:
                d = json.loads(l)
                regs[d["isbn"]] = d
            except Exception:
                pass
    except FileNotFoundError:
        pass

txt = open(f"{ROOT}/data/acl-phoenix-audit.json").read().strip()
rows = json.loads(txt) if txt.startswith("[") else [json.loads(x) for x in txt.splitlines() if x.strip()]

out, tally = [], collections.Counter()
for r in rows:
    isbn = r.get("isbn") or ""
    v = None
    d = regs.get(isbn)
    if d is None:
        v = "NEEDS-LOOKUP"
    elif d.get("total", 0) == 0:
        v = "NEVER-ALLOCATED"
    elif any("Phoenix" in (x.get("registrant") or "") for x in (d.get("rows") or [])):
        v = "REGISTERED-PHOENIX"
    else:
        rrows = d.get("rows") or []
        titled = [x for x in rrows if (x.get("title") or "").strip()]
        if not titled:
            v = "REGISTRY-ROW-INCOMPLETE"
            r["best_title_overlap"] = 0.0
        else:
            best, best_ov = None, 0.0
            for x in titled:
                ov = tover(r.get("title", ""), x.get("title", ""))
                if ov > best_ov:
                    best, best_ov = x, ov
            if best is None:
                best, best_ov = titled[0], 0.0
            da = set(re.findall(r"\d+", (r.get("title") or "").lower()))
            dr = set(re.findall(r"\d+", ((best or {}).get("title") or "").lower()))
            dconf = bool(best is not None and da and dr and da != dr)
            r["best_title_overlap"] = round(best_ov, 2)
            r["registry_title"] = (best or {}).get("title", "")
            r["registry_publisher"] = (best or {}).get("publisher", "")
            if best and dconf:
                v = "EDITION-MISMATCH-SAME-WORK"
            elif best_ov >= 0.60:
                v = "TITLE-MATCH-REG-DIFF-REGISTRANT"
            elif best_ov >= 0.35:
                v = "UNRESOLVED-TITLE-PARTIAL"
            else:
                v = "HIJACKED-ALLOCATED-ELSEWHERE"
    r["verdict"] = v
    tally[v] += 1
    out.append(r)

json.dump(out, open(f"{ROOT}/data/acl-phoenix-audit-v2.json", "w"), indent=1, ensure_ascii=False)
print(f"records {len(out)}")
for k, n in tally.most_common():
    print(f"  {k}: {n}")
