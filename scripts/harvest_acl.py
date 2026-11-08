#!/usr/bin/env python3
"""ACL Koha catalog harvester.

Mode A (preferred): OAI-PMH ListRecords, metadataPrefix=marcxml, resumption-driven.
Mode B (fallback if OAI disabled): targeted OPAC search sweep for suspect imprints,
  then per-biblio detail fetch (throttled 1.5s).

Writes one JSON line per record to harvest/records.jsonl (resumable via offset file).
Courtesy: single-threaded, honest UA, small sleep, max runtime guard.
"""
import json, os, re, subprocess, sys, time
import xml.etree.ElementTree as ET

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, ".."))
OUT = os.path.join(ROOT, "harvest", "records.jsonl")
STATE = os.path.join(ROOT, "harvest", "state.json")
BASE = "http://118.185.210.241:8001/cgi-bin/koha"
UA = "AramResearchDesk/1.0 (academic audit; contact via zocomputer)"
SLEEP = 2.0          # between HTTP calls
MAX_RUN_H = 8.0      # wall-clock guard
NS = {"oai": "http://www.openarchives.org/OAI/2.0/",
      "m": "http://www.loc.gov/MARC21/slim"}

def http(url, timeout=90):
    r = subprocess.run(["curl", "-s", "-m", str(timeout), "-A", UA, url],
                       capture_output=True, text=True)
    return r.stdout

def log(msg):
    print(f"{time.strftime('%FT%TZ', time.gmtime())} {msg}", flush=True)

def load_state():
    if os.path.exists(STATE):
        return json.load(open(STATE))
    return {}

def save_state(st):
    json.dump(st, open(STATE, "w"))

def parse_marcxml(rec_el):
    rec = {"ctrl": []}
    for cf in rec_el.findall(".//m:controlfield", NS):
        if cf.get("tag") in ("001", "003", "008"):
            rec["ctrl"].append(f"{cf.get('tag')}:{(cf.text or '')[:60]}")
    for df in rec_el.findall(".//m:datafield", NS):
        tag, sub = df.get("tag"), df.findall("m:subfield", NS)
        joined = " ".join((s.text or "") for s in sub).strip()
        if tag == "245":
            rec.setdefault("245", []).append(joined[:400])
        elif tag == "100":
            rec.setdefault("100", []).append(joined[:200])
        elif tag == "020":
            rec.setdefault("020", []).append(joined[:60])
        elif tag in ("260", "264"):
            rec.setdefault(tag, []).append(joined[:300])
        elif tag == "999":
            rec["ctrl"].append("999:" + joined[:60])
    oai = rec_el.find(".//oai:header/oai:identifier", NS)
    rec["oai_id"] = oai.text if oai is not None else ""
    return rec

def mode_a():
    url = f"{BASE}/oai.pl?verb=ListRecords&metadataPrefix=marcxml"
    st = load_state()
    tok = st.get("oai_token")
    if tok: url = f"{BASE}/oai.pl?verb=ListRecords&resumptionToken={tok}"
    written = st.get("written", 0)
    t0 = time.time()
    while True:
        if (time.time() - t0) > MAX_RUN_H * 3600:
            log("max runtime reached; stopping"); break
        xml_text = http(url)
        if not xml_text.strip() or "<error" in xml_text[:2000]:
            root = ET.fromstring(xml_text) if xml_text.strip().startswith("<") else None
            if root is not None:
                err = root.find(".//oai:error", NS)
                log(f"OAI error: {err.text if err is not None else 'empty/bad response'}")
            return "oai_error"
        try:
            root = ET.fromstring(xml_text)
        except ET.ParseError as e:
            log(f"XML parse error at offset {written}: {e}; will retry once")
            time.sleep(5); continue
        recs = root.findall(".//oai:record", NS)
        with open(OUT, "a") as f:
            for r in recs:
                rec = parse_marcxml(r)
                f.write(json.dumps(rec, ensure_ascii=False) + "\n")
                written += 1
        tok_el = root.find(".//oai:resumptionToken", NS)
        if written % 1000 < len(recs):
            log(f"progress: {written} records")
        if tok_el is None or not (tok_el.text or "").strip():
            log(f"OAI harvest complete: {written} records")
            save_state({"done": True, "written": written, "mode": "A"})
            return "A_done"
        tok = tok_el.text
        save_state({"oai_token": tok, "written": written, "mode": "A"})
        url = f"{BASE}/oai.pl?verb=ListRecords&resumptionToken={tok}"
        time.sleep(SLEEP)
    return "A_partial"

def main():
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    # health gate
    probe = http(f"{BASE}/opac-detail.pl?biblionumber=526291", timeout=45)
    if not probe.strip():
        log("server still down at harvest start; exiting"); sys.exit(2)
    # OAI availability gate
    ident = http(f"{BASE}/oai.pl?verb=Identify", timeout=60)
    if "<OAI-PMH" in ident:
        log("OAI-PMH available — mode A")
        mode_a()
    else:
        log("OAI not available — mode B targeted sweep required (manual)")

if __name__ == "__main__":
    main()
