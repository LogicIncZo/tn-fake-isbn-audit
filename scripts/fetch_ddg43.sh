#!/usr/bin/env bash
# Fetch the Demand No.43 (School Education) detailed demand for grants, one file
# per budget year, 2018-19 .. 2026-27. financedept.tn.gov.in 403s the sandbox on
# the root and the publications index, so run this through an Indian address:
#   bash scripts/fetch_ddg43.sh          # from ocitwo via Skills/ocitwo-access
set -euo pipefail
BASE="https://financedept.tn.gov.in/en/my-documents/2020/07"
DEST="$(cd "$(dirname "$0")/.." && pwd)/data/budget/ddg43-sources.csv"
LIST=$(cut -d, -f1 "$DEST" | tail -n +2)
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/131.0"
mkdir -p "$(dirname "$DEST")"
for f in $LIST; do
  code=$(curl -sk -o "/tmp/$f" -w '%{http_code}' -m 90 -A "$UA" "$BASE/$f" || true)
  printf '%s %s\n' "$f" "$code"
  [ "$code" = "200" ] || continue
done
CAG="cag-report-3-2023-tn-ifhrms-performance-audit.pdf"
if [ ! -s "/tmp/$CAG" ]; then
  curl -sL -o "/tmp/$CAG" -m 120 -A "$UA" \
    "https://cag.gov.in/uploads/download_audit_report/2022/Report-No.-3,-2023,-Tamil-Nadu-068b16560041f41.94078888.pdf"
fi
echo "PDFs left in /tmp — copy back with ocitwo.sh get, then verify against data/budget/SHA256SUMS"
