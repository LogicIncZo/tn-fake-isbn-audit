> **[RETEST 2026-11-10] The hijack counts in this report are superseded.**
> The title comparator counted catalog formatting noise (series preambles, trailing
> punctuation, edition suffixes) as "hijack". Corrected counts: **14 confirmed hijacks**
> among KCL's 818 registry-hit ISBNs (not 812/99.3%), plus 50 unresolved partial-title
> rows, 100 registry rows with no title to check, and 654 same-work rows (edition
> variants / missing publisher). The 3,490 never-registered / 244 no-ISBN figures stand.
> See `notes/2026-11-10-kcl-comparator-retest.md` and `scripts/kcl_full_audit.py`.

# KCL full-catalog screen — interim (2026-11-09, 15:15 IST)

Scope: every biblio record in the Anna Centenary Library… Kalaignar Centenary Library
Madurai (KCL) OPAC, pulled via `opac-search.pl?format=rss` in author-letter walks
(a–z + numeric), Indian vantage (ocitwo). Source: `data/kcl-catalog-full.jsonl`
(4,576 records). Registry: isbn.gov.in lookups for every ISBN-bearing record
(`data/kcl-registry-full.jsonl`, 3,746 distinct ISBNs).

## Headline (interim, classification complete; enrichment partial)

| Bucket | Records | % of ISBN-bearing |
| --- | --- | --- |
| HIJACKED-ALLOCATED-ELSEWHERE | 812 | 18.9% |
| LEGIT | 6 | 0.1% |
| NOT-IN-REGISTRY | 3,490 | 81.0% |
| NO-ISBN-IN-CATALOG | 244 | — |
| MALFORMED-ISBN | 24 | — |
| **Total catalog records** | **4,576** | |
| ISBN-bearing screened | 4,308 | |

- Hijack rate **among registry hits: 812/818 = 99.3%**. The KCL pattern is the ACL
  pattern at 13× the record count: ISBNs that exist in the registry were minted for
  different books; the library copy carries the hijacked number.
- The 6 LEGIT rows are from detail-page publisher enrichment (761/4,576 so far);
  legit classification can only grow as enrichment completes.
- 3,490 ISBN-bearing records (81%) carry ISBNs the registry has never heard of —
  same as ACL's fake blocks (978-93-92360-09-1 et al.).

## Verdict logic (unchanged from ACL/KCL 354 audit)

- Registry hit + title-overlap ≥0.75 + publisher match → LEGIT
- Registry hit + no match → HIJACKED-ALLOCATED-ELSEWHERE (registry original title/publisher recorded)
- No registry entry → NOT-IN-REGISTRY
- No ISBN in catalog row → NO-ISBN-IN-CATALOG; non-conforming string → MALFORMED-ISBN

## In flight (running on ocitwo, polite 2.5 s pacing)

1. Detail-page (normal view) harvest for publisher enrichment: ~761/4,575 done.
2. MARC-view harvest (`&view=marc`) for the accession date/price/bill trail: started 15:02 IST.

When both complete: rerun `scripts/kcl_full_audit.py` (it auto-globs
`/tmp/kcl-details-full/d-*.html`; MARC extraction ported from the 354-row extractor),
then the per-publisher cost table + acquisition waves complete. Claims C60–C63
registered as interim; final numbers will supersede in a dated [RETEST] on this note.

## Publisher snapshot at 761-enriched (top rows by records)

See `data/kcl-publisher-audit.csv` (212 publishers currently). Nothing here is final
until enrichment completes — publisher attribution for 3,815 records is still
"(publisher unknown — detail pages not harvested)".
