import re, html, csv, glob, os
SRC='/home/.z/workspaces/con_3dutClK2LyElyV2D'
OUT='/home/workspace/Aram/investigations/2026-11-07-phoenix-isbn-block-hijack/data/acl-full-ledger.csv'
def clean(s): return re.sub(r'\s+',' ',html.unescape(re.sub(r'<[^>]+>',' ',s))).strip()

def biblio_meta(b):
    raw=open(f'{SRC}/k-{b}.html',encoding='utf-8',errors='replace').read()
    i=raw.find('Normal view'); t=clean(raw[i:i+2200])
    m=re.search(r'(.*?) /',t); title=m.group(1) if m else t[:60]
    m=re.search(r'By: (.{3,60}?)\s(?:Language|Publication)',t); author=m.group(1).strip() if m else ''
    m=re.search(r'(Phoenix[^0-9]{0,30}\d{4}(?:\s+(?:USA|UK|London|Philippines|European Union))?)',t)
    imprint=m.group(1) if m else ''
    m=re.search(r'ISBN: ([\dX]{10,17})',t); isbn=m.group(1) if m else ''
    return title,author,imprint,isbn

books={}
for f in sorted(glob.glob(f'{SRC}/m-*.html'))+sorted(glob.glob(f'{SRC}/marc-*.html')):
    b=re.search(r'(\d{6})\.html$',f).group(1)
    raw=open(f,encoding='utf-8',errors='replace').read()
    i=raw.find('Date acquired')
    if i<0: print(b,'no holdings'); continue
    tbl=raw.find('<table', max(0,raw.rfind('<table',0,i)), i)  # nearest table containing the header
    t0=raw.rfind('<table',0,i); t1=raw.find('</table>',i)
    rows=re.split(r'<tr[\s>]', raw[t0:t1])
    for tr in rows[1:]:
        h=clean(tr)
        acc=re.search(r'\b(\d{6})\b',h)
        if not acc: continue
        d1=re.search(r'(\d{2}\.\d{2}\.\d{4})',h); d2=re.findall(r'(\d{2}\.\d{2}\.\d{4})',h)
        cost=None
        if d1 and acc:
            seg=h[d1.end():acc.start()]
            for tok in seg.split():
                if re.fullmatch(r'\d{1,2},\d{3}\.\d{2}|\d{4}\.\d{2}', tok): cost=tok; break
        # shelf: between home/current library names
        mshelf=re.search(r'Anna Centenary Library Anna Centenary Library (.*?) '+ (d1.group(1) if d1 else 'ZZZ'), h)
        shelf=mshelf.group(1) if mshelf else ''
        date=min(d2) if d2 else ''
        B=books.setdefault(b,dict(copies=0,accessions=[],dates=set(),prices=[],shelf=set()))
        B['copies']+=1; B['accessions'].append(acc.group(1)); B['dates'].add(date); B['shelf'].add(shelf)
        if cost: B['prices'].append(float(cost.replace(',','')))
old={r['biblio']:r for r in csv.DictReader(open(OUT))} if os.path.exists(OUT) else {}
rowsout=[]
for b,B in sorted(books.items(), key=lambda kv:int(kv[0])):
    t,a,im,isbn=biblio_meta(b)
    B['dates']=sorted(B['dates'], key=lambda d: d.split('.')[2]+d.split('.')[1]+d.split('.')[0])
    shown=old.get(b,{}).get('price_shown','')
    if not B['prices'] and shown and shown not in ('',None):
        B['prices']=[float(shown)/max(1,len(B['accessions']))]*len(B['accessions'])
    cost=sum(B['prices'])
    rowsout.append(dict(biblio=b,title=t,author=a,imprint=im,isbn=isbn,copies=B['copies'],
        accessions=';'.join(B['accessions']),dates_acquired=';'.join(B['dates']),
        price_shown=round(cost,2) if cost else '',shelf=';'.join(sorted(B['shelf']))))
with open(OUT,'w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(rowsout[0].keys())); w.writeheader(); w.writerows(rowsout)
waves={}; tot=0.0; ncp=0; pc=set()
for r in rowsout:
    n=int(r['copies']); ncp+=n
    for d in r['dates_acquired'].split(';'):
        waves[d]=waves.get(d,0)+n//max(1,len(r['dates_acquired'].split(';')))
    if r['price_shown']: tot+=float(r['price_shown']); pc.add(round(float(r['price_shown'])/n,2))
print("records",len(rowsout),"copies",ncp,"total",round(tot),"waves",waves,"per-copy",sorted(pc))
