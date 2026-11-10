# Provenance — chain of custody and reproduction

Every figure in this pack traces to an artifact in this repo. What follows is the
chain: what was collected, from where, when, by which script.

## Catalog collections

### ACL Chennai (Anna Centenary Library OPAC, `118.185.210.241:8001`, Koha)

- **Legacy 27 records** (Phoenix block probe, 07 Nov 2026): `opac-detail.pl`
  pages for biblio 526239–526302 fetched manually during the initial drill-down;
  raw HTML + per-request probe log in `data/registry/phoenix-probes.jsonl`.
  These 27 carry real catalog titles in `data/acl-hijacked-full.csv`.
- **Full sweep, 08 Nov 2026**: every ISBN stem of the suspect publisher blocks
  (`data/fake-stems.json`) queried via `opac-search.pl` result pages
  (`scripts/stem_sweep.py`), then every hit biblio's detail page fetched
  (`scripts/fetch_acl_details.py`) into `evidence/acl-catalog-html/` (gitignored,
  archived at zo.pub). During this window the OPAC intermittently served its
  login wall for detail pages; **188 ACL rows therefore carry their title from
  the search-result listing and `catalog title unavailable` markers, with the
  corresponding raw page archived for audit.** ISBNs, acquisition dates and
  prices for these rows came from holdings tables that loaded successfully.
  Refetch queued for when the OPAC is stably reachable; the hijack verdicts do
  not depend on catalog titles — they are registry-verified (below).

### KCL Madurai (Kalaignar Centenary Library OPAC, `122.184.84.190:1011`, Koha)

- **Full sweep, 08 Nov 2026**: same stem-sweep method over KCL
  (`scripts/stem_sweep.py kcl`), then `scripts/harvest_kcl.py` +
  `scripts/extract_kcl.py` produced `evidence/kcl-catalog-html/` (745 pages:
  354 biblio detail + MARC) and `data/kcl-books.jsonl` → `data/kcl-ledger.csv`.
  All 354 records fetched cleanly. KCL holdings expose no price field, so
  acquisition cost for KCL is genuinely not computable from the OPAC.

## Registry verification (isbn.gov.in, live)

- All registry queries were POSTs to the ISBN registry's
  `Home/FillSearchText` endpoint from **ocitwo** (Oracle Cloud Mumbai,
  Indian vantage — isbn.gov.in rejects this sandbox's foreign IP), 07–08 Nov
  2026, batched 25 ISBNs per request (`scripts/verify_full_registry.py` writes
  the batch script; response JSONL appended per ISBN).
- Full per-ISBN results: `data/full-registry-lookup.jsonl`
  (198 ACL/KCL unique ISBNs + 123 KCL-stem probes).
- Publisher-prefix dumps used to characterise the blocks:
  `data/registry/isbngov-prefix-9789392360-37records.json` (Phoenix) and the
  Akal Vilakku equivalent in the 2026-11-06 dossier
  (`data/registry/fillsearch-akalvilakku.json`, `fillsearch-phoenix.json`).
- Raw registry evidence for the original complaint table:
  `data/registry/akalvilakku-records.csv` (+ `-full`), `phoenix-records.csv`.

## Classification

- `scripts/analyze_catalog.py` + classification pass → `data/final-classification.csv`
  (569 rows). Verdicts: `HIJACKED-ALLOCATED-ELSEWHERE` (ISBN valid + check-digit
  OK + registered to an unrelated publisher/author), `NOT-IN-REGISTRY`
  (ISBN was never allocated), `NO-ISBN-IN-CATALOG`.
- Registrant distribution among the 382 hijacked rows: Thenmozhi B (226),
  Hay House Publishers India (83), Ashok Chopra (20), Vidya Publications (19),
  Mohan R (15).

## DVAC complaint

`evidence/dvac-complaint/` holds pages of the DVAC complaint that triggered this
line of inquiry (Phoenix purchase invoice + ISBN-block tables + investigation
points + signature), plus `registry-stem-verify.py`, the script used to verify
the complaint's ISBN tables against the live registry on 07 Nov 2026
(`registry-stem-live-20261107.txt`).

## Beyond-Koha layer: NIC e-Granthalaya cloud (10 Nov 2026)

Question: does the factory reach government libraries that do not run Koha? The
second-biggest government-library platform is NIC's e-Granthalaya 4.0 cloud
(eg4.nic.in). Both relevant union catalogs were searched end-to-end with the
site's own ASP.NET postback flow (session cookie + ViewState harvested per
search, `DDL_Field` set per probe, Oxford control query proving execution):

- TAMILNADU client — 10 member libraries (TN Dr MGR Medical University college
  libraries + IIIT Tiruchirappalli): all three factory ISBNs return 0 records;
  pb:Phoenix = 1 (Walker, *The color purple*, Phoenix New Delhi 2004 — genuine
  homonym); pb:Thenmozhi = 2 (Guruthenmozhi, Chennai/Dindukal — different
  publisher); control pb:Oxford = 232.
- PUBLICLIBRARIES client — 127 member public/state/district libraries across
  Karnataka, Maharashtra, Punjab, Tripura, Lakshadweep, Jharkhand, MP, Manipur,
  Delhi and others (no Tamil Nadu district central library is on this cloud):
  all three factory ISBNs return 0 records; pb:Phoenix = 181 records in 20
  imprints, all genuine homonyms (Phoenix House London 1957, Phoenix
  Prakashani Bhadrak, Phoenix Sports Books, Phoenix New Delhi 2000s…); control
  pb:Oxford = 7,634.

Evidence: `evidence/eg4-sweep/*.html` (all responses, hashed in
`evidence/SHA256SUMS.txt`), `data/probes-eg4-sweep.jsonl` (request log),
`docs/data/eg4-sweep-summary.json` (summary), claims C60/C61.
Claim status: `confirmed` at A1 (POST form search, repeated rung-A1 probes,
each response saved + hashed). TN district central libraries beyond ACL/KCL
have no reachable public OPAC; the Directorate of Public Libraries main site
(tamilnadupubliclibraries.org) did not resolve from two vantages on 10 Nov
2026 (only the book-procurement subdomain lives).

## Publication surfaces
## Publication surfaces

- Ledger page: https://cashlessconsumer.zo.space/aram/fakeisbn/ledger
  (page source snapshot: `zo-space/ledger-page.tsx`; dataset served from the
  same repo: `data/fakeisbn-verification.json` / `.csv`).
- Raw evidence archive: https://zo.pub/cashlessconsumer/tn-fake-isbn-evidence
- This repo: https://github.com/LogicIncZo/tn-fake-isbn-audit

## Integrity

`evidence/SHA256SUMS` hashes every text/data artifact in this repo (excluding
the two gitignored scraped-HTML evidence directories, which are hashed in the
zo.pub archive manifest). Verify with `sha256sum -c evidence/SHA256SUMS`.

## Known gaps

1. ACL catalog titles for the 188 sweep-window records (login wall) — refetch
   queued; verdicts unaffected.
2. Per-copy cost beyond the visible ₹1,83,823.22 — requires DVAC-held purchase
   bills; we publish no number we cannot show.
3. KCL OPAC exposes no price field at all.

## Tooling note

Collections ran read-only: GET requests against public OPAC endpoints and the
registry's own search endpoint, ~1–1.5 s spacing, no authentication, no
login-circumvention, no writes to any target system.

## 2026-11-10 — DDG No.43 book-purchase series (Demand 43, 2018-19..2026-27)

Eleven `financedept.tn.gov.in` PDFs pulled from ocitwo (Indian vantage; the host 403s
the sandbox on its root and publications index and serves direct `/en/my-documents/`
paths normally). Bytes as received, hashed into `data/budget/SHA256SUMS`, never
re-saved by an editor. `scripts/fetch_ddg43.sh` replays the pull;
`data/budget/ddg43-sources.csv` maps each local file to its URL, budget year and
document kind. Text extracted with `pdftotext -layout`; object head 33402 lines
picked by regex with the four printed numeric columns kept verbatim alongside the
parsed value.

Cannot prove: that a vote was spent. DDG is the demand for grants as printed, with
actual columns filled from the treasury. The vouchers behind any object head are in
IFHRMS, which has no anonymous query.

Culled: bulk `financedept` mirror copies deleted after hash verification against
SHA256SUMS. Early drafts of the analysis note removed once superseded.

## 2026-11-10 — budget and procurement trail

Eleven Demand No.43 PDFs pulled from `financedept.tn.gov.in` over an Indian address
(ocitwo), 2018-19 to 2026-27, sha256 recorded in `data/budget/SHA256SUMS` before any
extraction. The publications index and the site root 403 the sandbox, so the DDG
paths were resolved from the index over ocitwo and fetched there; the sandbox never
touched the PDF bytes. CAG Report No.3 of 2023 (TN) came from `cag.gov.in`, same
hash discipline.

`pdftotext -layout` on each PDF. Object-head 33402 lines extracted with the four
numeric columns and the source line number, so any figure can be re-read from the
hash-matched PDF at the recorded line. Line numbers in
`data/budget/library-book-spend.csv` are 1-indexed on the extracted text, not the PDF.

What this cannot prove: the text layer. The 2022-23 and 2023-24 documents use a
broken Cyrillic-ish Tamil font mapping, so institution names were resolved from the
group code on the line and confirmed once per group against the English half of the
scheme header, not from the Tamil. A mis-mapped numeral would survive the hash
check — the defence is that every value is one `grep` away from its source line.

Also cannot prove: anything about what was actually billed. The series is votes and
actuals at object-head level. Bills, invoice numbers and the per-title split sit in
IFHRMS and in the libraries' own files, neither of which is public.
