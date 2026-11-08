import json, urllib.request
isbns=["9789394612693","9789394612617","9789394612976","9789394612891","9789394613515","9789394612266","9789394612235","9789394612785","9789394612709","9789394612624","9789394612549"]
def search(t, sv, vr=11):
    body=json.dumps({"data":{"draw":1,"start":0,"length":100,"search":{"value":""}},
                     "_obj":{"Type":t,"SearchValue":sv,"ViewReport":vr}}).encode()
    req=urllib.request.Request("https://isbn.gov.in/Home/FillSearchText", data=body,
        headers={"Content-Type":"application/json; charset=utf-8","X-Requested-With":"XMLHttpRequest","User-Agent":"AramResearchDesk/1.0","Referer":"https://isbn.gov.in/Home/IsbnSearch"})
    return json.load(urllib.request.urlopen(req, timeout=60))
for i in isbns:
    try:
        d=search("isbn_number_Nodash", i)
        recs=json.loads(d["data"]) if d.get("recordsTotal") else []
        if recs:
            r=recs[0]
            print(i, "->", r.get("publisher"), "|", (r.get("title") or "")[:50], "|", r.get("language"), "|", r.get("publicationdate"))
        else:
            print(i, "-> NOT-IN-REGISTRY")
    except Exception as e:
        print(i, "ERR", e)
# stems
for st in ["9789394612","9789394613"]:
    d=search("isbn_number_Nodash", st, 1)
    recs=json.loads(d["data"]) if d.get("recordsTotal") else []
    pubs={}
    for r in recs: pubs[r.get("publisher") or "?"]=pubs.get(r.get("publisher") or "?",0)+1
    print("stem", st, "total", d.get("recordsTotal"), dict(sorted(pubs.items(), key=lambda x:-x[1])[:8]))
