import json, urllib.request
def search(t, sv, vr=11):
    body=json.dumps({"data":{"draw":1,"start":0,"length":100,"search":{"value":""}},
                     "_obj":{"Type":t,"SearchValue":sv,"ViewReport":vr}}).encode()
    req=urllib.request.Request("https://isbn.gov.in/Home/FillSearchText", data=body,
        headers={"Content-Type":"application/json; charset=utf-8","X-Requested-With":"XMLHttpRequest",
                 "User-Agent":"Mozilla/5.0","Referer":"https://isbn.gov.in/Home/IsbnSearch"})
    return json.load(urllib.request.urlopen(req, timeout=60))
d=search("isbn_number_Nodash","9789394612693")
recs=json.loads(d['data'])
print("total 9789394612693 (exact) in registry:", d['recordsTotal'])
pub={}
langs={}
for r in recs:
    pub[r['publisher']]=pub.get(r['publisher'],0)+1
    langs[r['language']]=langs.get(r['language'],0)+1
print("publishers:",pub)
print("languages:",langs)
pass
