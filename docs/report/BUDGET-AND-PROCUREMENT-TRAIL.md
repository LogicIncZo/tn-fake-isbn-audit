# The money side: what Tamil Nadu budgets for library books, and who bills against it

**Status:** `confirmed` for every figure below that comes from a Tamil Nadu Detailed Demand for Grants (DDG). Each figure is a printed line in a PDF that is hashed in `data/budget/SHA256SUMS` and downloadable at the URL recorded in `data/budget/ddg43-sources.csv`.

**Date:** 2026-11-10. **Data:** `data/budget/library-book-spend.csv` (42 rows, one per institution-year-stage; the cycle runs 2018-19 to 2026-27). **Claims C64–C69** in `data/claims-register.csv`.

---

## 1. Why this document matters

The hijacked-ISBN books in this audit do not arrive through a tender for "books". They arrive through a single budget line: **object head 33402, "Purchase of Books & Periodicals to Libraries etc., Purchase"**, under detailed demand **043 05 — Directorate of Public Libraries**, inside **Demand No. 43, School Education Department**.

Every rupee the Director of Public Libraries can spend on a printed book passes that line. It is the only line of its kind in the demand. That makes the DDG series the denominator for the whole scam — and it is published, per year, as a PDF.

## 2. The series

Rupees, crore. Source column naming is in the CSV; `...` means the document printed nothing, `1` means a ₹1,000 token allocation.

| Institution | 2021-22 RE | 2022-23 act. | 2023-24 act. | 2023-24 RE | 2024-25 act. | 2025-26 BE | 2025-26 RE | 2026-27 BE |
|---|---|---|---|---|---|---|---|---|
| Directorate of Public Libraries (state consolidated, group AA) | ... | ... | ... | ... | 64.00 | 64.00 | 64.00 | 64.00 |
| Charges under TN Public Libraries Act 1948 (branch/district libraries, AF) | ... | ... | ... | 0.001 | 1.00 | 4.00 | 2.00 | 2.00 |
| Muthamizh Arignar Kalaignar Memorial Library, Madurai (BA) | 0.001 | 10.00 | 40.00 | 40.00 | — | 0.001 | ... | ... |
| Grand Library and Science Centre, Coimbatore (BD) | — | — | — | 0.001 | — | 50.00 | 20.00 | 20.00 |
| Grand Library and Intellectual Centre, Tiruchirappalli (BE) | — | — | — | 0.001 | — | 50.00 | 20.00 | 20.00 |
| Bharathidasan Arivulagam Library, Salem (BF) | — | — | — | — | — | 0.001 | 10.00 | 10.00 |
| Anjalaiammal Arivulagam Library, Cuddalore (BG) | — | — | — | — | — | 0.001 | 10.00 | 10.00 |
| Quaid-e-Millat Arivulagam Library, Tirunelveli (BH) | — | — | — | — | — | 0.001 | 10.00 | 10.00 |
| Children and Adolescents Libraries & Digital Infrastructure Scheme (JQ) | — | — | 8.21 | ... | 8.21 | ... | ... | ... |
| **Total** | **0.001** | **10.00** | **48.21** | **40.00** | **73.21** | **168.00** | **136.00** | **136.00** |

Actuals 2020-21 and 2021-22 are zero because no 33402 line exists in the 2022-23, 2023-24 or 2024-25 DDG for either year. Book purchase sat inside a lump `334 Other Charges` (object head 33400) until the 33402 sub-item appears with the Madurai library in 2022-23. Confirmed by extracting the 2018-19 through 2022-23 demands and finding zero 33402 occurrences (`data/budget/ddg43-sources.csv`, column `object_head_33402_lines`).

## 3. What the documents themselves show

**The line is re-based, not spent.** Madurai (BA) is budgeted ₹10.00 crore in 2022-23 BE and RE, spent in 2022-23, then carried at a ₹1,000 token for two years (2023-24 BE, 2024-25 BE) before an actual of ₹40.00 crore lands in the 2023-24 books. The 2024-25 DDG prints that ₹40.00 crore in the actuals column and ₹1,000 as both the 2024-25 BE and RE. A ₹40 crore book purchase is followed by a thousand-rupee vote.

**New libraries are floated at tokens and filled at revision.** All five Arivulagam/grand-library groups (BD, BE, BF, BG, BH) carry ₹1,000 in their first budget-year and their first revised estimate, then land at ₹10 crore or ₹20 crore. Coimbatore and Tiruchirappalli: ₹1,000 → ₹20 crore. Salem, Cuddalore, Tirunelveli: ₹1,000 → ₹10 crore each.

**The state vote moves up, not down.** Consolidated AA holds ₹64.00 crore flat across four successive documents and is the only stable figure in the series. Branch and district libraries (AF) peak at ₹4.00 crore BE and are revised down to ₹2.00 crore.

**The state cut its own books vote mid-year.** 2025-26 BE ₹168.00 crore → 2025-26 RE ₹136.00 crore, a ₹32.00 crore reduction, of which ₹30.00 crore falls on Coimbatore and Tiruchirappalli. 2026-27 BE restores nothing.

Taken together, between ₹136 crore and ₹168 crore a year is voted for printed books, and roughly 47 per cent of it (₹64 crore, AA) is a single un-itemised consolidated head.

## 4. Short answer

**No open path to bill-level spend.** IFHRMS carries the invoice, but it is a treasury application. Its public face is a Public Challan page, circulars and a wiki FAQ; budget-entry, ASL, DDO allocation and bill screens all sit behind DDO, BCO and HoD login. Nothing lets a member of the public ask what the Anna Centenary Library spent on books, from which publishers, against which bills.

What is openly queryable is the vote itself, and that is what we took: eleven DDG 43 documents — 2018-19 through the 2026-27 revised demand — parsed into a per-institution, per-year series in §2. The ladder stops at the estimate. Only a bill moves it to payment.

### 4a. The system is IFHRMS, and it runs on karuvoolam

**IFHRMS runs on `karuvoolam.tn.gov.in`** (Tamil Nadu Treasuries and Accounts), not on `ifhrms.tn.gov.in`, which does not resolve from either the sandbox or an Indian address.

### 4b. Why the treasury's own data still needs care

Even from inside, the head an amount books to is not reliable evidence. CAG's performance audit of IFHRMS found the Budget module permissive by design:

> "the system lacked validations to prevent wrong booking of expenditure" — and separately the module "allows transfer of funds between HoDs without any validation to restrict transfer of funds only between the HoDs of respective grants", contrary to clause 143(i) of the Budget Manual.

The audit also records expenditure booked against a Major Head (8005) removed from the books, against unrelated HoD codes, and Charged expenditure booked under heads meant for Voted. Government's reply that the design prevented cross-grant transfer was rejected by CAG.

Consequence here: a figure under object head 33402 is evidence of **intent to buy books**, and of the size of the pool. It is not proof that a given title was paid for out of it. Only the bill does that, and the bill is behind the login.

## 5. What our identified purchases are worth, against that denominator

Across the 69 ledger records that print a price:

- Total printed price: **₹1,83,823.22**
- Of which on records with a **hijacked** ISBN (the registry number belongs to another book): **₹1,09,650.00 — 59.7 per cent**
- Of which on an ISBN that was **never allocated at all**: **₹65,488.22 — 35.6 per cent**
- Combined: **₹1,75,138.22 — 95.3 per cent of the printed value sits on a number that does not describe the book in hand.**

Grossed up from priced copies to all copies at each library's median printed price. KCL's base is thin, 10 priced records carrying 15 copies, so treat that row as an order of magnitude, not a figure:

| Library | Priced copies | Median price | All copies | Grossed estimate | Against 2025-26 books BE |
|---|---|---|---|---|---|
| Anna Centenary Library, Chennai | 118 | ₹2,695 | 419 | ≈ ₹11.29 lakh | 0.007 % |
| Kalaignar Centenary Library, Madurai | 15 | ₹1,524 | 453 | ≈ ₹6.90 lakh | 0.004 % |

Both are small against ₹168 crore. That is the honest scale: at two libraries, this is not yet a budget-scale fraud, it is a per-invoice pattern. Two checks move it up the order of magnitude — a MARC/price export for every publisher (running, C63), and the bills themselves by RTI, which is the only route to what was actually paid rather than what was printed on the OPAC.

## 6. Reproduce

Data, hashed (`data/budget/SHA256SUMS`):

- `data/budget/library-book-spend.csv` — every object-head 33402 line, with the source PDF, line number, printed column and the fiscal year each column maps to
- `data/budget/ddg43-sources.csv` — all eleven source URLs with sha256
- `scripts/build_library_spend.py` — regenerates the series from the PDFs (extraction and mapping in one pass)
- `scripts/fetch_ddg43.sh` — pulls the PDFs from `financedept.tn.gov.in` through ocitwo; needs an Indian IP, the host 403s the sandbox
- `data/budget/cag-report-3-2023-tn-ifhrms-performance-audit.pdf` — the IFHRMS caveats in §4a


```
bash scripts/fetch_ddg43.sh      # download the 11 DDG PDFs + the CAG report from an Indian vantage, then hash them
python3 scripts/build_library_spend.py  # pdftotext -layout each PDF, take every line ending in object head 33402 with all four numeric columns, write the CSV
```

Column map for any DDG: (3) actuals Y-2, (4) BE Y-1, (5) RE Y-1, (6) BE Y, where Y is the document's own budget year. Units as printed: rupees in thousands. A `1` is ₹1,000; `...` is nil.

## 7. What an RTI should ask

1. Bill-wise list of 33402 expenditure in 043 05 for 2023-24 and 2024-25: bill number, date, DDO, supplier, invoice number, copies, unit price.
2. Sanction orders under which the Madurai ₹40.00 crore and the Coimbatore/Trichirappalli ₹20.00 crore revised provisions were incurred.
3. The list of empanelled suppliers and the rate contract or discount basis for library book purchase, with the tender reference.
4. For each bill, whether the ISBN on the invoice line was verified against the ISBN portal before payment, and by whom.

## 8. Limits

The series is estimates. Actuals appear only where a later year prints them, and where a department under-spent the printed actual is not proof of the invoice value. No DDG shows per-book prices. Everything in §5 comes from the OPAC's printed price and is an estimate, not an invoice. `...` in the CSV is nil, not missing — but a nil in a revised-estimate column is a reduction, not an absence of activity.
