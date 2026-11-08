import json, urllib.request
def search(sv, vr=1):
    body=json.dumps({"data":{"draw":1,"start":0,"length":200,"search":{"value":""}},
                     "_obj":{"Type":"isbn_number_Nodash","SearchValue":sv,"ViewReport":vr}}).encode()
    req=urllib.request.Request("https://isbn.gov.in/Home/FillSearchText", data=body,
        headers={"Content-Type":"application/json; charset=utf-8","X-Requested-With":"XMLHttpRequest","User-Agent":"Mozilla/5.0","Referer":"https://isbn.gov.in/Home/IsbnSearch"})
    d=json.load(urllib.request.urlopen(req, timeout=60))
    return d
d=search("9789394612")
print("stem 978-93-94612 total:", d["recordsTotal"])
recs=json.loads(d["data"])
pubs={}
for r in recs:
    p=r.get("publisher") or "?"
    pubs[p]=pubs.get(p,0)+1
print("publishers:", pubs)
print("languages:", sorted(set(r.get("language") for r in recs)))
for r in recs[:15]:
    print(r["isbn_number"],"|",(r["title"] or "")[:40],"|",r["publisher"],"|",(r["Author"] or "")[:30],"|",r["publicationdate"])
