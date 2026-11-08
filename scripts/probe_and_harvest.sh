#!/bin/bash
D=/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit
HARVESTER="$D/scripts/harvest_acl.py"
LOG="$D/harvest/probe.log"
n=0
while [ $n -lt 720 ]; do
  code=$(curl -s -o /dev/null -m 30 -w '%{http_code}' -A "AramResearchDesk/1.0" "http://118.185.210.241:8001/cgi-bin/koha/opac-detail.pl?biblionumber=526291")
  echo "$(date -u +%FT%TZ) probe $n -> $code" >> "$LOG"
  if [ "$code" = "200" ]; then
    echo "$(date -u +%FT%TZ) SERVER RECOVERED — firing harvester" >> "$LOG"
    python3 "$HARVESTER" >> "$LOG" 2>&1
    echo "$(date -u +%FT%TZ) harvester exited" >> "$LOG"
    exit 0
  fi
  n=$((n+1))
  sleep 300
done
