> **[RETEST 2026-11-10] The hijack counts in this report are superseded.**
> The title comparator counted catalog formatting noise (series preambles, trailing
> punctuation, edition suffixes) as "hijack". Corrected counts: **14 confirmed hijacks**
> among KCL's 818 registry-hit ISBNs (not 812/99.3%), plus 50 unresolved partial-title
> rows, 100 registry rows with no title to check, and 654 same-work rows (edition
> variants / missing publisher). The 3,490 never-registered / 244 no-ISBN figures stand.
> See `notes/2026-11-10-kcl-comparator-retest.md` and `scripts/kcl_full_audit.py`.

# KCL full-catalog audit — every record, not just the 354

**Date:** 2026-11-09 (interim — publisher attribution still enriching)
**Target:** **KCL — Madurai District Central Library** Koha OPAC, the instance that gave us the original 354-record wave. Full-catalog harvest covers **all 4,576 biblio records** in that OPAC, not only the 354-ledger wave.

## What ran

1. **Catalog dump** — facet walk (`/cgi-bin/koha/opac-search.pl?idx=…&limit=50&count…`) over every shelf-facet letter, collecting `biblionumber, isbn, title, author, itemtype` for every record. 4,576 records (biblionumbers 4151–106841 range).
2. **Registry sweep** — every ISBN in the catalog queried against isbn.gov.in Home/IsbnSearch through the ocitwo (Mumbai) vantage. 3,746 unique ISBNs queried, 4,576 record-level results (duplicates collapse onto the same registry row). Sweep log line: `DONE items=4576 unique=4576`.
3. **Classification** (same rule as the ACL ledger, `scripts/kcl_full_audit.py`):
   - ISBN in registry but allocated to a **different title** (registration-title overlap < 60% vs catalog title) → `HIJACKED-ALLOCATED-ELSEWHERE`
   - ISBN in registry with a matching/near-matching title → `LEGIT`
   - ISBN not in registry → `NOT-IN-REGISTRY` (NOT evidence of fraud by itself)
   - catalog record has no ISBN / malformed ISBN → separate buckets
4. **Publisher enrichment** — 761 detail pages fetched (`opac-detail.pl`), 26X/$c parsed where present. **3,589 records still have no publisher string** — the MARC2 harvest (raw `opac-export` MARCXML incl. 264 + 300) is running on ocitwo to close this; it is the input for the full publisher table and price column.

## Numbers (2026-11-09, `data/kcl-full-audit.json`)

| verdict | records |
| --- | --- |
| HIJACKED-ALLOCATED-ELSEWHERE | **812** |
| LEGIT | 6 |
| NOT-IN-REGISTRY | 3,490 |
| NO-ISBN-IN-CATALOG | 244 |
| MALFORMED-ISBN | 24 |
| **total** | **4,576** |

- **Hijack rate among registry hits: 812 / 818 = 99.3%.** Of the 3,746 distinct ISBNs, 818 have registry rows; 812 of those rows allocate the number to a different title. Same shape as the original 354-wave (where every registry-hit ISBN was hijacked).
- The **3,490 NOT-IN-REGISTRY** bucket is *not* classified as fake — no registry row can mean withdrawn registration, a pre-ISBN import, a cataloguing typo, or an isbn.gov.in coverage gap. Resolving that bucket needs the MARC2 imprint/title columns and (for the strongest cases) publisher-direct check. It stays "unverified" in every public claim.
- The 6 LEGIT are genuine NEET/CUET coaching guides (biblionumbers 102617–102630) — the fraud is selective, not blanket.

## The 812 — scale-up of the known pattern

The original wave (354 records) was ACL→KCL visible hijacks by the fake publishers in `data/publishers.csv` (Phoenix, Blazing Numerics, Unique, SIP etc.). The full-catalog audit shows the wave was a **subset**: 812 records across KCL's whole catalog are registry-confirmed hijacks, i.e. **2.3× the visible wave**.

Attribution of the 812 to named fake publishers is still partial (761 records carry any publisher string). Early clusters from detail pages — before MARC2 normalization, so trailing-comma variants (e.g. "CBS Publishers & Distributors (P) Ltd. ," appearing twice) will merge:

| raw publisher cluster (unnormalised) | records | hijacked |
| --- | --- | --- |
| (unknown — pending MARC2) | 3,589 | 646 |
| CBS Publishers & Distributors variants | 140 | 112 |
| McGraw Hill variants | 104 | 22 |
| W W Norton variants | 77 | 0 |
| Sri R J Y Publications | 46 | 0 |
| B. Rathina Nayakar & Sons | 40 | 0 |

Do **not** read the notreg numbers in that table as "clean": they are records whose ISBN has no registry row. The publisher table that goes public comes after MARC2 + normalisation, with per-cluster verdict splits.

## Cost is still open

`kcl-ledger.csv` has price strings only for the 354-wave records. The full-catalog 812 need the item-level price (Koha items table via MARC 952/$p or OPAC availability export) — scheduled behind MARC2.

## Hashes

See `evidence/kcl-full-audit/SHA256SUMS.txt`:

- `data/kcl-registry-full.jsonl` — 65b978c2…8b50b0 (pulled final, 3,746 lines)
- `data/kcl-full-audit.json` — c76f77d9…bf76128d
- `evidence/kcl-full-audit/kcl_pubsweep.py` — 0aa910f6…c6b6786f3e

## What is pending (do not close this note)

1. MARC2 completion (~4 h from 14:14 IST launch) → publisher + imprint + item price for all 4,576.
2. Publisher normalisation (trailing commas, transliteration variants) → definitive cluster table for the report.
3. NOT-IN-REGISTRY deep pass on a stratified sample (50 records) to characterise that bucket honestly.
4. Report + site integration once publisher attribution is complete.

## Update 2026-11-11 — registry backfill-2 complete

Backfill-2 (1,313 remaining ISBNs on suspicious-publisher records, run from the
ocitwo Indian vantage, `data/kcl/backfill2-results.jsonl`, sha256
`0528cc1a544afda3afa4babb5009d319078c6434502fb0c59e458b3886cbc4cc`): 235 registry
rows returned, 1,078 confirmed absent. Verdicts reclassified.

- KCL hijacked: 15 → **19** (+4 medical/nursing/pharmacy textbooks on CBS/S Chand/
  Dream Kids World registrant ISBNs; 1 cross-script row quarantined, see below).
- KCL never-registered: 3,429 → **3,178** (251 ISBNs moved into registered buckets:
  +176 edition-mismatch, +126 title-match-pub-missing, +42 unresolved-partial,
  +14 registry-row-incomplete).
- New verdict bucket **UNRESOLVED-CROSS-SCRIPT (29)**: registry row exists, its
  title is in a non-Latin script (mostly Bengali), machine comparison impossible —
  quarantined, not counted as hijack. One of these (bib 212922,
  978-93-5501-039-1: TNPSC objective-arithmetic shelf copy vs registry
  "OBJECTIVE ARITHMETIC SSC AND RAILWAY EXAM SPECIAL", Himanshu Gupta, Tamil,
  29/07/2021) may actually be the same work mislabelled by the transilteration
  gap — left unresolved on purpose.
- Combined two-library figures: 181 hijacked / 3,708 never-registered. Phoenix
  imprint on 159 of 181 hijacked records (all Chennai).

Claims: C70 registers the retest; C54/C56 carry supersession pointers.
