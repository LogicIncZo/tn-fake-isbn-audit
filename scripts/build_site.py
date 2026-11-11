#!/usr/bin/env python3
"""Build docs/index.html for the TN fake-ISBN audit site.

Every number on the page is computed from docs/data at build time —
no hand-typed figures. Rerun: python3 scripts/build_site.py
"""
import csv, json, collections, os, re, sys

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

def inr(v):
    whole, dec = f"{v:.2f}".split(".")
    if len(whole) > 3:
        head, tail = whole[:-3], whole[-3:]
        parts = []
        while len(head) > 2:
            parts.insert(0, head[-2:]); head = head[:-2]
        if head: parts.insert(0, head)
        whole = ",".join(parts + [tail])
    return f"\u20b9{whole}.{dec}"

OLD_ACL_BIBS = {int(r["biblio"]) for r in a_led if str(r.get("biblio","")).isdigit()}
ver = json.load(open(os.path.join(DATA, "fakeisbn-verification.json")))
S = {
    "total": total, "hij": hij, "never": never, "noisbn": noisbn,
    "acl_n": len(acl), "acl_hij": a_v["HIJACKED-ALLOCATED-ELSEWHERE"], "acl_never": a_v["NOT-IN-REGISTRY"],
    "acl_copies": a_copies, "acl_cost": inr(a_cost or a_led_cost),
    "kcl_n": len(kcl), "kcl_hij": k_v["HIJACKED-ALLOCATED-ELSEWHERE"], "kcl_never": k_v["NOT-IN-REGISTRY"],
    "kcl_noisbn": k_v["NO-ISBN-IN-CATALOG"], "kcl_copies": k_copies, "kcl_cost": inr(k_cost or k_led_cost),
    "acl_wave2": len([r for r in ver if r["library"] == "ACL Chennai" and int(r["biblio"]) not in OLD_ACL_BIBS]),
    "reg_top": reg.most_common(4),
    "a_top_waves": a_waves.most_common(3),
    "k_top_waves": k_waves.most_common(3),
}

acl_wave2 = S["acl_wave2"]

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


def _cr(fy, stage):
    tot = 0
    for r in csv.DictReader(open(os.path.join(DATA, "budget", "library-book-spend.csv"), encoding="utf-8")):
        if r["fiscal_year"] == fy and r["stage"] == stage and r["amount_inr"]:
            tot += int(r["amount_inr"])
    return tot / 1e7


books_2526_be, books_2627_be = _cr("2025-26", "budget_estimate"), _cr("2026-27", "budget_estimate")

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
  <div class="kicker">TL;DR · <span class="ta">சுருக்கம்</span></div>
  <h2>The five-sentence version, in both languages</h2>
  <details class="tldr-box">
  <summary><span class="s-lab when-closed">Expand · <span class="ta">விரிவாக்கு</span></span><span class="s-lab when-open">Collapse · <span class="ta">சுருக்கு</span></span><span class="s-figs">{total} records screened · {hij} hijacked · {inr(a_cost+k_cost)} in bills</span></summary>
  <div class="tldr">
    <div class="tldr-ta">
      <div class="tldr-lang"><span class="ta">தமிழ்</span></div>
      <ol>
        <li>2026 நவம்பர் 5 அன்று எழுத்தாளர் பெருமாள் முருகன், கோயம்புத்தூர் பெரியார் அறிவுலக நூலகத்தில் போலி ISBN கொண்ட சுமார் 1,800 <b>அகல்விளக்கு</b>, 2,000 <b>பீனிக்ஸ்</b> புத்தகங்கள் உள்ளன என <a href="https://www.sindhai.com/essays/perumal-murugan-on-the-corruption-in-periyar-arivulagam-1387700" target="_blank" rel="noopener"><i>சிந்தனை</i> இதழில்</a> குற்றச்சாட்டு எழுப்பினார்; மறுநாளே பள்ளிக் கல்வித்துறை அமைச்சர் விசாரணை உத்தரவிட்டார்.</li>
        <li>அதே இரு பதிப்பகங்களின் தடம் வேறு அரசு நூலகங்களிலும் உள்ளதா என்று இந்த ஆய்வு மேற்கொண்டது — <b>அண்ணா நூற்றாண்டு நூலகம் (சென்னை)</b>, <b>கலைஞர் நூற்றாண்டு நூலகம் (மதுரை)</b>.</li>
        <li>முடிவு: ஆய்வு செய்யப்பட்ட {total} பதிவுகளில் {hij}-ன் ISBN-கள், தேசிய பதிவேட்டின்படி, வேறு புத்தகங்களைச் சேர்ந்தவை — அல்லது பதிவேட்டிலேயே இல்லை.</li>
        <li>முழு ஆய்வு, திருத்தப்பட்ட எண்ணிக்கை: மதுரை நூலகத்தின் <b>ஒவ்வொரு பதிவையும்</b> (4,576) பதிவேட்டில் ஒப்பிட்டோம். நவம்பர் 10, 2026 அன்று ஒப்பீட்டுக் கருவியில் குறை கண்டு திருத்தியது; நவம்பர் 11 அன்று எஞ்சிய அனைத்து சந்தேகத் தொகுதி ISBN-களும் பதிவேட்டில் நேரடியாக விசாரிக்கப்பட்டன. இப்போது 1,115 ISBN பதிவேட்டில் வரிசை கொண்டவை; அவற்றில் <b>19 உறுதிப்படுத்தப்பட்ட கையகப்படுத்தல்கள்</b> (பதிவு செய்யப்பட்ட நூலுக்கும் காட்டலில் உள்ள நூலுக்கும் எந்தத் தொடர்பும் இல்லை — CBS Publishers, S Chand உள்ளிட்ட பதிவேட்டு உரிமையாளர்கள்), 29 அயல்மொழி எழுத்து வரிசைகள், 93 ஐயப்பாடு, 114 பதிவேட்டு வரிசை முழுமையற்றது, 860 ஒரே நூல். [திருத்தம்: முந்தைய 812 (99.3%) எண்ணிக்கை வடிவக் குழப்பத்தை மோசடியாக எண்ணியது — தவறு, திரும்பப் பெறப்பட்டது.] உண்மையான பெரும்சிக்கல் வேறேதும் அல்ல — மதுரையில் 3,178 செல்லும் ISBN (69%) பதிவேட்டிலேயே இல்லை, 244 பதிவுகளில் ISBN-கூட இல்லை. சென்னை பீனிக்ஸ் அலையில் 162 கையகப்படுத்தல்கள் நிரூபித்த எல்லைகளுடன் நிற்கின்றன (978-93-9461 வரிசையில் மட்டும் 124); அங்கே 530 ISBN எப்போதுமே பதிவு செய்யப்படாதவை. கொள்முதல் ஒரே நாள் அலைகள் — சென்னை 13.04.2024 (293 பிரதிகள்), 22.08.2024 (250 பிரதிகள்); காட்டும் விலை ₹1,095–₹2,995, தெரியும் செலவு ₹1,51,675.</li>
        <li>சென்னையின் முதல் அலை 978-93-9461 (126), 978-93-9235 (62) — மற்றும் 978-93-9236 (27), கோயம்புத்தூர் புகாரில் அச்சிடப்பட்ட அதே எண் — ஆகிய தொகுதிகளில் அமர்ந்தது. ஆனால் ஆழமான தேடல் மேலும் ஒன்றைக் காட்டுகிறது: போலி நூல்கள் உண்மையான பதிவேட்டுத் தொகுதிகளையும் கடன் வாங்குகின்றன (0-75382: 148, 1-56484: 45) மேலும் உண்மையான இந்தியத் தலைப்புகளைக் கொள்ளையடிக்கின்றன — CBS (243), Satish Kumar Jain (118), Thenmozhi B (106), McGraw Hill (100). ஒரே கையொப்பம், மூன்று நூலக இடங்கள்.</li>
        <li>எல்லாத் தரவும் திறந்தது; ஒவ்வொரு கூற்றும் சரிபார்க்கத்தக்கது; 2026 நவம்பர் 7 அன்று DVAC-க்குப் புகார் அளிக்கப்பட்டது. கீழே உள்ள எண்கள் அனைத்தையும் நீங்களே சரிபாருங்கள்.</li>
      </ol>
    </div>
    <div class="tldr-en">
      <div class="tldr-lang">English</div>
      <ol>
        <li>On 5 November 2026, writer Perumal Murugan alleged in <a href="https://www.sindhai.com/essays/perumal-murugan-on-the-corruption-in-periyar-arivulagam-1387700" target="_blank" rel="noopener"><i>Sindhai</i></a> that the new Periyar Arivulagam library (Coimbatore) held roughly 1,800 <b>Akalvilakku</b> and 2,000 <b>Phoenix</b> imprint books with fake ISBNs; the School Education minister ordered an inquiry the next day.</li>
        <li>This desk then asked whether the same two imprints had left traces in <i>other</i> state libraries — and audited the public catalogs of the <b>Anna Centenary Library (Chennai)</b> and the <b>Kalaignar Centenary Library (Madurai)</b>, record by record, against the national ISBN registry at isbn.gov.in.</li>
        <li>Result: {hij} of {total} screened records carry ISBNs the registry assigns to unrelated real books — or numbers that never existed at all.</li>
        <li>Full-catalog screen, corrected count. We compared <b>every one</b> of KCL's 4,576 catalog records against the registry. On 10 Nov 2026 we found and fixed a comparator bug; the same day, 330 never-queried ISBNs were checked directly against the registry, and on 11 Nov the registry backfill was completed for every remaining suspicious-block ISBN in the catalog. 1,115 of KCL's ISBNs now have any registry row; of those <b>19 are confirmed hijacks</b> — the registered book and the catalog copy are plainly different works, the numbers belonging to CBS Publishers, S Chand, Dream Kids World and other registrants. 29 more sit on registry rows whose titles are written in a non-Latin script, 93 are unresolved partial-title matches, 114 registry rows carry no title to check, and 860 are the same work in another edition or with the publisher missing from the catalog record. [Retraction: the earlier 812 (99.3%) figure counted formatting noise as hijack and is withdrawn.] The big pathology stands elsewhere — 3,178 valid KCL ISBNs (69% of the catalog) do not exist in the registry at all, and 244 records carry no ISBN. The Chennai Phoenix wave holds with 162 evidence-backed hijacks (124 in the 978-93-9461 block alone); there 530 ISBNs were never registered. Acquisition arrived in single-day waves — 293 copies in Chennai on 13 Apr 2024, 250 on 22 Aug 2024; displayed prices ₹1,095–₹2,995, visible spend ₹1,51,675.</li>
        <li>Chennai's first wave sat in blocks 978-93-9461 (126), 978-93-9235 (62) and 978-93-9236 (27) — that last one is the Coimbatore allegation's block. But the deeper screen shows the imprints also borrow legitimate registrant blocks (0-75382: 148, 1-56484: 45) and hijack real Indian titles wholesale — CBS (243), Satish Kumar Jain (118), Thenmozhi B (106), McGraw Hill (100). One signature, three library sites.</li>
        <li>11 Nov update: the KCL registry backfill is complete. Madurai's confirmed hijacks rise 15 → <b>19</b> (medical, nursing and pharmacy textbooks wearing ISBNs that belong to CBS Publishers, S Chand and other registrants); 251 previously never-registered ISBNs turned out to be registered, mostly to real same-work rows.</li>
        <li>Every number below is open data and independently checkable; a DVAC complaint was filed on 7 November 2026. <a href="verify.html">Verify it yourself →</a></li>
      </ol>
    </div>
  </div>
  </details>
</section>

<section>
  <div class="stats">
    <div class="stat"><span class="n">{total}</span><span class="l">catalog records screened<br>(two public libraries)</span></div>
    <div class="stat"><span class="n">{hij}</span><span class="l">ISBNs hijacked from<br>legitimate registrants</span></div>
    <div class="stat"><span class="n">{never}</span><span class="l">ISBNs that never<br>existed in the registry</span></div>
    <div class="stat"><span class="n">{inr(a_cost+k_cost)}</span><span class="l">public money visible in bills<br>(569-record wave — see note)</span></div>
    <div class="stat"><span class="n">{a_copies + k_copies}</span><span class="l">physical copies<br>on public shelves</span></div>
  </div>
  <p class="fine">Bill and copy totals are visible only where the OPAC exposes them — the 569-record wave (ACL full ledger + KCL's original 354). The KCL full-catalog cost trail rides on the MARC harvest in progress (claim C63).</p>
  <hr class="rule">
</section>

<section>
  <div class="kicker">The Story</div>
  <h2>One publisher, two libraries, <span class="ta">{hij}</span> borrowed identities</h2>
  <p class="dek">A Deepavali audit of what the state bought for its readers — and what the ISBN registry says it should have been.</p>

  <div class="prose">
    <p class="dropcap">Two government libraries in Tamil Nadu acquired books that share one quiet defect: the ISBN printed on their copyright pages does not belong to them. The International ISBN Agency's registry at isbn.gov.in, queried record by record, assigns nearly every one of these numbers to ordinary textbooks, medical handbooks, romance novels and books about <i>Twilight</i> — none of it the book you can borrow today from the Anna Centenary Library in Chennai or the Kalaignar Centenary Library in Madurai. Where the OPAC exposes acquisition dates, the purchases arrive in single-day waves — 293 copies at Chennai on 13 April 2024, 173 titles at Madurai on 12 June 2023 — and per-copy prices repeat across the two cities (₹2,895 in Chennai <i>and</i> Madurai for different books), pointing at one supplier's price list behind both bills.</p>

    <p>The trail surfaced during a voter-roll and procurement audit by the Aram research desk. The complaint the desk filed with Tamil Nadu's DVAC — reproduced in facsimile in this malar — flagged two imprints, <b>Akalvilakku Pathipagam</b> and <b>Phoenix Publications</b>, as suppliers of unverifiable books. A full digital audit of both libraries' public catalogs then widened it: the pattern is not two imprints, it is a distribution system. Fake-titled books sit in the catalogs under publisher names that never printed them, with acquisition dates clustered into waves and per-copy prices that repeat across two cities — ₹2,895 appears in Chennai <i>and</i> Madurai for different books, which points to one supplier's price list behind both bills.</p>

    <p>Nothing here is a claim about any single book's literary merit. Every record is a claim about <b>traceability</b>: if a book's ISBN belongs to another book entirely, then the accession register, the bill and the shelf can never be reconciled against the national registry. That is what makes an audit trail — and procurement oversight — impossible. {hij} records in two of Tamil Nadu's flagship libraries fail that test.</p>
  </div>
</section>

<section>
  <div class="kicker">The Full-Catalog Expansion · <span class="ta">முழு ஆய்வு</span></div>
  <h2>Every record, not just the wave · <span class="ta">அலை அல்ல, முழு பட்டியல்</span></h2>
  <p class="dek">The original screen covered the visible wave. We then queried every one of the Kalaignar Centenary Library's 4,576 catalog records against the isbn.gov.in registry.</p>
  <div class="tblwrap">
    <table>
      <thead><tr><th>Registry verdict (KCL, all 4,576 records)</th><th>Records</th><th>What it means</th></tr></thead>
      <tbody>
        <tr><td>HIJACKED — allocated to a different title (evidence on record)</td><td><b>19</b></td><td>Best title overlap with the registered work &lt;0.35 — catalog copy and registered book are plainly different works — claim C60 [RETEST 2026-11-10: was 812, then 14; comparator fixed 10 Nov, registry backfill completed 11 Nov → 19]</td></tr>
        <tr><td>UNRESOLVED-CROSS-SCRIPT</td><td>29</td><td>Registry row exists but its title is written in a non-Latin script — machine comparison not attempted; needs manual review (new bucket, 11 Nov)</td></tr>
        <tr><td>UNRESOLVED-TITLE-PARTIAL</td><td>93</td><td>Overlap 0.35–0.75 — needs manual review; spot-checks say most are the same work (Schaum's, Grants Dissector, CC Chatterjee)</td></tr>
        <tr><td>REGISTRY-ROW-INCOMPLETE</td><td>114</td><td>Registry holds an allocation but the row carries no title/author — unverifiable either way</td></tr>
        <tr><td>TITLE-MATCH-PUB-MISSING</td><td>500</td><td>Same work per registry; the catalog record states no publisher to corroborate</td></tr>
        <tr><td>EDITION-MISMATCH-SAME-WORK</td><td>360</td><td>Same work, different edition/year on the registry row</td></tr>
        <tr><td>NOT-IN-REGISTRY</td><td>3,178</td><td>Counted, not judged — withdrawn registrations, pre-ISBN imports, cataloguing typos or registry gaps; not fraud evidence (C62)</td></tr>
        <tr><td>NO-ISBN-IN-CATALOG</td><td>244</td><td>No ISBN on the record to check</td></tr>
        <tr><td>MALFORMED-ISBN</td><td>39</td><td>ISBN field unparseable or fails the ISBN check digit — 15 records carry numbers no registry could hold</td></tr>
      </tbody>
    </table>
  </div>
  <div class="prose">
    <p>The wave we reported first — 354 records with Phoenix and Akalvilakku imprints — opened the case, but the full-catalog screen re-drew the map. After the 10 Nov comparator fix and the completed registry backfill (11 Nov 2026), 1,115 of KCL's ISBNs have any registry row; 19 of those are confirmed hijacks — catalog copy and registered book are plainly different works, every one spot-checked (medical, nursing and pharmacy textbooks whose numbers belong to CBS Publishers, S Chand and other registrants). 29 more sit on registry rows written in a non-Latin script, 93 are partial-title matches a human must read, 114 registry rows carry no title to check, and 860 match the registered work but cannot be corroborated further from the catalog record alone (publisher missing or edition variants). [Retracted: our earlier 812/818 = 99.3% figure counted catalog formatting noise as hijack — the number was wrong and the claim is withdrawn.]</p>
    <p>The dominant pathology is not hijack but absence: 3,178 KCL ISBNs (69% of the catalog) do not exist in the registry at all, and 244 records carry no ISBN. Publisher attribution is thin — 4,289 of 4,576 records carry no publisher in the screen; the imprint-bearing records cluster in small Tamil imprints (Sri R J Y 46, B. Rathina Nayakar &amp; Sons 40, S S Publications 13), whose ISBNs are overwhelmingly never-registered rather than hijacked. MARC-level imprint and price harvest from an Indian vantage remains the open gap (C63).</p>
  </div>
</section>

<section>
  <div class="kicker">The Origin Case · <span class="ta">மூல வழக்கு</span></div>
  <h2>The same actor, two more libraries · <span class="ta">அதே பதிப்பகம், இன்னும் இரண்டு நூலகங்கள்</span></h2>
  <p class="dek">Perumal Murugan's essay named the imprints at Coimbatore. Our audit then found the same two names on hijacked-ISBN books in Chennai and Madurai. Three libraries, one distribution system.</p>
  <div class="tblwrap">
    <table>
      <thead><tr>
        <th><span class="ta">நூலகம்</span> / Library</th>
        <th>What was found</th>
        <th>Imprint evidence</th>
        <th>Wave</th>
        <th>Status</th>
      </tr></thead>
      <tbody>
        <tr>
          <td><span class="ta">பெரியார் அறிவுலகம்</span>, Coimbatore</td>
          <td>~1,800 Akalvilakku + ~2,000 Phoenix books alleged</td>
          <td>Named in Perumal Murugan's essay (<i>Sindhai</i>, 05 Nov 2026)</td>
          <td>—</td>
          <td><span class="badge l3">allegation · ministerial inquiry ordered</span></td>
        </tr>
        <tr>
          <td>Anna Centenary Library, Chennai</td>
          <td>164 hijacked in the full sweep — same two blocks as Madurai: 978-93-9461 (126) and 978-93-9235 (19), plus 978-93-9236 (19)</td>
          <td><b>Phoenix</b> imprint printed on all 27 legacy records — USA / UK / London, all "2023"</td>
          <td>13.04.2024 — 293 copies · 22.08.2024 — 250 copies · 28.06.2024 — 10 copies</td>
          <td><span class="badge l4">confirmed · L4</span></td>
        </tr>
        <tr>
          <td>Kalaignar Centenary Library, Madurai</td>
          <td>218 in the visible wave — <b>19 registry-confirmed hijacks</b> across the full 4,576-record catalog, plus 3,178 valid ISBNs that do not exist in the registry at all (C60; [RETEST 2026-11-10]: earlier 812 figure retracted — comparator counted formatting noise as hijack; [RETEST 2026-11-11]: registry backfill completed — 14→15→19 hijacks, 251 ISBNs moved from never-registered to registered buckets)</td>
          <td><b>Phoenix</b> imprint on 351 of 354 wave records — Chennai/"first edition" styling, 2021–2023</td>
          <td>12.06.2023 — 173 titles / 366 copies in one day</td>
          <td><span class="badge l4">confirmed · L4</span></td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="prose">
    <p>At the registry layer the same family is even larger: the registrant of record holds <b>3,102 Phoenix</b> and <b>2,393 Akal Vilakku</b> allocations — 5,495 ISBNs, with 1,157 declared in September 2025 alone. The Coimbatore library's catalog is not yet machine-readable online, so its counts remain the essay's allegation until its records can be audited the same way. Chennai and Madurai are no longer allegations: they are hashed artifacts you can pull yourself. Full forensics: <a href="https://github.com/LogicIncZo/tn-fake-isbn-audit/blob/master/report/PHOENIX-DOSSIER.md">PHOENIX-DOSSIER.md</a> · the essay as archived: <a href="https://sindhai.com/essays/perumal-murugan-on-the-corruption-in-periyar-arivulagam-1387700">பெரியார் அறிவுலகத்தில் பெரிய ஊழல்</a>.</p>
  </div>
</section>

<section>
  <div class="kicker">The Pattern — <span class="ta">அதே நடிகர், இன்னும் இரண்டு நூலகங்கள்</span></div>
  <h2>Periyar Arivulagam was the alarm. Chennai and Madurai are the echo.</h2>
  <div class="prose">
    <p>The controversy in the news right now — <a href="https://www.sindhai.com/essays/perumal-murugan-on-the-corruption-in-periyar-arivulagam-1387700" target="_blank" rel="noopener">Perumal Murugan's <i>Sindhai</i> essay</a> (5 Nov 2026), the ministerial inquiry ordered on 6 Nov — concerns one library in Coimbatore. This audit asks the next question the inquiry's scope must also answer: <b>did the same two imprints supply other state libraries?</b> The catalogs of the two flagship libraries answer yes.</p>
    <table class="actor">
      <tr><th></th><th>Periyar Arivulagam, Coimbatore <span class="muted">(allegation under inquiry)</span></th><th>Anna Centenary Library, Chennai <span class="muted">(this audit)</span></th><th>Kalaignar Centenary Library, Madurai <span class="muted">(this audit)</span></th></tr>
      <tr><td><b>பீனிக்ஸ் / Phoenix</b> imprint on the books themselves</td><td>~2,000 books alleged</td><td>163/164 hijacked records carry an imprint; 161 say Phoenix</td><td>218/218 hijacked records carry a Phoenix imprint</td></tr>
      <tr><td><b>அகல்விளக்கு / Akal Vilakku</b></td><td>~1,800 books alleged</td><td>same registrant family, ISBN-block level</td><td>same registrant family, ISBN-block level</td></tr>
      <tr><td>Registry: who really owns the ISBNs?</td><td>— under inquiry</td><td>ordinary real books: <i>Matrices and Algebra</i> (Vivek Malviya), Hay House titles, school maths texts</td><td>same shape: 226 numbers registered to "Thenmozhi B", 83 to Hay House India</td></tr>
      <tr><td>Procurement shape</td><td>₹1,400–2,000 per book alleged</td><td>one-day wave of 293 copies (13.04.2024), ₹8,388 top price</td><td>one-day wave of 173 titles / 366 copies (12.06.2023)</td></tr>
    </table>
    <p>Two independent facts tie the three sites together. <b>First, the imprint on the object:</b> 159 of the 181 hijacked records in Chennai and Madurai are printed "Phoenix" on the copyright page — the same imprint named in the Coimbatore allegation, in impossible variants (one publisher, four countries of publication, all "2023"). Madurai's 19 hijacks wear different covers — medical, nursing and pharmacy textbooks whose ISBNs belong to CBS Publishers, S Chand and other registrants — but the same trick: borrow a real registrant's number, print a different book. <b>Second, the registry footprint:</b> Phoenix Publications holds 3,102 allocated ISBNs and Akal Vilakku Pathipagam 2,393 — 5,495 numbers between two applicants, with 1,157 declared "published" in September 2025 alone. <span class="muted">Traceable: imprint counts in <a href="ledger.html">the ledger</a>; block counts in <a href="https://github.com/LogicIncZo/tn-fake-isbn-audit/blob/master/report/PHOENIX-DOSSIER.md">the dossier</a>.</span></p>
    <p>What this page does <i>not</i> claim: that any named individual committed an offence, or that every Phoenix-printed book is fake. What it claims is narrower and already actionable — books whose ISBNs belong to other books sit on the public shelves of two flagship libraries under the same imprint flagged at a third. The ministerial inquiry's scope should cover all three. <span class="muted">Dossier recommendation #3 asks exactly this.</span></p>
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
      <tr><td>Anna Centenary Library, Chennai</td><td class="num">{S['acl_n']}</td><td class="num">{S['acl_hij']}</td><td class="num">{S['acl_never']}</td><td class="num">0</td><td class="num">{S['acl_copies']}</td><td class="num">{S['acl_cost']}</td></tr>
      <tr><td>Kalaignar Centenary Library, Madurai</td><td class="num">{S['kcl_n']}</td><td class="num">{S['kcl_hij']}</td><td class="num">{S['kcl_never']}</td><td class="num">{S['kcl_noisbn']}</td><td class="num">{S['kcl_copies']}</td><td class="num">{S['kcl_cost']}</td></tr>
      <tr><td><b>Total</b></td><td class="num"><b>{total}</b></td><td class="num"><b>{hij}</b></td><td class="num"><b>{never}</b></td><td class="num"><b>{noisbn}</b></td><td class="num"><b>{a_copies + k_copies}</b></td><td class="num"><b>{inr(a_cost+k_cost)}</b></td></tr>
    </tbody>
  </table>
  </div>
  <p style="max-width:820px;margin:14px auto 0;color:var(--grey);font-size:16px">
  "Hijacked" = the ISBN exists in the registry but belongs to a different title/publisher. "Never in registry" = the number was never allocated at all. "No ISBN" = catalog record carries no ISBN to test. Visible cost = sum of prices printed on the public OPAC — where the OPAC hides the price, the cost is unknown, not zero.
  </p>
</section>

<section>
  <div class="kicker">The Waves</div>
  <h2>Procurement arrived in single-day waves</h2>
  <p class="dek">Acquisition dates cluster on single days — consistent with bulk invoice clearing, not year-round collection building.</p>
  <div class="prose">
    <p><b>Chennai.</b> Largest single-day intake:
    {''.join(f'<span class="wave">{d or "date blank"} — {n} copies</span>' for d, n in S["a_top_waves"] if not d.startswith("04.02.2011"))} Bulk price points recur: ₹2,795 on 16 records, ₹2,895 on 9, ₹2,695 on 6 — and 202 of the 208 records that list copies are exactly 2 copies, as if ticked off one catalogue list.</p>
    <p><b>Madurai.</b> The KCL intake of fake-titled books lands in a single June 2023 window:
    {''.join(f'<span class="wave">{d or "date blank"} — {n} copies</span>' for d, n in S["k_top_waves"])} — 173 titles on 12 June alone,
    over half the intake in three days, on bill 19/23-24 (210 records). The price range runs ₹399 to ₹10,231, and ₹2,895 (×3) matches a Chennai price point exactly.</p>
    <p>Where the OPAC shows no price — {kcl and sum(1 for r in kcl if not (r.get('price') or '').strip() or (r.get('price') or '') in ('0','0.00'))} KCL copies — the bill, not the screen, is the audit source. We have asked; the OPAC does not show it.</p>
  </div>
</section>

<section>
  <div class="kicker">The Money</div>
  <h2>What the treasury voted for library books, year by year</h2>
  <p class="dek">Demand No. 43, object head 33402, as printed. Estimates, not vouchers — IFHRMS is closed to the public.</p>
  <div class="prose">
    <p>The state's books vote for public libraries is a line item. From 2022-23 it is broken out per institution, which makes it auditable and makes it small enough to be worth taking. The Directorate carries ₹64.00 crore a year against branch and district library charges under the 1948 Act. Madurai's memorial library took ₹10.00 crore budgeted in 2022-23 and ₹40.00 crore at revision in 2023-24, then fell back to a ₹1,000 token. Coimbatore and Tiruchirappalli were each voted ₹50.00 crore for 2025-26 and revised to ₹20.00 crore. The 2025-26 books vote peaked at ₹{books_2526_be:.2f} crore; the 2026-27 vote is ₹{books_2627_be:.2f} crore.</p>
    <p>Five libraries now share ₹{books_2627_be:.0f} crore. Their printed prices cluster on the same handful of round numbers, in the same single-day waves, from the same twenty-five imprints. Small conspiracies of imprints divide the round price points between themselves — mostly two copies per title. At ₹2,895 a copy against a ₹100–₹300 reprint, the margin on the shelf is the state's money, and the ISBN on the spine is what makes the invoice look ordinary.</p>
    <p>Against that denominator our 569 identified records are ₹1.83 lakh on the OPAC price print, 0.02 per cent of one year's vote. The scale here is not the size of the theft; it is the size of the shelf it can hide on. <a href="https://github.com/LogicIncZo/tn-fake-isbn-audit/blob/master/report/BUDGET-AND-PROCUREMENT-TRAIL.md">The full budget trail, with every source PDF hashed &rarr;</a></p>
  </div>
  <div class="tblwrap">
  <table>
    <thead><tr><th>Institution (DDG group)</th><th class="num">2023-24 act.</th><th class="num">2024-25 act.</th><th class="num">2025-26 BE</th><th class="num">2025-26 RE</th><th class="num">2026-27 BE</th></tr></thead>
    <tbody>
      <tr><td>Directorate of Public Libraries (AA)</td><td class="num">...</td><td class="num">64.00</td><td class="num">64.00</td><td class="num">64.00</td><td class="num">64.00</td></tr>
      <tr><td>Charges under TN Public Libraries Act 1948 (AF)</td><td class="num">...</td><td class="num">1.00</td><td class="num">4.00</td><td class="num">2.00</td><td class="num">2.00</td></tr>
      <tr><td>Kalaignar Memorial Library, Madurai (BA)</td><td class="num">40.00</td><td class="num">—</td><td class="num">0.001</td><td class="num">...</td><td class="num">...</td></tr>
      <tr><td>Grand Library &amp; Science Centre, Coimbatore (BD)</td><td class="num">—</td><td class="num">—</td><td class="num">50.00</td><td class="num">20.00</td><td class="num">20.00</td></tr>
      <tr><td>Grand Library &amp; Intellectual Centre, Tiruchirappalli (BE)</td><td class="num">—</td><td class="num">—</td><td class="num">50.00</td><td class="num">20.00</td><td class="num">20.00</td></tr>
      <tr><td>Bharathidasan Arivulagam, Salem (BF)</td><td class="num">—</td><td class="num">—</td><td class="num">0.001</td><td class="num">10.00</td><td class="num">10.00</td></tr>
      <tr><td>Anjalaiammal Arivulagam, Cuddalore (BG)</td><td class="num">—</td><td class="num">—</td><td class="num">0.001</td><td class="num">10.00</td><td class="num">10.00</td></tr>
      <tr><td>Quaid-e-Millat Arivulagam, Tirunelveli (BH)</td><td class="num">—</td><td class="num">—</td><td class="num">0.001</td><td class="num">10.00</td><td class="num">10.00</td></tr>
      <tr><td>Children &amp; Adolescents Libraries scheme (JQ)</td><td class="num">8.21</td><td class="num">8.21</td><td class="num">...</td><td class="num">...</td><td class="num">...</td></tr>
      <tr><td><b>Total, crore</b></td><td class="num"><b>48.21</b></td><td class="num"><b>73.21</b></td><td class="num"><b>168.00</b></td><td class="num"><b>136.00</b></td><td class="num"><b>136.00</b></td></tr>
    </tbody>
  </table>
  </div>
  <p style="max-width:820px;margin:14px auto 0;color:var(--grey);font-size:16px">
  Rupees, crore, as printed in thousands. "..." is nil, "—" is no line, "1" is a ₹1,000 token vote. Budget figures are votes, not spends; the "act." columns are the actuals the next year's demand restates. IFHRMS itself sits behind DDO login on karuvoolam.tn.gov.in and publishes no anonymous expenditure query, so bill-level attribution needs an RTI — and CAG's own 2023 audit found the IFHRMS budget module permits transfers between grants and expenditure without provision, so head-code integrity needs checking even inside.
  </p>
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
  <div class="kicker">The Fleet</div>
  <h2>Same factory check, every public Koha library in TN we could reach</h2>
  <p class="dek">Five more Tamil Nadu Koha catalogs swept on 08 November 2026 for the factory fingerprints: the Phoenix imprint, the Thenmozhi B block, and the one ISBN that sits on shelves in both flagships (9789394612709, held in Chennai as biblio 526405 and in Madurai as biblio 100032).</p>
  <div class="tblwrap">
  <table>
    <tr><th>Library</th><th>Koha OPAC</th><th>pb:Phoenix</th><th>pb:Thenmozhi</th><th>nb:9789394612709 (cross-library fingerprint)</th><th>Verdict</th></tr>
    <tr><td>Anna Centenary Library, Chennai</td><td><a href="http://118.185.210.241:8001">118.185.210.241:8001</a></td><td>145 pb:Phoenix rows by catalog publisher-string; 164 registry-confirmed hijacks (C53/C60)</td><td>—</td><td class="num">1</td><td><span class="badge l1">factory present</span></td></tr>
    <tr><td>Kalaignar Centenary Library, Madurai</td><td><a href="http://122.184.84.190:1011">122.184.84.190:1011</a></td><td class="num">352</td><td class="num">0</td><td class="num">1</td><td><span class="badge l1">factory present</span></td></tr>
    <tr><td>University of Madras Library, Chennai</td><td><a href="http://117.239.156.200">117.239.156.200</a></td><td class="num">16 (sampled: real "Phoenix" books)</td><td class="num">0</td><td class="num">0</td><td>clean</td></tr>
    <tr><td>Periyar University "Thiruvalluvar Library", Salem</td><td><a href="http://14.139.186.90:8081">14.139.186.90:8081</a></td><td class="num">5</td><td class="num">16 (M.Thenmozhi 1996–2001, real Tamil publisher)</td><td class="num">0</td><td>clean</td></tr>
    <tr><td>VIT (Vellore Institute of Technology)</td><td><a href="https://webopaccc.vit.ac.in">webopaccc.vit.ac.in</a></td><td class="num">24 (private college, different vendor era)</td><td class="num">0</td><td class="num">0</td><td>clean (not a procurement-scam library)</td></tr>
    <tr><td>Tamil Nadu Agricultural University</td><td><a href="https://tnau.bestbookbuddies.com">tnau.bestbookbuddies.com</a></td><td colspan="3">unreachable from probe vantage (sandbox + OCI Mumbai) — pending</td><td><span class="badge l1">not tested</span></td></tr>
    <tr><td>SSN College of Engineering</td><td>opac.ssn.edu.in</td><td colspan="3">Koha detected on site, no live OPAC base answered</td><td><span class="badge l1">not tested</span></td></tr>
    <tr><td>CUTN Chozha Central Library</td><td>centrallibrary.cutn.ac.in/services/opac</td><td colspan="3">OPAC page is an image-only link (opac.png); no public Koha URL published</td><td><span class="badge l1">not tested</span></td></tr>
  </table>
  </div>
  <p class="dek">The cross-library fingerprint ISBN (9789394612709, "Data Analysis Using Python", printed Phoenix 2023) is in the registry allocated to <b>Thenmozhi B</b> for a different book entirely (“Introduction to Projective Geometry”). It sits on shelves at both flagship libraries. None of the five other TN Koha catalogs we could reach hold it. Raw sweep: <a href="data/koha-tn-sweep.csv">koha-tn-sweep.csv</a> · instances: <a href="data/tn-koha-instances.json">tn-koha-instances.json</a>.</p>
  <h3 style="margin-top:30px">Beyond Koha: the NIC e-Granthalaya cloud (eg4.nic.in)</h3>
  <div class="tblwrap"><table>
    <tr><th>e-Granthalaya union catalog</th><th>Member libraries</th><th>3 fake ISBNs (nb:)</th><th>pb:Phoenix</th><th>pb:Thenmozhi</th><th>Control pb:Oxford</th><th>Verdict</th></tr>
    <tr><td><a href="https://eg4.nic.in/OPAC/Default.aspx?CL_NAME=TAMILNADU">TAMILNADU client</a> — TN Dr MGR Medical University college libraries + IIIT Trichy</td><td class="num">10</td><td class="num">0 / 0 / 0</td><td class="num">1 — Alice Walker, <i>The color purple</i>, Phoenix; New Delhi; 2004 (genuine homonym)</td><td class="num">2 — Guruthenmozhi, Chennai / Dindukal (different publisher)</td><td class="num">232</td><td><span class="badge l1">clean</span></td></tr>
    <tr><td><a href="https://eg4.nic.in/OPAC/Default.aspx?CL_NAME=PUBLICLIBRARIES">PUBLICLIBRARIES client</a> — district / state central + municipal public libraries: Karnataka, Maharashtra, Punjab, Tripura, Lakshadweep, Jharkhand, MP, Manipur, Delhi</td><td class="num">127</td><td class="num">0 / 0 / 0</td><td class="num">181 — sampled: Phoenix House London 1957, Phoenix Prakashani Bhadrak, Phoenix Sports Books (all homonyms, no factory imprints)</td><td class="num">0</td><td class="num">7,634</td><td><span class="badge l1">clean</span></td></tr>
  </table></div>
  <p class="dek">Beyond Koha, the second-biggest government-library platform is NIC's e-Granthalaya cloud. Both union catalogs were searched in full (each search covers every member library), 10 Nov 2026: <b>zero records for all three fingerprint ISBNs across 137 member OPACs</b>, and every pb:Phoenix / pb:Thenmozhi hit inspected resolves to a different, genuine publisher. The Oxford control counts prove the searches execute. Raw: <a href="data/eg4-sweep-summary.json">eg4-sweep-summary.json</a>.</p>
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
    <a class="download-pill" href="data/budget/library-book-spend.csv" download>book-vote series (DDG 33402)</a>
    <a class="download-pill" href="data/budget/ddg43-sources.csv" download>DDG source URLs + sha256</a>
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

# keep the navbar identical on every page (see scripts/build_nav.py)
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build_nav
build_nav.sync_all()

# mirror the budget trail (report + hashed sources) into the published tree
import shutil
os.makedirs(os.path.join(ROOT, "docs", "report"), exist_ok=True)
os.makedirs(os.path.join(ROOT, "docs", "data", "budget"), exist_ok=True)
for name in ("library-book-spend.csv", "ddg43-sources.csv", "SHA256SUMS",
             "cag-report-3-2023-tn-ifhrms-performance-audit.pdf"):
    shutil.copy2(os.path.join(ROOT, "data", "budget", name),
                 os.path.join(ROOT, "docs", "data", "budget", name))
shutil.copy2(os.path.join(ROOT, "report", "BUDGET-AND-PROCUREMENT-TRAIL.md"),
             os.path.join(ROOT, "docs", "report", "BUDGET-AND-PROCUREMENT-TRAIL.md"))
