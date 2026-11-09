import re, time, json, sys, urllib.request
BASE='http://122.184.84.190:1011/cgi-bin/koha/opac-search.pl'
UA={'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) research/1.0'}
out=open('/tmp/kcl-all-publishers.jsonl','a',encoding='utf-8')
seen=set()
letters=list('abcdefghijklmnopqrstuvwxyz')+['3','7']
def get(u, tries=3):
    for i in range(tries):
        try: return urllib.request.urlopen(urllib.request.Request(u, headers=UA), timeout=40).read().decode('utf-8','replace')
        except Exception as e:
            time.sleep(3*(i+1))
    return ''
n_items=0
for c in letters:
    first=get(f'{BASE}?q=ccl=pb%3A{c}&count=50&format=rss')
    m=re.search(r'totalResults>(\d+)', first)
    total=int(m.group(1)) if m else 0
    if total==0: continue
    print(f'{c}: {total}', flush=True)
    for off in range(0, min(total, 3000), 50):
        x = first if off==0 else get(f'{BASE}?q=ccl=pb%3A{c}&count=50&offset={off}&format=rss')
        if not x: print(f'{c} off{off}: FETCH FAIL', flush=True); continue
        for it in re.findall(r'<item>(.*?)</item>', x, re.S):
            g=lambda p,sep='': (re.search(p, it) or [None,sep])[1].strip() if isinstance((re.search(p, it) or [None,sep]), list) else ''
            isbn_m=re.search(r'ISBN[:\s]*([0-9Xx\-]{9,17})', it)
            bib_m=re.search(r'biblionumber=(\d+)', it)
            if not bib_m: continue
            bib=bib_m.group(1)
            if bib in seen: continue
            seen.add(bib)
            ttl=re.search(r'<title>\s*(?:<!\[CDATA\[)?(.*?)(?:\]\]>)?\s*</title>', it, re.S)
            desc=re.search(r'<description>\s*<!\[CDATA\[(.*?)\]\]>', it, re.S)
            d=desc.group(1) if desc else ''
            imp=None; auth=None
            if d:
                brs=[re.sub(r'<[^>]+>','',b).strip() for b in d.split('<br />')]
                for b in brs:
                    if b.startswith('By '): auth=b[3:].strip().rstrip('.')
                    elif re.search(r'\d{4}|:\s', b) and 'pages' not in b and not b.startswith('By'): imp=b
            out.write(json.dumps({'bib':bib,'isbn':(isbn_m.group(1).replace('-','') if isbn_m else ''),'title':(ttl.group(1).strip() if ttl else ''),'author':auth or '','imprint':imp or '','letter':c}, ensure_ascii=False)+'\n')
            n_items+=1
        out.flush(); time.sleep(1.05)
    print(f'  items so far: {n_items}, unique bibs: {len(seen)}', flush=True)
out.close()
print(f'DONE items={n_items} unique={len(seen)}', flush=True)
