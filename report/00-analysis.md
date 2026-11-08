# Periyar Arivulagam book procurement — round-1 data analysis

Date: 2026-11-06 · Tag: \[DATA\]\[TENDER\] · Status: OSINT round 1; RTI deferred

## Dataset

- `file data/books.csv` (16 titles), `file data/authors.csv` (28 author names), `file data/claims.csv` (12 claims, labelled eyewitness / official / our OSINT / disputed)
- `file data/scam.duckdb` tables: books, authors, claims, series_authors
- Sources archived under `sources/` (Sindhai essay md+html, News Today minister response)

## Title analysis

- 11 of 16 titles form one template series: நகர நீர் / நகரம் + colon + abstract subtitle, recombining 5 stems (நகர நீர், நகரம், நகரத்து, நகரத்தின், நகரமும்) with formulaic suffixes (சுகாதாரம், சட்டங்கள், கல்வி, எதிர்காலம், அமைப்புகள்…). Authors repeat across near-duplicate titles (Jothi Hariharan ×2, Keerthi Govind ×2, Karthika Avinash ×2).
- 5 inline-flagged titles carry factual falsifications (Naladiyar as "poet", Maduraik Kaanji authorship swapped to the patron-king, false TN political history, wrong Keeladi artifact photo, Bharathiyar-prose pastiche).

## Author-name generator evidence (our inference, from 28 names)

- 7 shared-surname clusters: பாலு ×3 (Surya/Mangaleswari/Vijaya), சேதுராமன் ×3 (Brindha/Darshini/Malathi), சரவணன் ×2, அன்பழகன் ×2, பன்னீர் ×2, சூர்யா ×2, தினேஷ் ×2 — first-name pool × surname-pool recombination, consistent with pseudonyms.
- Pool recycling: சூர்யா and சக்தி appear as BOTH first names and surnames across different authors (Surya Balu ↔ Monica Surya/Sakthi Surya; Madhu Sakthi ↔ Sakthi Surya).
- Film-star-flavoured names (Suriya, Trisha, Vijay) incl. the CM's own name (திரிஷா விஜய்).
- Absence check: OpenLibrary 0 hits for sampled authors + imprint; exact-quote web search 0 footprint for imprint and gmail.

## Price analysis (verified figures only: 2 books with stated pages+MRSP)

- ₹1,445/300pp and ₹1,395/300pp = ₹4.82 and ₹4.65 per page vs market norm ₹1.08/pp (₹325/300pp per essay's comparison) → **\~4.4× per-page premium**, uniformly applied across the publisher's list per eyewitness + X corroboration.
- **Revenue calibration (our estimate):** 1,800 × ₹1,400–2,000 = **₹25–36 lakh (\~₹0.3 cr) for Agalvilakku alone** — NOT "crores". The essay's crore suspicion only holds if the pattern spans all vendors vs the ₹50 cr book budget (C10) and Phoenix + unsorted boxes. Must not repeat the crore figure as established.

## Claim discipline corrections (this round)

- X claim "publisher address is a fake locality" (C4): **DISPUTED by our maps check** — Bharat Nagar + Brahmaputra Street exist in PIN 600091, under Keelkattalai (adjacent to Madipakkam; postal overlap plausible). The essay itself makes no such claim. Do not use the fake-street line.

## Open data to acquire (next OSINT rounds)

1. ISBN numbers from book photos (X media) → ISBN registry + WorldCat + Google Books (API quota reset) + Amazon/Flipkart absence checks
2. Phoenix Pathippagam (பீனிக்ஸ் பதிப்பகம்) title set
3. Physical specimen via public library visit (title page, ISBN, MRSP, printer line, GST on any labels)
4. June 2026 delivery timeline: procurement file RTI only after 1–3 exhausted

## Round 2 update (2026-11-07)

Items 1–2 partially done via ACL route: Phoenix/"Jean Dreze" title set found in Anna Centenary Library Koha (27 records on prefix 978-93-92360), all registry-verified as mismatches. See `../2026-11-07-phoenix-isbn-block-hijack/`. Google Books check still parked (API quota).

## Page (2026-11-06)

- zo.space `/aram/periyar-llm` — "The LLM Book Factory at Periyar Arivulagam". Five levels: L1 text forensics (translationese, agreement errors, entity-confusion, half-right trivia), L2 catalogue-as-generator-output, L3 unit economics (≈4.4× market page rate), L4 falsifiable tests, L5 systemic exposure (₹50cr book budget = national attack surface). Status: **private, pending user sign-off** (right-of-reply draft embedded). OG title/description set per-route; OG image = global default.

## Process chain — book selection & procurement (mapped 2026-11-06, from G.O.263 + tweet)

- G.O. Ms 198, School Edn (பொ.பூ.2), 03.09.2024 — original sanction ₹300 cr: building+furniture 245 / books+e-books 50 / ICT 5.
- G.O. Ms 106, School Edn (பொ.பூ.2), \~06/09.05.2025 — books procurement stream (referenced in both G.O.263 and the tweet's books GO). FETCH.
- G.O. (B) 106, 03.07.2025; G.O. 282/2025; G.O. 224 / 21.11.2025; G.O. (B) 283 / 06.11.2025 — GO chain cited in the books GO (tweet img 1).
- "பெரியார் அறிவுலகம் ஒப்புதல் Committee-2025" — 6 members (officials + Tamil scholars, mobile numbers on order; tweet img 2). Committee = recommendation only.
- G.O. Ms 263, School Edn (பொ.பூ.2), 11.11.2025 — building enhancement ₹245.00→246.70 cr (SoR variation; PWD CE letter 14.07.2025; IFHRMS ASL 2025111725; signed Addl CS School Edn; concurrence under TN Financial Code Sch-A). FULL TEXT + PNG pages archived in sources/.
- Practice: NO tender on e-procurement for book supply (Arappor mirror zero) → ₹50 cr via direct/departmental purchase on committee recommendation. Badri Seshadri (23 Oct): delivery June 2026, Agalvilakku + Periyar Arivulagam imprints, ₹1,400–2,000/book.
- Gap = process violation surface: committee recommendation ≠ tender compliance; no published content-quality gate (LLM books + fake authors passed); publisher name mirrors institution name.
- RTI queue (LAST): G.O.106/2025 full text; committee minutes + attendance + title list approved; supplier selection basis/tender-exemption order; POs+invoices; delivery receipts; IFHRMS vouchers ₹50 cr.

## DPL Transparent Book Procurement Portal (bookprocurement.tamilnadupubliclibraries.org) — mapped 2026-11-06

The Directorate of Public Libraries (School Education dept — same dept as the GO chain) runs a mandatory "Transparent Book Procurement" portal (policy 2024): 996 publishers / 49 distributors / 157 pub-cum-dist registered.
Process per Guidelines+FAQ: registration w/ track-record disclosure (years, titles, bestsellers, awards) + ownership docs + Excel catalogue → per-book application (valid ISBN MANDATORY, fee per book, 20–25pp digital excerpt, 5 print copies: 2 review cell + 1 Connemara + 1 ACL + 1 Kalaignar Madurai under Delivery of Books Act 1954) → quality gates (paper/print/binding; false info = rejection/further action) → price negotiation vs DPL Price Index (paper/print/binding/prepress/royalty factors) → consolidated point selection (Selection Committee + subject experts + librarians + users) → readers' forum approves final list within budget → central facility Chennai → official delivery partner → 2-year purchase window; quarterly cycles (indent deadlines Jun30/Sep30/Dec31/Mar31).
CENTRAL QUESTION: was the ₹50 cr Periyar Arivulagam purchase routed through this portal?

- If YES → Agalvilakku must appear as registered publisher w/ track-record declaration; \~1,800 applications w/ ISBNs + 9,000 submitted copies + fees + scores + price-index negotiation records + readers' forum approval. Fake ISBNs should have failed the eligibility gate; overnight imprint fails track-record; ₹1,445/300pp fails price index. Portal records = confession ledger (RTI targets).
- If NO → state flagship bypassed its own transparency system. Either way a finding.
- Scope check needed: does Transparent Book Procurement Policy 2024 bind ALL govt library procurement incl. new flagship knowledge centres (School Edn projects), or only DPL/LLA libraries under the 1948 Act? Find the constituting GO (Policy 2024).
- Site-search: no Agalvilakku/Phoenix trace indexed on portal (weak signal — publisher pages likely unindexed). FAQ/About pages archived to sources/dpl-portal/.
- Irony for the record: portal banner = Kural "எல்லா விளக்கும் விளக்கல்ல…" (only the lamp that doesn't deceive the wise is a lamp); suspect imprint named அகல்விளக்கு — the extinguished lamp. Portal cart widget still shows grocery-template junk ("Stacy's Pita Chips", "Free shipping under 10km") — build quality of the transparency platform.
- RTI queue updated: (i) Agalvilakku/Phoenix portal registrations + declarations; (ii) their book applications w/ ISBN validation records; (iii) review scores + readers' forum minutes; (iv) price-index negotiation records; (v) central facility GRN for the June 2026 delivery; (vi) Transparent Book Procurement Policy 2024 GO + scope; (vii) whether Periyar Arivulagam ₹50 cr was inside or outside the portal.

## A2 sweep — DPL portal (2026-11-06)

Ceiling respected: A2 only, read-only, no registration, 1 req/s. Log: `file sources/dpl-portal/probes.jsonl`.

Found: admin dir nginx-403'd whole (member side only); 12 listing routes 404; no sitemap; no security.txt ever
(2024 snapshot 404s too); public `forgotform` is username-only with two role radios; full 23-page procurement policy
is a public asset (`file sources/dpl-portal/Book-Procurement-Policy-Document.pdf`, inventoried in `file 00-policy-inventory.md`).

Key: policy §2 puts these purchases outside the Tenders Act 1998 by design, §23 already lists fake books and author
swapping as 5-year offences, §22 opens an application-free "special cases" lane, §19(ii) mandates a public selected-book
list that the portal does not serve. The failure is execution, not policy.

Card exhausted — every remaining question (fee amount, ISBN validation, price index, score sheets, selected lists,
committee constitution, supplier/P.O. records) sits behind the member login. Ceiling raise to A3 required.

## Cross-link (2026-11-06): parallel timeline with the Agal Vilakku scheme

User hunch mapped 2024→2026 across both dossiers: scheme milestones (G.O. 198 → Demand-for-Grants announcement → 09.08.2025 launch → G.O. 263) against the imprint's isbn.gov.in corpus (2,393 titles, 6 prefixes, 636 applicants; bursts Dec-2024 / Sep-2025 / Feb-2026). Full note + hashed derivative:
`file 2026-11-06-agalvilakku-scheme-audit/notes/2026-11-06-parallel-timeline-agalvilakku-vs-publisher.md`
Headline: timing correlation is real and structural (block filings within weeks of scheme launch and pre-election window); ownership and allotment trail remain document/RTI asks. Also: the essay's "fake ISBN" claim is corrected — registrations are real.

## GST status of the publisher (2026-11-07)

`inferred` — at A0 (public records). **No GST registration traceable** for Akal/Agal
Vilakku Pathipagam (Madipakkam 600091). Swept: general web, GST directory sites
(gst.jamku.app, mastersindia.co) — zero indexed GSTIN pages; ZaubaCorp/MCA — no
company/LLP entity of that name (so no corporate GST either); aggregator
name-search endpoints from ocitwo (Indian IP) — empty; DPL portal approved/
negotiation lists read at A3 — publisher-scoped only, other publishers' GSTINs
not visible to a publisher account.

Variants tried: akal/agal × vilakku × pathipagam/publication(s). A proprietorship
registered under a personal PAN with a different trade name cannot be ruled out
from outside — the official GSTN portal has no public name search (GSTIN/PAN only).

Why the gap matters: printed books are GST-exempt (HSN 4901) but exempt turnover
still counts toward the ₹20 lakh registration threshold (CGST s.2(112)); a press
that produced \~2,393 titles for a state-wide buy almost certainly crossed it, so a
GSTIN should exist. If POs/invoices were paid without one, that is a second,
paper-level finding independent of the price ones. Settles with one RTI line:
GSTIN (or certified nil) for the trade name + address — fold into the existing
RTI draft.