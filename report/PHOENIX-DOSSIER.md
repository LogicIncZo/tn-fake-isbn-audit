# ISBN block hijack: 978-93-92360 (Phoenix / "Jean Dreze" books at Anna Centenary Library)

Date: 2026-11-07 · Tag: [DATA] · Status: OSINT round 2 (registry verification) · Case parent: `2026-11-06-periyar-arivulagam-book-scam/`
Trigger: X post [@ShalinSpeaks/status/2119059388648530161](https://x.com/ShalinSpeaks/status/2119059388648530161) + its English twin (…290648711219); drill-down question: **is the library Koha record for ISBN 978-93-92360-09-1 a different book than the official isbn.gov.in registry entry?**

## Answer: YES — and it is not one bad record, it is the whole block

**Claim R1 (confirmed, L4 — two independent registry API fetches agree).** isbn.gov.in (Raja Rammohun Roy National Agency for ISBN, the statutory national registry) allocates **978-93-92360-09-1** to:

| Field | Official registry (isbn.gov.in) | ACL Koha biblio 526291 (library record) |
|---|---|---|
| Title | Kaaryaalayee Hindee Aur Kampyootar (कार्यालयी हिन्दी और कंप्यूटर) | Democracy and Peoples Right in The Contemporary World |
| Author(s) | Dr. Neelam Tiwari, Dr. Anil Kumar Mishra & Dr. Sarita Singh | Dreze, Jean |
| Publisher registrant | Vivek Malviya | Phoenix |
| Language / place | Hindi | English / [USA] |
| Allocated | 15/02/2022 | Catalogued as 2023, "1st edition", 171p |

The library book's own catalog summary is **verbatim Chomsky-lectures blurb** ("Chomsky's early insights into the workings of power…") — a real book's jacket text reused to dress the fake record. *Our inference:* cataloguing data was lifted from legitimate records / generated to look legitimate.

## Method

1. ACL Koha OPAC (`118.185.210.241:8001`, page title "Anna Centenary Library catalog") — biblio 526291 fetched; ISBN prefix `9789392360` searched → 27 records; all 26 siblings fetched in one parallel wave.
2. isbn.gov.in `POST Home/FillSearchText` (unauthenticated AJAX, same endpoint the public search UI uses) via ocitwo Indian vantage — sandbox direct fetch returns 401 (geo-fence). Full block query: 37 allocated records. Publisher-name queries: "Phoenix", "Vivek Malviya".
3. Cross-match table: `data/crossmatch-acl-koha-vs-isbnregistry.csv` (sha256 in `data/hashes.txt`). Probes: `probes.jsonl` (throttled, single wave, ~31 requests total).

## Finding: 27/27 mismatch

All 27 ACL records carrying a 978-93-92360-x ISBN:

- **19** collide with ISBNs **already allocated to completely different books** — Hindi/English academic texts by UP publishers Prakashan Kendra and registrant "Vivek Malviya" (2021–2024). Examples: "Women in science" (ACL) vs *Matrices and Algebra* (registry); "Berlin - The Red Army" (ACL) vs *A Text Book of Operations Research* (registry); the Dreze book vs *Kaaryaalayee Hindee Aur Kampyootar*.
- **8** are valid-format but **never allocated** in the registry at all.
- **27/27 pass ISBN-13 check digit** — *our inference:* numbers were deliberately constructed or copied from the allocated list, not mistyped.
- **0/27** match their library catalogue record.

### Internal contradictions in the ACL records themselves (official claims, mutually inconsistent)

- Imprint flip-flops across 27 records all "published 2023": USA / UK / London / Philippines / European Union — one publisher, five places.
- Same author string "Kefeng, Wiley" carries two different titles/ISBNs (biblio 526287, 526288); "Ainsworth, Wittig" vs "Ainsworth, Tamin" — surname-pool recombination pattern, same generator signature as the Agalvilakku Tamil names (parent case round-1: பாலு ×3, சேதுராமன் ×3).
- Registry has **duplicate allocations**: 978-93-92360-20-6 and -21-3 both allocated to the same title *Banjar Ke Rookh* (registry hygiene note, separate issue).

## What the registry says about the names involved

- No "Phoenix" registrant matches this imprint. Registry "Phoenix" hits are unrelated registrants (Telugu "Phoenix Publications" 2026; Marathi exam-guide publisher on prefix 978-93-80016; "Phoenix International Publications"; "Phoenix Academic and Research"). The TN scam imprint — social sciences, 2023, USA/UK/London — has **no registry existence**.
- Prefix **978-93-92360** (37 allocations) is shared between **Prakashan Kendra** (established Lucknow academic publisher) and registrant **"Vivek Malviya"** — 31 titles total across two prefixes (978-93-92360 + 978-93-342-x, the latter still active 2025, e.g. *The Trading Empire: Master The Market Like a King*). *Our inference (open):* whether the registrant element was leased/abused, or Phoenix simply counterfeited numbers inside a Lucknow-area prefix, is not resolvable from the public registry — the **prefix registrant file is RTI-able** (action A2 below).

## Claim register

| # | Claim | Level | Source |
|---|---|---|---|
| R1 | 978-93-92360-09-1 = *Kaaryaalayee Hindee Aur Kampyootar*, Vivek Malviya reg., 15/02/2022 | confirmed (L4) | isbn.gov.in API, 2 fetches |
| R2 | ACL biblio 526291 = "Democracy and Peoples Right…/Jean Dreze", Phoenix 2023 [USA] | confirmed (L4) | Koha record HTML (hashed) |
| R3 | 27 ACL records on this prefix; 19 allocated-elsewhere, 8 unallocated, 27/27 valid check digit, 0/27 match | confirmed (L4) | crossmatch.csv + hashed HTML/JSON artifacts |
| R4 | No registry registrant matches the "Phoenix 2023" imprint | confirmed (L4, name-space only) | publisher query; entity resolution is registry-internal |
| R5 | Scrambled author names = pseudonymous generation | our inference | pattern match with parent-case name-pool analysis |
| R6 | Same imprint supplied Kalaignar Centenary Library, Madurai (Shalin's photo) | **claimed, unverified** | X posts; needs that library's catalogue/accession data |
| R7 | Physical books on ACL shelves carry the same printed ISBNs | not tested | field round: OPAC shows 2 copies of the Dreze title (barcodes 677168/677169, 3rd flr B wing) |

**This finding does NOT by itself prove** who paid, at what price, or who approved procurement — it proves the books cannot be legitimately registered publications and the catalogue metadata is fabricated. Money trail lives in procurement records (RTI).

## Holdings forensics — date of addition (2026-11-07 addendum)

Source: Koha MARC views (`opac-MARCdetail.pl`) per biblio; columns *Date acquired*, *Accession Number*.

- **Two acquisition batches**: **13.04.2024** (19 records / 40 copies) and **22.08.2024** (8 records / 15 copies — every title at 4th floor A wing).
- Accession numbers form one contiguous run **677064–677193**: 677064–677081 (13.04), 677144–677165 (13.04 + 22.08), 677168–677169 (13.04), 677180–677193 (13.04).
- Biblio numbers 526239–526303 = one cataloguing import batch.
- **Legacy-item anomaly**: biblio 526289 carries a third item (call no. 363.25 ALI, accession **526289**, acquired **04.02.2011**) — an 2011-era genuine item merged into a 2024 fake record during this import; evidence the batch edited pre-existing records, not only added new ones.
- Completeness: all 27 records under prefix 978-93-92360 in ACL = hijacked (27/27 mismatch, `data/acl-hijacked-full.csv`). Keyword sweep for "Phoenix" in the catalogue returned 638 hits including legitimate Phoenix-title books — outside-prefix Phoenix records need publisher-keyed export (staff side / RTI accession register) to bound fully.

## Full list — 27 hijacked titles in Anna Centenary Library

| # | Biblio | Accession(s) | Date acquired | Fake title (ACL Koha) | ISBN in record | Registry allocation of that ISBN |
|---|---|---|---|---|---|---|
| 1 | 526239 | 677064;677065 | 13.04.2024;13.04.2024 | Women in science | 9789392360022 | Matrices and Algebra — Vivek Malviya (English, 10/09/2021) |
| 2 | 526240 | 677066;677067 | 13.04.2024;13.04.2024 | A Spinster - Women in Political Economy | 9789392360039 | Complete Denture Esthetics : A Literature Review — Vivek Malviya (English, 14/09/2021) |
| 3 | 526241 | 677068;677069 | 13.04.2024;13.04.2024 | An Era of Divorce | 9789392360046 | Conceptual Framework of Education-1 — Vivek Malviya (Hindi, 23/09/2021) |
| 4 | 526242 | 677070;677071 | 13.04.2024;13.04.2024 | Tastes and cultures-ethnography of diversities | 9789392360114 | Bhaktikaaleen Hindee Kaavy Sangrah — Vivek Malviya (Hindi, 07/10/2021) |
| 5 | 526243 | 677072;677073 | 13.04.2024;13.04.2024 | Germanic race - an anthropology perspective | 9789392360190 | Aanand Kumaarasvaamee: Bhaarateey Kala-Sanskrti- Ek  — Vivek Malviya (Hindi, 22/10/2021) |
| 6 | 526244 | 677074;677075 | 22.08.2024;22.08.2024 | A Politics of The Public Domain | 9789392360268 | Psychology Practicals — Vivek Malviya (English, 12/01/2022) |
| 7 | 526245 | 677076;677077 | 22.08.2024;22.08.2024 | Berlin - The Red Army | 9789392360305 | A Text Book of Operations Research — Prakashan Kendra (English, 22/02/2024) |
| 8 | 526246 | 677078;677079 | 13.04.2024;13.04.2024 | Violence Against Women in Russia V. Lavrovskaia | 9789392360312 | no registry allocation |
| 9 | 526247 | 677080;677081 | 13.04.2024;13.04.2024 | German Nationalism - Idealism of Our Grandfathers | 9789392360367 | no registry allocation |
| 10 | 526279 | 677144;677145 | 22.08.2024;22.08.2024 | Culture At Courts | 9789392360008 | Aadhunik Kaavy — Prakashan Kendra (Hindi, 24/08/2022) |
| 11 | 526280 | 677146;677147 | 13.04.2024;13.04.2024 | Women - Choices and Compromises | 9789392360053 | Development and Challenges of Indian Education Syste — Vivek Malviya (Hindi, 23/09/2021) |
| 12 | 526281 | 677148;677149 | 13.04.2024;13.04.2024 | Why women revolt | 9789392360060 | Desh Ke Vibhaajan Ke Jakhm — Prakashan Kendra (Hindi, 21/11/2022) |
| 13 | 526282 | 677150;677151 | 13.04.2024;13.04.2024 | Ethnography and Conceptualisation of North Asian Borders | 9789392360121 | Madhyayugina kavyavithika — Vivek Malviya (Hindi, 09/10/2021) |
| 14 | 526283 | 677152;677153 | 22.08.2024;13.04.2024 | Media Literacy With intrasubjective Mediation | 9789392360183 | Aadhunik Hindee Kaavy-Sangrah — Vivek Malviya (Hindi, 13/10/2021) |
| 15 | 526284 | 677154;677155 | 13.04.2024;13.04.2024 | Parliamentary oversight of intelligence agencies | 9789392360237 | no registry allocation |
| 16 | 526285 | 677156;677157 | 13.04.2024;13.04.2024 | Theoretical and Conceptual Frameworks | 9789392360244 | no registry allocation |
| 17 | 526286 | 677158;677159 | 13.04.2024;13.04.2024 | Human presence in digital artefacts | 9789392360251 | Social Concepts — Vivek Malviya (English, 26/04/2022) |
| 18 | 526287 | 677160;677161 | 22.08.2024;22.08.2024 | Language Politics and Language Contact | 9789392360275 | A Text Book of Geometry — Vivek Malviya (English, 18/01/2022) |
| 19 | 526288 | 677162;677163 | 13.04.2024;13.04.2024 | Reality-Testing of Existence and Character | 9789392360282 | no registry allocation |
| 20 | 526289 | 677164;677165 (+legacy item acc#526289, 04.02.2011) | 22.08.2024;22.08.2024 | Border Fencing | 9789392360350 | no registry allocation |
| 21 | 526291 | 677168;677169 | 13.04.2024;13.04.2024 | Democracy and Peoples Right in The Contemporary World | 9789392360091 | Kaaryaalayee Hindee Aur Kampyootar — Vivek Malviya (Hindi, 15/02/2022) |
| 22 | 526297 | 677180;677181 | 13.04.2024;13.04.2024 | Ownership and restitution on cultural heritage | 9789392360084 | Micro Economics — Prakashan Kendra (Hindi, 19/12/2022) |
| 23 | 526298 | 677182;677183 | 13.04.2024;13.04.2024 | Ecological critique of natalism | 9789392360138 | MICROBIOLOGY AND PLANT PATHOLOGY (BOTANY) — Vivek Malviya (English, 13/10/2021) |
| 24 | 526299 | 677184;677185 | 13.04.2024;13.04.2024 | A Single Woman | 9789392360213 | Banjar Ke Rookh — Vivek Malviya (Hindi, 22/12/2021) |
| 25 | 526300 | 677186;677187 | 13.04.2024;13.04.2024 | Depiction and intention | 9789392360220 | no registry allocation |
| 26 | 526301 | 677188;677189 | 13.04.2024;13.04.2024 | Conflict and coherence in identity formation | 9789392360336 | no registry allocation |
| 27 | 526303 | 677192;677193 | 13.04.2024;13.04.2024 | Ethnographic Archive of Endangered Oral Traditions | 9789392360206 | Banjar Ke Rookh — Vivek Malviya (Hindi, 22/12/2021) |

## Context chain (parent case)

- 2026-11-05/06: Perumal Murugan, "Periyar Arivulagathil Periya Oozhal" (Sindhai) — ~1,800 Agalvilakku + ~2,000 Phoenix books at Coimbatore Periyar Arivulagam; fake ISBNs, AI content, ₹300 books at ₹1,400–1,500; School Edn Minister orders inquiry (NDTV/The Week/India Today/TheNewsMinute, 2026-11-06).
- 2026-11-07: Shalin Maria Lawrence posts the Kalaignar Centenary Library Madurai specimen — Phoenix book, valid-format ISBN, publisher address = Agal Vilakku address, author "Jean Dreze" who never wrote it (her claim, R6).
- Today: registry-verified that the specimen ISBN belongs to an unrelated Hindi book, and the abuse is block-wide inside TN's flagship state library catalogue.

## Actions a citizen / the desk can take

1. **RTI to Directorate of Public Libraries / ACL (PIO)**: accession register entries, purchase orders, invoices, supplier name+address, unit price, selection/recommendation note for biblio 526291 and the 27-record set; vendor "Phoenix" registration file (DPL Transparent Book Procurement portal registration + declarations).
2. **RTI to Raja Rammohun Roy National Agency for ISBN** (Ministry of Education): registrant file for prefix 978-93-92360 — who holds it, titles filed under Prakashan Kendra vs Vivek Malviya, whether registrant reported unauthorised use, complaints/action log for ISBN misuse.
3. **Demand the ministerial probe's scope in writing** — it must cover ACL Chennai and Kalaignar Madurai, not only Periyar Arivulagam Coimbatore; ask for its notification/order number.
4. **Field specimen (public spaces only)**: photograph title page + ISBN + price + printer's line of the Dreze book and 2–3 siblings on the open shelf; closes R7.
5. Forward the cross-match CSV to the inquiry + Perumal Murugan/Arappor (credit their data if used); DVAC complaint only after the specimen round.

## Reproduction

Any citizen can re-verify R1 in 2 minutes: isbn.gov.in → IsbnSearch → ISBN Number → 9789392360091 → registry shows the Hindi book; ACL OPAC biblio 526291 shows the Dreze record. Artifacts hashed in `data/hashes.txt`.

## Addendum B — DVAC complaint verification (07-Nov-2026, evening)

**[COMPLAINT]** Trigger: x.com/sailaks11/status/2119051044777038286 posts a 4-page DVAC complaint dated **07.11.2026** by **I. Paranthamen, B.A., B.L., Ex-MLA, Joint Secretary, DMK Legal Wing** (Anna Arivalayam letterhead) to the Director, DVAC (No. 293, M.K.N. Road, Alandur, Chennai-600 016): "Large-scale irregularities and misappropriation of public funds in the procurement of books for Periyar Arivulagam Library, Coimbatore — Request to register a case and investigate." Cites PC Act 13(1)(a) r/w 13(2) + BNS 316(5). Sections: (1) AI-generated books by Agal Vilakku + Phoenix; (2) bulk ISBN blocks (table, page 2); (3) implausible single-author output (Monica Ravi 162 books "within six months" per library visitors; Lakshmi Mohan 124; Thamarai Panneer 123; Thamarai Murali 115; Jothi Hariharan 114); (4) inflated prices by INDICA (Delhi-based publisher/distributor). Nine investigation questions incl. "Do writers named Trisha Vijay, Sangeetha Vijay, Thamarai Panneer, Thamarai Murali, Monica Ravi R. actually exist?"; also asks DVAC to probe whoever circulated purchase orders online ("primafacie appears to be false and fabricated"). Photos archived + hashed (data/dvac-complaint/). A complaint is a claim document — partisan source (ruling-party functionary); DVAC action unverified; no FIR confirmed.

**[VERIFIED L4]** Our independent registry pull reproduces the complaint's block table **exactly** (isbn.gov.in API, ocitwo IN vantage; two reproductions: 06-Nov corpus + 07-Nov live):

| Complaint block | Complaint count | Registry (07-Nov live) | Registrant | Languages |
|---|---|---|---|---|
| 978-93-7450 | 1,000 | 1,000 | Akal Vilakku Pathipagam | Tamil |
| 978-93-7700 | 743 | 743 | Akal Vilakku Pathipagam | English, Tamil |
| 978-93-89780 | 100 | 100 | Akal Vilakku Pathipagam | Tamil |
| 978-93-47000 | 100 | 100 | Akal Vilakku Pathipagam | Tamil |
| 978-81-983xxx "10 each" | several | 978-81-9839x/43x = 20 each, 47x = 10, 49x = 10 + adjacent 978-81-98x blocks | Akal Vilakku Pathipagam | Tamil |

Family controls: sibling stems 978-93-8979x/978-93-4701x are shared by legitimate registrants (Navneet, Chhaya, Prabhat, Indiannica, Rachna Sagar, university directorates) — Akal Vilakku holds exactly the sub-blocks claimed, nothing more.

**[VERIFIED L4]** Blocks the complaint does not list — **Phoenix Publications** registrant-of-record: 978-93-7583x = **999**; 978-93-7771x = **423**; six 100-blocks (978-93-8932x, 978-93-9033x, 978-93-4702x, 978-93-4749x, 978-93-4768x, 978-93-9493x); 978-93-4771x = 51; 978-93-4779x = 46; ~ninety 10-blocks under 978-81-98x. Phoenix total: **3,102 allocations**; Akal Vilakku total: **2,393**; combined footprint **5,495** ISBNs. All self-declared applicant_type=Publisher.

**[CORROBORATED L3/L4]** Author clusters, registry-attributed vs complaint (visitor-reported): Monica Ravi 136/162 (Phoenix also has "Monika R" 37 — complaint's "Monica Ravi R."); **Lakshmi Mohan 124/124 exact**; Thamarai Panneer 118/123 (28 Panneer + 90 Paneer spelling split); Thamarai Murali 113/115; Jothi Hariharan 71/114 (Δ43 unresolved). Registry adds three implausible names the complaint missed: Manisha Saravanan 107, Karthika Thangaraj 76, Mohana Balraj 71.

**[VERIFIED L4]** Declared publication-date curve (Akal Vilakku): Dec-2024 100 → May-2025 130 → **Sep-2025 1,157** → Feb-2026 **743** (the entire 978-93-7700 block in one month). Sep-2025–Feb-2026 window = 1,983 of 2,393 records (**83%**) — the complaint's "short span of six months" corroborates at registry scale.

**[NOT ESTABLISHED]** Whether the Coimbatore procurement payment/PO files match (RTI pending); INDICA price claims (no documents seen); DVAC docket status; the identity behind the registrant applications (registry shows imprint names only — applications under RTI).

Note on the 27 ACL books (this dossier's core): complaint page 3 states "Similar irregularities are found in the accession register for books supplied by Phoenix Publications" [COMPLAINT] — consistent with our registry cross-match of the 13.04.2024 ACL batch (27/27 fake metadata; 19 hijacked allocations, 8 never-allocated).

Page built: zo.space `/aram/fakeisbn` (public). Claims C48–C52 registered in 2026-11-06-periyar-arivulagam-book-scam/data/claims.csv.

### Addendum C — complete acquisition table (2026-11-07, evening pass)
- Full 27-row table with imprints, accession numbers, dates acquired, shelf marks and registry counter-allocations: `data/acl-hijacked-table.md` (+ machine CSV `data/acl-hijacked-full.csv`; sha256 in `data/hashes.txt`).
- Imprint as catalogued, all 27: "Phoenix 2023" variants; declared place: USA×13 (incl. "[USA]"), UK/United Kingdom×4, London×2, Philippines×1, European Union×1, no place×6. *Official claim (ACL Koha), mutually contradictory.*
- Acquisition: all 27 acquired/accessioned 13.04.2024 (2 later replacement copies: 22.08.2024 at 526283; 23.10.2025 at 526289), price ₹2,695–₹2,895, Reference collection, 3rd/4th floor, B wing. Accession run 677064–677193 is contiguous with non-hijacked neighbours — single batch, single vendor, single invoice likely.
- Claims registered in 2026-11-06-periyar-arivulagam-book-scam/data/claims.csv.

## Addendum C — Full digital audit of ACL + KCL catalogs (2026-11-08, confirmed)

Scale-up from the 27-record sample: every ISBN-bearing record in both government libraries' OPACs checked against live isbn.gov.in queries from ocitwo (Indian vantage), one API call per ISBN.

| Library | Records screened | Hijacked (allocated elsewhere) | NOT-IN-REGISTRY (counterfeit) | NO-ISBN in catalog |
| --- | --- | --- | --- | --- |
| Anna Centenary Library, Chennai | 188 | 145 | 43 | 0 |
| Kalaignar Centenary Library, Madurai | 354 | 218 | 27 | 109 |
| **Total** | **542** | **363** | **70** | **109** |

- Hijack registrants behind the 363: Thenmozhi B (226), Hay House India (83), Ashok Chopra (20), Vidya Publications (19), Mohan R (15), rest smaller.
- ACL's 43 NOT-IN-REGISTRY records all sit on stem **978-93-9235-9** — adjacent to Phoenix's 978-93-9236-0 block, entirely unallocated in the registry: pure counterfeit ISBNs, not hijacks.
- KCL's Thenmozhi-B block (978-93-9461-2) supplied 226 hijacked records — mathematics/science books carrying the real titles of a genuine Chennai mathematics publisher.
- Catalogs enumerated via OPAC search paging (ACL OAI endpoint disabled / returns 502; KCL blocked queries beyond 500 results). Every biblio record fetched individually and hashed; classification reproduced programmatically against `full-registry-lookup.jsonl` with 0 mismatches.
- Datasets: `Aram/investigations/2026-11-07-acl-full-catalog-audit/data/fakeisbn-verification.json` (542 rows) + CSV; live at https://cashlessconsumer.zo.space/aram/fakeisbn/ledger with per-row isbn.gov.in verification links.
- Caveat: ACL record count (188) is ISBN-bearing biblio records reachable via OPAC search; ACL OAI-PMH remains unavailable so a full-catalog cross-check via OAI is still pending if the endpoint returns.
