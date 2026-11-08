#!/usr/bin/env python3
"""KCL ledger: titles + costs + bills + dates from extracted records."""
import json, re, os, csv, statistics
from collections import Counter, defaultdict
ROOT='/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/kcl'
recs=[json.loads(l) for l in open(f'{ROOT}/data/kcl-books.jsonl')]
rows=[]; bills=Counter(); costs=[]; dates=Counter()
for r in recs:
    for h in r.get('holdings',[]):
        b=h.get('bill'); c=h.get('cost'); d=h.get('date')
        if b: bills[b]+=1
        if c:
            try: costs.append(float(c.replace(',','')))
            except: pass
        if d: dates[d]+=1
    rows.append({'biblio':r['biblio'],'title':r.get('title',''),'author':r.get('author',''),
                 'isbn':(r.get('isbns') or [None])[0],'copies':len(r.get('holdings',[])),
                 'costs':';'.join(h['cost'] for h in r.get('holdings',[]) if h.get('cost')),
                 'bills':';'.join(h['bill'] for h in r.get('holdings',[]) if h.get('bill')),
                 'dates':';'.join(h['date'] for h in r.get('holdings',[]) if h.get('date'))})
os.makedirs(f'{ROOT}/data',exist_ok=True)
with open(f'{ROOT}/data/kcl-ledger.csv','w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(rows[0].keys())); w.writeheader(); w.writerows(rows)
tot=sum(costs)
summary={'records':len(rows),'copies':sum(r['copies'] for r in rows),
 'bills':dict(bills),'distinct_bills':len(bills),
 'total_cost':round(tot,2),'priced_copies':len(costs),
 'cost_min':min(costs) if costs else None,'cost_max':max(costs) if costs else None,
 'cost_median':round(statistics.median(costs),2) if costs else None,
 'acq_dates':dict(dates)}
json.dump(summary,open(f'{ROOT}/data/kcl-summary.json','w'),indent=1,ensure_ascii=False)
print(json.dumps(summary,indent=1,ensure_ascii=False))
