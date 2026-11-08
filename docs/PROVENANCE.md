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
  (542 rows). Verdicts: `HIJACKED-ALLOCATED-ELSEWHERE` (ISBN valid + check-digit
  OK + registered to an unrelated publisher/author), `NOT-IN-REGISTRY`
  (ISBN was never allocated), `NO-ISBN-IN-CATALOG`.
- Registrant distribution among the 363 hijacked rows: Thenmozhi B (226),
  Hay House Publishers India (83), Ashok Chopra (20), Vidya Publications (19),
  Mohan R (15).

## DVAC complaint

`evidence/dvac-complaint/` holds pages of the DVAC complaint that triggered this
line of inquiry (Phoenix purchase invoice + ISBN-block tables + investigation
points + signature), plus `registry-stem-verify.py`, the script used to verify
the complaint's ISBN tables against the live registry on 07 Nov 2026
(`registry-stem-live-20261107.txt`).

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
2. Per-copy cost beyond ACL's visible ₹89,870 — requires DVAC-held purchase
   bills; we publish no number we cannot show.
3. KCL OPAC exposes no price field at all.

## Tooling note

Collections ran read-only: GET requests against public OPAC endpoints and the
registry's own search endpoint, ~1–1.5 s spacing, no authentication, no
login-circumvention, no writes to any target system.
