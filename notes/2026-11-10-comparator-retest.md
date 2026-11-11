# [RETEST] 2026-11-10 — KCL hijack comparator corrected; 812 figure retracted

Cites: `report/KCL-FULL-AUDIT.md` (2026-11-09), `report/KCL-FULL-INTERIM.md`
(2026-11-09), TLDR claims C60/C61 on the site, README headline table.

## What changed

The KCL full-catalog comparator counted *any* registry-hit ISBN whose catalog
title overlap fell below 0.75 as `HIJACKED-ALLOCATED-ELSEWHERE`. KCL catalog
titles carry formatting noise (trailing `/`, series preambles like "Theory and
Problems", `(Pb 2022)`, `6Ed`), and registry titles carry `(Edition 2)`-style
suffixes. That noise pushed same-work pairs across the boundary.

Example (biblio 42217): catalog "Schaum's Outline of Theory and Problems: of
Abstract Algebra /" vs registry "SCHAUMS OUTLINE OF ABSTRACT ALGEBRA (Edition
2)" — same work, overlap 0.71, old code said HIJACKED. 100 more rows had
registry allocations with **no title at all** (nothing to compare against) and
were auto-marked hijacked.

## Correction

`scripts/kcl_full_audit.py` rewritten:

- Edition/format noise tokens stripped before comparison; overlap threshold
  0.60 with digit-conflict guard kept.
- Author corroboration added (catalog author vs registry `Author`).
- Registry rows without a title are `REGISTRY-ROW-INCOMPLETE` (unverifiable),
  never HIJACKED.
- Overlap 0.35–0.75 is `UNRESOLVED-TITLE-PARTIAL` (needs human read), never
  HIJACKED.
- HIJACKED requires overlap < 0.35 with a titled registry row — i.e. the
  registered book and the catalog copy are plainly different works.

## New KCL numbers (all 4,576 records screened)

| Verdict | Old | New |
| --- | --- | --- |
| HIJACKED-ALLOCATED-ELSEWHERE | 812 | **14** |
| UNRESOLVED-TITLE-PARTIAL | — | 50 |
| REGISTRY-ROW-INCOMPLETE | — | 100 |
| TITLE-MATCH-PUB-MISSING | 6 ("LEGIT") | 334 |
| EDITION-MISMATCH-SAME-WORK | 0 | 320 |
| NOT-IN-REGISTRY | 3,490 | 3,490 (unchanged) |
| NO-ISBN-IN-CATALOG | 244 | 244 (unchanged) |
| MALFORMED-ISBN | 24 | 24 (unchanged) |

The 14 confirmed hijacks are medical/nursing/pharmacy textbooks where the
registry names a plainly different work on the same ISBN — spot-checked each:
catalog "Transforming Agriculture for Self Reliant India" vs registered
"Agriculture Than and Now"; catalog "Textbook of Pharmacology for BSc Nursing"
vs registered "Principle and Procedure Nursing Foundation (Vol II)"; catalog
"Sociology for GNM nursing students" vs registered "Textbook of Community
Health Nursing".

## What survives

- ACL Chennai (Phoenix wave): reclassified with the same comparator
  (`scripts/acl_reclassify.py`). 159 wave hijacks + 3 legacy = **162**, every
  one now carries registry title evidence on the row (they did not before —
  `registry_title` was empty for 159). 530 never-allocated ISBNs unchanged.
- Concentration: 124 of ACL's 162 in block 978-93-9461.
- 3,490 KCL + 530 ACL = 4,020 ISBNs never registered at all — unchanged, and
  still the largest signal.
- Costs and wave dates unchanged.

## What was wrong and is withdrawn

- "812 of 818 = 99.3% of registry-hit ISBNs hijacked" — comparator artifact.
- "Only 6 genuine records" — the 6 were survivors of the same noise; the
  honest same-work bucket is 654 (334 + 320).
- Publisher attribution computed over the 812 ("CBS 140/112 hijacked" etc.) —
  recomputed; the honest statement is thin attribution (4,289 records carry no
  publisher in the catalog screen; imprint-bearing records cluster in small
  Tamil imprints whose ISBNs are mostly never-registered, not hijacked).

Site pages (`docs/index.html`, `docs/ledger.html`, `docs/verify.html`),
README headline table, and both KCL reports carry the correction.
