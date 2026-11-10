# TNOPAC: the centralized DPL catalog is external-dead

**Date:** 2026-11-10 · **Claim:** C62 · **Rung:** A0/A1 (DNS + GET, logged in `data/probes-tnopac-sweep.jsonl`)

## Question

Does Connemara Public Library, Chennai — TN's deposit library under the
Delivery of Books Act — have a searchable catalog, and can it be audited for
fake-ISBN acquisitions the way ACL and KCL were?

## Findings

1. **No standalone Connemara OPAC.** `connemaralibrary.org` (no A record),
   `connemarapubliclibrarychennai.com` (parked, for sale), `pallikalvi.in`
   (dead) — all historical homes are gone. The current URL is
   `http://connemara.tnopac.gov.in/` per the JDVu digital-reference survey,
   which describes a centralized OPAC for Connemara + 32 district central
   libraries (~3M records), bilingual EN/TA, run by the Directorate of
   Public Libraries.

2. **The gateway is live; the application is not.** Every tnopac.gov.in
   subdomain returns a 200-OK stub that auto-submits a form to
   `http://172.17.17.1:8090/httpclient.html` — an RFC1918 address reachable
   only inside TNSWAN (the state wide-area network). From the public
   internet: `8090`, `8080`, `8093` all closed on `117.239.68.22` and
   `117.239.68.23`. No CRT-log subdomains beyond the ones we resolved.

3. **Scale of the wall:** 23 subdomains resolved and tested (connemara,
   chennai, madurai, salem, ariyalur, coimbatore, … virudhunagar). All
   identical stubs → same internal proxy. The catalog that would show what
   every district central library in TN actually bought cannot be searched
   by any member of the public, on any network, without TNSWAN access.

## What it means for the audit

ACL and KCL were auditable only because their Koha servers are directly
exposed on public IPs. The 22 district central libraries behind TNOPAC —
the libraries whose procurement most plausibly runs through the same
book-supply channel as the factory titles — are **structurally unauditable
by outsiders** until the DPL either exposes the OPAC or answers an RTI for
accession registers. C62 records the technical state; an RTI asking for the
DCP/acquisition lists of the 32 DCLs (2020–2026) is the next rung if the
OPAC stays dark.

## Reproduce

```bash
curl -s http://connemara.tnopac.gov.in/        # stub form → 172.17.17.1:8090
curl -s http://salem.tnopac.gov.in/            # identical stub
curl -m 10 -o /dev/null -w '%{http_code}\n' http://117.239.68.22:8090/httpclient.html  # 000
python3 - <<'EOF'                              # subdomain sweep
import socket
for d in ["connemara","chennai","madurai","salem","coimbatore","erode","trichy","tuticorin","thoothukudi","nagapattinam","vellore","cuddalore","tirunelveli","thanjavur","karur","perambalur","sivagangai","ramanathapuram","dharmapuri","krishnagiri","namakkal","nilgiris","kanniyakumari","tiruppur","dindigul","virudhunagar","ariyalur","tiruvarur","tirupathur","ranipet","chengalpattu","kallakurichi"]:
    try: print(d, socket.gethostbyname(d+".tnopac.gov.in"))
    except Exception: pass
EOF
```

Evidence: `docs/data/tnopac-gateways.json`, `data/probes-tnopac-sweep.jsonl`.
