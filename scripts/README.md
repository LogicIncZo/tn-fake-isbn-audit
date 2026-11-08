# Scripts

Run order per README "Reproduce". Each script is resumable (skips completed work)
and logs HTTP codes per request. All catalog fetches GET-only, ~1 req/s, no auth.

- `stem_sweep.py <acl|kcl>` — search each fake-publisher ISBN stem in the OPAC,
  collect biblionumbers (all pages)
- `fetch_acl_details.py` / `harvest_kcl.py` — fetch detail + MARC pages per biblio
- `extract_kcl.py` — parse detail/MARC HTML -> `data/kcl-books.jsonl`, ledger
- `verify_full_registry.py` — ISBN-by-ISBN registry lookup via
  isbn.gov.in/Home/FillSearchText (needs Indian IP; ~1 req/s; resumable via
  data/full-registry-lookup.jsonl)
- `classify_full.py` — join catalog rows with registry rows ->
  data/final-classification.csv (verdict taxonomy in file header)
