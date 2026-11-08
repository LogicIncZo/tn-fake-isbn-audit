import re, subprocess, time, json
BASE="http://122.184.84.190:1011/cgi-bin/koha/opac-search.pl"
UA="AramResearchDesk/1.0 (academic audit)"
OUT="/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/kcl/data/phoenix-biblio-list.json"
LOG="/home/workspace/Aram/investigations/2026-11-07-acl-full-catalog-audit/kcl/sweep.log"
def log(m):
    with open(LOG,"a") as f: f.write(time.strftime("%FT%TZ ")+m+"\n")
def sweep(qenc, maxpages=25):
    ids=set(); empties=0
    for off in range(0,maxpages*20,20):
        url=f"{BASE}?q={qenc}&offset={off}"
        r=subprocess.run(["curl","-s","-m","60","-A",UA,url],capture_output=True,text=True)
        new=set(int(x) for x in re.findall(r'biblionumber=(\d+)',r.stdout))
        if not new:
            empties+=1
            log(f"{qenc} off={off}: EMPTY {empties}")
        else:
            log(f"{qenc} off={off}: +{len(new)}")
        ids|=new
        if empties>=2: break
        time.sleep(1.5)
    return ids
a=sweep("pb%3Aphoenix")
b=sweep("pn%3APhoenix")
ids=sorted(a|b)
json.dump(ids, open(OUT,"w"))
log(f"DONE pb={len(a)} pn={len(b)} union={len(ids)} range={min(ids)}-{max(ids)}")
print("DONE", len(a), len(b), len(ids))
