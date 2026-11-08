#!/bin/bash
# Probe ACL OPAC every 5 min; on first HTTP 200, trigger harvest and exit.
D=/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit
for i in $(seq 1 60); do
  code=$(curl -s -o /dev/null -m 40 -w "%{http_code}" -A "AramResearchDesk/1.0" \
    "http://118.185.210.241:8001/cgi-bin/koha/opac-detail.pl?biblionumber=526291")
  echo "$(date -u +%FT%TZ) probe $i -> $code" >> $D/harvest/probe.log
  if [ "$code" = "200" ]; then
    echo "$(date -u +%FT%TZ) SERVER BACK — starting harvest" >> $D/harvest/probe.log
    python3 $D/scripts/harvest_acl.py --mode A >> $D/harvest/harvest-auto.log 2>&1
    exit 0
  fi
  sleep 300
done
echo "$(date -u +%FT%TZ) gave up after 60 probes" >> $D/harvest/probe.log
