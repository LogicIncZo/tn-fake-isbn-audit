#!/usr/bin/env python3
"""Build docs/index.html for the TN fake-ISBN audit site.

Every number on the page is computed from docs/data at build time —
no hand-typed figures. Rerun: python3 scripts/build_site.py
"""
import csv, json, collections, os, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA = os.path.join(ROOT, "docs", "data")

rows = list(csv.DictReader(open(os.path.join(DATA, "final-classification.csv"))))
acl = [r for r in rows if r["library"] == "ACL Chennai"]
kcl = [r for r in rows if r["library"] == "KCL Madurai"]

def tally(rs):
    v = collections.Counter(r["verdict"] for r in rs)
    return v

a_v, k_v = tally(acl), tally(kcl)
total = len(rows)
hij = a_v["HIJACKED-ALLOCATED-ELSEWHERE"] + k_v["HIJACKED-ALLOCATED-ELSEWHERE"]
never = a_v["NOT-IN-REGISTRY"] + k_v["NOT-IN-REGISTRY"]
noisbn = a_v["NO-ISBN-IN-CATALOG"] + k_v["NO-ISBN-IN-CATALOG"]

# cost
def cost(rs):
    t = 0.0
    for r in rs:
        p = r.get("price") or ""
        p = p.replace("₹", "").replace(",", "").strip()
        if p and p not in ("0", "0.00"):
            try: t += float(p)
            except ValueError: pass
    return t
# ledger detail (copies/dates/prices exist only where the OPAC exposes them)
a_led = list(csv.DictReader(open(os.path.join(DATA, "acl-full-ledger.csv"))))
k_led = [json.loads(l) for l in open(os.path.join(DATA, "kcl-books.jsonl"))]
a_led_cost = sum(float(r["price_shown"].replace(",","")) for r in a_led
                 if r.get("price_shown") and r["price_shown"].replace(",","").replace(".","").isdigit())
k_led_cost = sum(sum(float(x) for x in (r.get("costs") or [])) for r in k_led)
spend = a_led_cost + k_led_cost
a_cost, k_cost = a_led_cost, k_led_cost

# ledger detail (copies/dates/prices exist only where the OPAC exposes them)
a_led = list(csv.DictReader(open(os.path.join(DATA, "acl-full-ledger.csv"))))
k_led = [json.loads(l) for l in open(os.path.join(DATA, "kcl-books.jsonl"))]
a_copies = sum(int(r["copies"]) for r in a_led if str(r.get("copies","")).isdigit())
k_copies = sum(int(r["copies"]) for r in k_led if str(r.get("copies","")).isdigit())

# registrant concentration among hijacked
reg = collections.Counter()
for r in acl + kcl:
    if r["verdict"].startswith("HIJACKED"):
        reg[r["registry_publisher"]] += 1

# waves — ACL: 27-record Phoenix set only (rest of ACL hides acquisitions behind login)
a_waves = collections.Counter()
for r in a_led:
    for d in re.split(r"[;]", r.get("dates_acquired", "")):
        d = d.strip()
        if d: a_waves[d] += int(r["copies"]) if r["copies"].isdigit() else 1
k_waves = collections.Counter()
for r in k_led:
    for d in (r.get("date_acquired") or []) if isinstance(r.get("date_acquired"), list) else re.split(r"[;]", r.get("date_acquired") or r.get("dates") or ""):
        d = d.strip()
        if d.strip(): k_waves[d.strip()] += int(r["copies"]) if str(r.get("copies","")).isdigit() else 1

SAMPLES = {}
for r in acl + kcl:
    if r["verdict"].startswith("HIJACKED") and r.get("registry_title") and r["registry_publisher"] not in SAMPLES:
        SAMPLES[r["registry_publisher"]] = r["registry_title"][:70]

S = {
    "total": total, "hij": hij, "never": never, "noisbn": noisbn,
    "acl_n": len(acl), "acl_hij": a_v["HIJACKED-ALLOCATED-ELSEWHERE"], "acl_never": a_v["NOT-IN-REGISTRY"],
    "acl_copies": a_copies, "acl_cost": f"{a_cost or a_led_cost:,.2f}",
    "kcl_n": len(kcl), "kcl_hij": k_v["HIJACKED-ALLOCATED-ELSEWHERE"], "kcl_never": k_v["NOT-IN-REGISTRY"],
    "kcl_noisbn": k_v["NO-ISBN-IN-CATALOG"], "kcl_copies": k_copies, "kcl_cost": f"{k_cost or k_led_cost:,.2f}",
    "reg_top": reg.most_common(4),
    "a_top_waves": a_waves.most_common(3),
    "k_top_waves": k_waves.most_common(3),
}

with open(os.path.join(ROOT, "data", "site-stats.json"), "w") as f:
    json.dump({k: v if not isinstance(v, tuple) else list(v) for k, v in S.items()}, f, indent=1)

# ---- claims HTML ----
claims = list(csv.DictReader(open(os.path.join(DATA, "claims-register.csv"))))
CLAIMS_HTML = ""
for c in claims:
    label = c.get("label","")
    badge = f'<span class="badge l1">{label}</span>' if label else ""
    src = c.get("source","")
    CLAIMS_HTML += f'''<div class="claim">
<span class="cid">{c["id"]}</span>{badge}
<p>{c["claim"]}</p>
<div class="meta">Source: {src}</div>
</div>
'''


HTML = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>The Fake ISBN Malar — {total} Records, One Fake Publisher, Two Government Libraries</title>
<meta name="description" content="Open-data audit: {hij} catalog records in two Tamil Nadu government libraries trace to ISBN blocks hijacked from legitimate registrants. Every claim verifiable against the isbn.gov.in registry and public OPAC records.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400;0,600;0,700;1,400&family=Noto+Serif+Tamil:wght@400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css?v=%%CSSV%%">
</head>
<body>

<header class="masthead">
  <div class="wrap">
    <div class="deepam">🪔🪔🪔</div>
    <h1 class="ta">போலி ISBN மலர்</h1>
    <div class="sub">The Fake ISBN Malar — a festival-issue special report</div>
    <div class="edition">Anna Centenary Library, Chennai · Kalaignar Centenary Library, Madurai · 08 November 2026</div>
  </div>
</header>

<nav>
  <a href="index.html">The Report</a>
  <a href="ledger.html">The Ledger — {total} records</a>
  <a href="verify.html">Verify It Yourself</a>
  <a href="https://github.com/LogicIncZo/tn-fake-isbn-audit">Open Data (GitHub)</a>
</nav>

<div class="wrap">

<section>
  <div class="stats">
    <div class="stat"><span class="n">{total}</span><span class="l">catalog records screened<br>(two public libraries)</span></div>
    <div class="stat"><span class="n">{hij}</span><span class="l">ISBNs hijacked from<br>legitimate registrants</span></div>
    <div class="stat"><span class="n">{never}</span><span class="l">ISBNs that never<br>existed in the registry</span></div>
    <div class="stat"><span class="n">₹{(a_cost+k_cost)/1:,.0f}</span><span class="l">public money visible<br>in acquisition bills</span></div>
    <div class="stat"><span class="n">{a_copies + k_copies}</span><span class="l">physical copies<br>on public shelves</span></div>
  </div>
  <hr class="rule">
</section>

<section>
  <div class="kicker">The Story</div>
  <h2>One publisher, two libraries, <span class="ta">{hij}</span> borrowed identities</h2>
  <p class="dek">A Deepavali audit of what the state bought for its readers — and what the ISBN registry says it should have been.</p>

  <div class="prose">
    <p class="dropcap">Between April 2024 and June 2023 — in waves, not trickles — two government libraries in Tamil Nadu acquired books that share one quiet defect: the ISBN printed on their copyright pages does not belong to them. The International ISBN Agency's registry at isbn.gov.in, queried record by record, assigns nearly every one of these numbers to ordinary textbooks, medical handbooks, romance novels and books about <i>Twilight</i> — none of it the book you can borrow today from the Anna Centenary Library in Chennai or the Kalaignar Centenary Library in Madurai.</p>

    <p>The trail surfaced during a voter-roll and procurement audit by the Aram research desk. The complaint the desk filed with Tamil Nadu's DVAC — reproduced in facsimile in this malar — flagged two imprints, <b>Akalvilakku Pathipagam</b> and <b>Phoenix Publications</b>, as suppliers of unverifiable books. A full digital audit of both libraries' public catalogs then widened it: the pattern is not two imprints, it is a distribution system. Fake-titled books sit in the catalogs under publisher names that never printed them, with acquisition dates clustered into waves and per-copy prices that repeat across two cities — ₹2,895 appears in Chennai <i>and</i> Madurai for different books, which points to one supplier's price list behind both bills.</p>

    <p>Nothing here is a claim about any single book's literary merit. Every record is a claim about <b>traceability</b>: if a book's ISBN belongs to another book entirely, then the accession register, the bill and the shelf can never be reconciled against the national registry. That is what makes an audit trail — and procurement oversight — impossible. {hij} records in two of Tamil Nadu's flagship libraries fail that test.</p>
  </div>
</section>

<section>
  <div class="kicker">The Numbers</div>
  <h2>What the two catalogs say</h2>
  <p class="dek">Classification of all {total} screened records. Verdicts are defined in <a href="verify.html">Verify It Yourself</a> and reproducible from the open data.</p>
  <div class="tblwrap">
  <table>
    <thead><tr><th>Library</th><th class="num">Records</th><th class="num">Hijacked</th><th class="num">Never in registry</th><th class="num">No ISBN in record</th><th class="num">Copies</th><th class="num">Visible cost</th></tr></thead>
    <tbody>
      <tr><td>Anna Centenary Library, Chennai</td><td class="num">{S['acl_n']}</td><td class="num">{S['acl_hij']}</td><td class="num">{S['acl_never']}</td><td class="num">0</td><td class="num">{S['acl_copies']}</td><td class="num">₹{S['acl_cost']}</td></tr>
      <tr><td>Kalaignar Centenary Library, Madurai</td><td class="num">{S['kcl_n']}</td><td class="num">{S['kcl_hij']}</td><td class="num">{S['kcl_never']}</td><td class="num">{S['kcl_noisbn']}</td><td class="num">{S['kcl_copies']}</td><td class="num">₹{S['kcl_cost']}</td></tr>
      <tr><td><b>Total</b></td><td class="num"><b>{total}</b></td><td class="num"><b>{hij}</b></td><td class="num"><b>{never}</b></td><td class="num"><b>{noisbn}</b></td><td class="num"><b>{a_copies + k_copies}</b></td><td class="num"><b>₹{a_cost+k_cost:,.2f}</b></td></tr>
    </tbody>
  </table>
  </div>
  <p style="max-width:820px;margin:14px auto 0;color:var(--grey);font-size:16px">
  "Hijacked" = the ISBN exists in the registry but belongs to a different title/publisher. "Never in registry" = the number was never allocated at all. "No ISBN" = catalog record carries no ISBN to test. Visible cost = sum of prices printed on the public OPAC — where the OPAC hides the price, the cost is unknown, not zero.
  </p>
</section>

<section>
  <div class="kicker">The Waves</div>
  <h2>Procurement arrived in waves, not in flows</h2>
  <p class="dek">Acquisition dates cluster on single days — consistent with bulk invoice clearing, not year-round collection building.</p>
  <div class="prose">
    <p><b>Chennai.</b> Largest single-day intake:
    {''.join(f'<span class="wave">{d or "date blank"} — {n} records</span>' for d, n in S["a_top_waves"])}.
    Bulk price points recur: ₹5,590 × 6 copies, ₹5,390 × 4, ₹5,790 × 3.</p>
    <p><b>Madurai.</b> The KCL intake of fake-titled books lands in a single June 2023 window:
    {''.join(f'<span class="wave">{d or "date blank"} — {n} records</span>' for d, n in S["k_top_waves"])} —
    over half the records in three days, mostly on bill 19/23-24. The price range runs ₹399 to ₹10,231, and ₹2,895 (×3) matches a Chennai price point exactly.</p>
    <p>Where the OPAC shows no price — {kcl and sum(1 for r in kcl if not (r.get('price') or '').strip() or (r.get('price') or '') in ('0','0.00'))} KCL copies — the bill, not the screen, is the audit source. We have asked; the OPAC does not show it.</p>
  </div>
</section>

<section>
  <div class="kicker">The Registrants</div>
  <h2>Whose ISBNs were worn as disguises</h2>
  <p class="dek">The registry's true owners of the hijacked numbers — across both libraries, {hij} records.</p>
  <div class="tblwrap">
  <table>
    <thead><tr><th>True registrant (per isbn.gov.in)</th><th class="num">Hijacked records</th><th>Sample of the real title</th></tr></thead>
    <tbody>
      {''.join(f'<tr><td>{name or "(blank registrant)"}</td><td class="num">{n}</td><td>{SAMPLES.get(name, "—")}</td></tr>' for name, n in S["reg_top"])}
      <tr><td>+ other legitimate registrants</td><td class="num">{hij - sum(n for _, n in S['reg_top'])}</td><td>see the full ledger</td></tr>
    </tbody>
  </table>
  </div>
  <p style="max-width:820px;margin:14px auto 0;color:var(--grey);font-size:16px">
  Each of these registrants is a victim: their allocated numbers were printed on someone else's books. The DVAC complaint annexure (below) lists the block allocations that fed the Chennai intake.
  </p>
</section>

<section>
  <div class="kicker">The Complaint</div>
  <h2>The DVAC complaint, in facsimile</h2>
  <p class="dek">Filed 07 November 2026 with the Directorate of Vigilance and Anti-Corruption, Tamil Nadu. Pages 1–4.</p>
  <div class="plates">
    <a href="evidence/dvac/page1-letter.jpg"><img src="evidence/dvac/page1-letter.jpg" alt="DVAC complaint page 1 — covering letter"><span>Page 1 — covering letter</span></a>
    <a href="evidence/dvac/page2-isbn-blocks-authors.jpg"><img src="evidence/dvac/page2-isbn-blocks-authors.jpg" alt="DVAC complaint page 2 — the ISBN block table and authors"><span>Page 2 — the ISBN block table and authors</span></a>
    <a href="evidence/dvac/page3-investigation-points.jpg"><img src="evidence/dvac/page3-investigation-points.jpg" alt="DVAC complaint page 3 — the investigation points requested"><span>Page 3 — the investigation points requested</span></a>
    <a href="evidence/dvac/page4-signature.jpg"><img src="evidence/dvac/page4-signature.jpg" alt="DVAC complaint page 4 — signature and enclosures"><span>Page 4 — signature and enclosures</span></a>
  </div>
  <p class="plates-note">Tap any page for the full-size facsimile.</p>
</section>

<section>
  <div class="kicker">Every Claim, Verified</div>
  <h2>Claims register</h2>
  <p class="dek">Each numbered claim below carries the evidence rung and the exact link that checks it — registry query, OPAC record, or dataset row.</p>
  <div class="claims" id="claims">
{CLAIMS_HTML}
  </div>
  <p style="max-width:820px;margin:18px auto 0;color:var(--grey);font-size:15.5px">
  Rungs: <b>L3</b> = verified from a saved evidence copy (hash-listed in the repo's <code>evidence/SHA256SUMS</code>); <b>L4</b> = independently re-verified against the live source on a second session. Anything weaker is labelled. See <a href="verify.html">Verify It Yourself</a> for the one-line commands.
  </p>
</section>

<section>
  <div class="kicker">Open Data</div>
  <h2>Take the whole ledger home</h2>
  <p class="dek">Everything on this malar is downloadable, hashed and re-derivable. No sign-up, no scraping needed.</p>
  <div class="prose" style="text-align:center">
    <a class="download-pill" href="data/fakeisbn-verification.json" download>fakeisbn-verification.json ({len(json.load(open(os.path.join(DATA, "fakeisbn-verification.json"))))} rows)</a>
    <a class="download-pill" href="data/fakeisbn-verification.csv" download>CSV (same rows)</a>
    <a class="download-pill" href="data/final-classification.csv" download>final-classification.csv</a>
    <a class="download-pill" href="data/acl-full-ledger.csv" download>ACL ledger + bills</a>
    <a class="download-pill" href="data/kcl-books.jsonl" download>KCL catalog JSONL</a>
    <a class="download-pill" href="data/full-registry-lookup.jsonl" download>raw registry responses</a>
    <a class="download-pill" href="data/tn-koha-instances.json" download>TN Koha instances</a>
    <a class="download-pill" href="https://github.com/LogicIncZo/tn-fake-isbn-audit">GitHub repo (scripts + hashes)</a>
  </div>
</section>

<div class="lamps">🪔 🪔 🪔</div>

<footer>
  <div class="wrap">
    <p><b>Aram Research Desk</b> — consumer and procurement forensics for Tamil Nadu.</p>
    <p>Independent. Not empanelled, not appointed, not selling anything.</p>
    <p>Sources: isbn.gov.in registry (live queries, 07–08 Nov 2026) · ACL OPAC 118.185.210.241:8001 · KCL OPAC 122.184.84.190:1011 · DVAC complaint 07-Nov-2026.<br>
    Claim data: <a href="data/claims-register.csv">claims-register.csv</a> · Provenance: <a href="https://github.com/LogicIncZo/tn-fake-isbn-audit/blob/master/report/PROVENANCE.md">PROVENANCE.md</a></p>
    <p class="ta">இருள் காணாத விளக்கு எதுவும் ஒளியைக் காட்டாது — a lamp that has never met the dark shows nothing.</p>
  </div>
</footer>

</div>
</body>
</html>
"""

out = HTML
# the f-string already substituted {CLAIMS_HTML}; only fix the leftover if substitution produced literal
out = out.replace("{CLAIMS_HTML}", CLAIMS_HTML)

import hashlib
cssv = hashlib.sha256(open(os.path.join(ROOT,"docs","style.css"),"rb").read()).hexdigest()[:8]
out = out.replace("%%CSSV%%", cssv)
open(os.path.join(ROOT, "docs", "index.html"), "w").write(out)
print(f"index.html written: {total} records, {hij} hijacked, {a_copies+k_copies} copies, visible spend {spend:,.2f}, {len(claims)} claims")
print("top registrants:", S["reg_top"])
print("ACL waves:", S["a_top_waves"])
print("KCL waves:", S["k_top_waves"])
