# TN Fake-ISBN Library Book Scam — Open Data Verification Pack

Every catalog record, registry response, and derived figure for the fake-ISBN book
procurement at Anna Centenary Library (ACL, Chennai) and Kalaignar Centenary Library
(KCL, Madurai) — the two flagship libraries of the Tamil Nadu Public Libraries
Department. What began as a DVAC complaint about ~₹35 lakh of suspicious purchases
in 2023 is here expanded by full digital audit of both OPACs against the live
isbn.gov.in registry.

**The malar (GitHub Pages):** https://logicinczo.github.io/tn-fake-isbn-audit/
**Mirror ledger:** https://cashlessconsumer.zo.space/aram/fakeisbn/ledger
**Raw evidence archive:** https://zo.pub/cashlessconsumer/tn-fake-isbn-evidence

## Headline numbers (all traceable to files below)

| Figure | Value | Source file |
| --- | --- | --- |
| Catalog records screened | 569 | `data/final-classification.csv` |
| — ACL Chennai (full sweep + legacy 27) | 215 | `data/final-classification.csv` |
| — KCL Madurai (full sweep) | 354 | `data/final-classification.csv` |
| Records carrying an ISBN hijacked to another registrant | 382 | `data/final-classification.csv` (164 ACL + 218 KCL) |
| ISBNs never allocated at all | 78 (51 ACL + 27 KCL) | same |
| Records with no ISBN in catalog | 109 KCL | same |
| Copies in hijacked records | 872 | `docs/data/fakeisbn-verification.json` |
| Visible acquisition cost (sum of OPAC-printed prices) | ₹1,83,823.22 (ACL ₹1,51,675.00 + KCL ₹32,148.22) | `docs/data/fakeisbn-verification.json` |
| Wave dates, ACL | 13.04.2024 (293 copies), 22.08.2024 (250), 28.06.2024 (10) | same |
| Wave dates, KCL | 12.06.2023 (366 copies), 13–14.06.2023 (75) | `data/kcl-books.jsonl` |
| TN books vote for public libraries, 2026-27 BE | ₹136.00 crore (2025-26 BE ₹168.00 crore) | `data/budget/library-book-spend.csv` |
| Dominant registry registrant of the hijacked ISBNs | "Thenmozhi B" (226 allocations), Hay House India (83) | `data/full-registry-lookup.jsonl` |

Labels: catalog figures = read directly from public OPAC pages (L4: artifact on disk).
Registry figures = live `isbn.gov.in` queries 07–08 Nov 2026 (L4: raw JSONL on disk).
"Cost of scam" beyond the visible ₹1,83,823.22 cannot be computed from OPAC alone —
ACL prices are printed on the OPAC for 280 of 419 hijacked copies; KCL prices are absent from its holdings screen but present on the two purchase-bill lines (19/23-24) recorded in the MARC data — that is the ₹32,148.22. The rest sits in bills DVAC holds; we do not claim a number we cannot show.

## The money side

The books in this audit are bought through one budget line: object head **33402
"Purchase of Books & Periodicals to Libraries"**, under 043 05 Directorate of
Public Libraries, inside Demand No. 43 School Education. That line is per
institution from 2022-23 and reaches **₹136 crore for 2026-27** across five
libraries. Full trail, every source PDF hashed:
`report/BUDGET-AND-PROCUREMENT-TRAIL.md`.

IFHRMS (`karuvoolam.tn.gov.in`) is where the bills would sit, but it is behind
DDO login — no public expenditure query. CAG's 2023 performance audit of IFHRMS
is the caveat on the treasury's own data (`data/budget/`, claims C64–C69).

## The shape of the finding

1. **Phoenix Publications / Akal Vilakku Pathipagam** obtained large ISBN blocks
   (see `report/PHOENIX-DOSSIER.md`: 1,157 allocations in Sep 2025 alone across
   the Akal Vilakku prefix; 3,102 total Phoenix allocations).
2. Books entered ACL/KCL catalogs carrying these ISBNs **with fake local titles**
   ("Democracy and Peoples Right in The Contemporary World — Jean Dreze, Phoenix
   2023") while the same ISBN is registered to **ordinary real books by unrelated
   registrants** (math texts by Thenmozhi B, Hay House titles, etc.).
3. Acquisition clustered in single-day waves — 43 copies in one day at ACL,
   173 at KCL — consistent with bulk purchase-bill procurement, not collection
   development.
4. Imprints are physically impossible: one publisher, four different places of
   publication across 27 records, all "published 2023".

5. The book text itself is cooked from existing work — real authors' identities,
   real books' blurbs, real titles' fragments. Anatomy with worked examples:
   <https://logicinczo.github.io/tn-fake-isbn-audit/anatomy.html>

## Repository layout

```
report/          Dossiers and analysis notes (PHOENIX-DOSSIER.md is the origin case;
                 BUDGET-AND-PROCUREMENT-TRAIL.md is the money side)
data/            Derived datasets (CSV/JSONL) — every figure above cites one
  registry/      Raw isbn.gov.in responses + probe logs + earlier DVAC crossmatch
  budget/        TN Detailed Demand for Grants No.43 PDFs (2018-19..2026-27) + extracted
                 object-head 33402 book-purchase series + CAG IFHRMS audit + SHA256SUMS
scripts/         The full pipeline — rerun to reproduce every dataset
evidence/        Raw HTML evidence (catalog pages) + DVAC complaint scans
  SHA256SUMS     Hash manifest over evidence/ and data/ (integrity pin)
```

`evidence/` is excluded from git (934 HTML files, ~99 MB) but is fully published at
the zo.pub archive above. The git repo pins its exact contents via `SHA256SUMS` —
cloned repo + archive download = verifiable proof without bloating git history.

## Reproduce

```bash
# 1. catalog sweep (OPAC search per ISBN stem -> biblio list -> detail pages)
python3 scripts/stem_sweep.py acl
python3 scripts/stem_sweep.py kcl
# 2. detail/MARC fetch
python3 scripts/fetch_acl_details.py
python3 scripts/harvest_kcl.py
# 3. parse to datasets
python3 scripts/extract_kcl.py
# 4. registry verification (isbn.gov.in FillSearchText, ~1 req/s)
python3 scripts/verify_full_registry.py
# 5. join + classify
python3 scripts/classify_full.py   # writes data/final-classification.csv
```

OPAC endpoints (public, unauthenticated, as of 2026-11-07/08):
- ACL: `http://118.185.210.241:8001/cgi-bin/koha/opac-*.pl` (Koha; was down for
  ~2 h on 07 Nov — scripts are resumable, rerun fills gaps)
- KCL: `http://122.184.84.190:1011/cgi-bin/koha/opac-*.pl` (Koha)

Registry: `https://isbn.gov.in/Home/FillSearchText` (POST `searchtype=isbn_number_Nodash`,
`search=<13 digits>`). Geo-fenced: run from an Indian IP.

## Provenance chain

- 2026-11-06: origin case (Akal Vilakku/Arivulagam, 27 ACL records, DVAC complaint
  analysis) — `report/00-analysis.md`
- 2026-11-07: Phoenix block hijack dossier + full-catalog audit begins —
  `report/PHOENIX-DOSSIER.md`, `data/registry/phoenix-probes.jsonl`
- 2026-11-07/08: full sweeps of both OPACs, 569 records, registry join —
  `data/final-classification.csv`, `evidence/SHA256SUMS`
- 2026-11-08: TN Koha fleet sweep — 5 additional Koha catalogs probed (Periyar
  University, Univ. of Madras, VIT, TNAU, CUTN); factory-fingerprint ISBN
  9789394612709 ("Data Analysis Using Python", registry: Thenmozhi B) found in
  ACL Chennai biblio 526405 + KCL Madurai biblio 100032, absent in all others —
  `data/koha-tn-sweep.csv`, `scripts/koha-tn-sweep.py`

Not affiliated with, endorsed by, or empanelled with any government body. Public
records, public registry, reproducible pipeline. Complaint status: DVAC complaint
exists (`evidence/dvac-complaint/` page scans); this pack is the open-data
companion that anyone can re-run and extend.

## License

Data: CC0 (Tamil Nadu public records). Code: MIT. Complaint scans: published as
received for public-interest verification.
