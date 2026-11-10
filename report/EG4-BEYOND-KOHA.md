# Beyond Koha: NIC e-Granthalaya cloud sweep — 2026-11-10

Question: does the fake-ISBN factory reach TN government libraries that do not
run Koha?

## What was swept

NIC's e-Granthalaya 4.0 cloud (eg4.nic.in) hosts two union catalogs relevant to
public libraries. Every member library's holdings are searchable in one query
("Search All libraries" / union default), so the fingerprint matrix runs at the
union level:

| Client | Members | nb:…60091 | nb:…612709 | nb:…612778 | pb:Phoenix | pb:Thenmozhi | pb:Oxford (control) |
|---|---|---|---|---|---|---|---|
| TAMILNADU | 10 (TN Dr MGR Medical Univ colleges + IIIT Trichy) | 0 | 0 | 0 | 1 (Alice Walker, Phoenix New Delhi 2004 — homonym) | 2 (Guruthenmozhi — different publisher) | 232 |
| PUBLICLIBRARIES | 127 (district/state central + municipal public libraries, multi-state; zero TN entries) | 0 | 0 | 0 | 181 records / 20 imprints, all genuine homonyms (Phoenix House London 1957; Phoenix Prakashani Bhadrak; Phoenix Sports Books; Phoenix New Delhi 2000s) | 0 | 7,634 |

Method: ASP.NET WebForms postback — GET Default.aspx per client, harvest
session cookie + hidden fields, POST `txt_Search` + `DDL_Field`
(STANDARD_NO / PUB_NAME) + `Basic_Search_Bttn`; parse "Your Search Returned N
Record(s)"; row-level imprint strings extracted from the result Repeater.
Control queries prove the searches execute. ~1.1 s spacing, GET/POST only, no
authentication bypass, no writes.

Status: `confirmed` at A1 (repeated probes, every response saved and hashed).

## Findings

1. The factory's fingerprints are absent from the non-Koha government-library
   cloud layer probed (137 member OPACs, 10 Nov 2026).
2. TN district central libraries other than ACL/KCL have no reachable public
   OPAC at all (Koha or otherwise) — tamilnadupubliclibraries.org did not
   resolve from two vantages; only the DIPR book-procurement subdomain lives.
   The procured-stock funnel (DIPR → libraries) remains the only observable
   distribution surface, and that is where ACL/KCL were fed.
3. eGranthalaya's public-library footprint is concentrated in Karnataka,
   Maharashtra, Punjab, Tripura and the north-east — not TN. If the factory
   expands beyond the DIPR loop, this layer is the next watchpoint; the sweep
   is re-runnable from `scripts/eg4-sweep.py`.

Evidence: `evidence/eg4-sweep/` (14 hashed responses),
`data/probes-eg4-sweep.jsonl`, `docs/data/eg4-sweep-summary.json`,
claims C60/C61 in `data/claims-register.csv`.
