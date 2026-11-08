import re, html, csv, json, glob, os
D="/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit"
R="/home/workspace/Projects/tn-fake-isbn-audit"
clean=lambda s: re.sub(r'\s+',' ',html.unescape(re.sub(r'<[^>]+>',' ',s))).strip()
meta={}
for f in glob.glob(f"{D}/full-sweep/acl/marc/k-*.html"):
    raw=open(f,encoding='utf-8',errors='replace').read()
    b=os.path.basename(f)[2:-5]
    t=re.search(r'name">(.*?)</span>',raw,re.S)
    a=re.search(r'byAuthor.*?</ul>',raw,re.S)
    i=re.search(r'isbn">(\d{9,13}[Xx]?)',raw)
    title=clean(t.group(1))[:120] if t else ""
    # title sometimes embeds author after ' / '
    if " / " in title: title, author2 = title.split(" / ",1); author2=author2.strip()
    else: author2=""
    auth=clean(a.group(0)).replace("By:","").strip()[:80] if a else author2
    meta[b]={"title":title,"author":auth,"isbn":i.group(1) if i else ""}
print(len(meta),"extracted; with titles:",sum(1 for m in meta.values() if m["title"]))
# patch final-classification
p=f"{R}/docs/data/final-classification.csv"
rows=list(csv.DictReader(open(p)))
fixed=0
for r in rows:
    if r["library"]=="ACL Chennai" and r["biblio"] in meta:
        m=meta[r["biblio"]]
        if "Log in" in r["title"] or not r["title"]:
            r["title"]=m["title"]; r["author"]=m["author"]; fixed+=1
        if not r["isbn"] and m["isbn"]: r["isbn"]=m["isbn"]
with open(p,"w",newline="") as f:
    w=csv.DictWriter(f,fieldnames=rows[0].keys()); w.writeheader(); w.writerows(rows)
print("classification fixed:",fixed)
# patch verification json+csv
j=json.load(open(f"{R}/docs/data/fakeisbn-verification.json"))
fixed=0
for r in j:
    if r["library"]=="ACL Chennai" and r["biblio"] in meta:
        m=meta[r["biblio"]]
        if "Log in" in (r.get("fake_title") or ""): r["fake_title"]=m["title"]; r["fake_author"]=m["author"]; fixed+=1
        r["fake_imprint"]=""
        if not r.get("isbn") and m["isbn"]: r["isbn"]=m["isbn"]
json.dump(j,open(f"{R}/docs/data/fakeisbn-verification.json","w"),ensure_ascii=False,indent=1)
print("verification json fixed:",fixed)
import csv as c2
with open(f"{R}/docs/data/fakeisbn-verification.csv","w",newline="") as f:
    w=c2.DictWriter(f,fieldnames=j[0].keys()); w.writeheader(); w.writerows(j)
