# Case: Periyar Arivulagam book procurement — OSINT-first plan

Date: 2026-11-06
Tag: [TENDER]/[DATA]
Status: OSINT round 1 done; RTI is deliberately LAST.

## Case in one line

Perumal Murugan's Sindhai essay (2026-11-05) alleges thousands of likely-fake books (~1,800 from an unknown imprint "அகல்விளக்கு பதிப்பகம்", 100+ from "பீனிக்ஸ் பதிப்பகம்") inside the ~₹50 cr book budget of the Periyar Arivulagam library (Coimbatore, prison-land, inaugurated 2025-07-01); all ISBNs allegedly fake; template-generated author surnames. Minister Rajamohan announced an inquiry same day.

## Evidence so far (verified today)

- Primary source essay archived locally: `sources/sindhai-essay-perumal-murugan-2026-11-05.md` (+ HTML). Wayback save initiated 2026-11-06.
- Minister response: `sources/newstodaynet-minister-response-2026-11-06.md`.
- Cloudflare-obfuscated email decoded from essay HTML: **akalvilakkupathipagam@gmail.com** — printed inside the books as the publisher contact.
- Exact-quoted web search for "akalvilakkupathipagam": **zero footprint** for the publisher imprint (only the 1958 Varadharajan novel / 1979 film / school scheme of the same name).
- OpenLibrary: **0 results** for `author:Surya Balu`, `author:Manisha Saravanan Tamil`, publisher "அகல்விளக்கு பதிப்பகம்".
- Google Books API: quota-limited from this box — retry with API key or isbnsearch.org/WorldCat.
- tntenders.arappor.org (throttled, honest UA): searches "arivulagam", "library books coimbatore", "நூலகம்" → **no book-supply tender on TN e-procurement** for this library. Only PWD Coimbatore fit-out works: audio-visual ₹19.9L, PA ₹39.95L, EPABX/LAN/CCTV ₹59.42L (ref 1/1 & 1/2/2026-27, CE Coimbatore). Book purchase must have run through departmental limited/manual route or rate contract — itself a procurement-governance finding.

## OSINT-first ladder (RTI last)

1. **Preserve before it disappears** — Wayback/archival of: Sindhai essay (done), _Sarram | தவெக X thread + GO photo, any Agalvilakku/Phoenix web pages, minister press notes, Tamil media coverage.
2. **Book forensics (no RTI needed)** — extract ISBNs from the X photos; check each against isbnsearch.org / WorldCat / Google Books (keyed) / NBT & Tamil Virtual Academy catalogs; Amazon/Flipkart retail search; absence = the fraud signal. Then buy ONE specimen from the public library building (public space; photograph title page, ISBN, MRSP).
3. **Publisher forensics** — MCA entity search "Agalvilakku"/"Phoenix"+Coimbatore; GSTIN lookup; domain WHOIS if a site appears; breach-corpus sweep for akalvilakkupathipagam@gmail.com; Twitter/Instagram/Facebook for the gmail handle; print-press directories (Coimbatore) for who printed 1,800 hardbacks.
4. **Money/procurement trail from published records** — TN budget (Demand for Grants, School Education / Art & Culture) for the ₹50 cr line; TN e-gazette GOs constituting the book selection committee; benchmark vs Anna Centenary Library / Kalaignar Centenary Library procurement methods; retender-chain + corrigendum velocity check on Arappor mirror for PWD fit-out tenders (split-estimate angle).
5. **Network** — publisher → directors/proprietor (public records only) → any political/official proximity;Perumal Murugan was ON the selection committee — his exit timeline matters; check his other public statements.
6. **Then, and only then, RTI** — targeted: (a) copy of purchase order + supplier invoices (GST numbers printed there), (b) book selection committee minutes + member list + GO, (c) technical/financial evaluation sheets, (d) delivery-receipt/stock register pages for the flagged titles, (e) details of any inquiry GO by Minister Rajamohan's dept.

## Claim discipline

- "Fake ISBN" = *essay claim* until our own ISBN check runs (step 2).
- "No e-procurement tender" = *our finding* from Arappor mirror (keyword-search caveat: Tamil titles/limited tenders may be absent; verify against dept rate contracts).
- Publish only after verification pass + right-of-reply drafted.
