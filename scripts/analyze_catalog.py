#!/usr/bin/env python3
"""ACL catalog triage: fake-book screen.

Reads harvest/records.jsonl (OAI marcxml flat records), builds DuckDB, runs heuristics:
  R1 ISBN check-digit failure
  R2 imprint place in fake-place set (USA/UK/London/Philippines/European Union)
  R3 publisher matches known fake imprints (Phoenix/Akal/Agal variants)
  R4 2023 imprint with Western-style author name
  R5 bulk-block stem histogram (>=5 ACL bibs sharing one registrant stem)
  R6 same title+author under 2+ distinct ISBNs
Outputs data/suspects.csv, data/stem-histogram.csv, data/summary.json
"""
import json, os, re, sys
import duckdb

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, ".."))
IN = os.path.join(ROOT, "harvest", "records.jsonl")
DB = os.path.join(ROOT, "data", "acl.duckdb")
FAKE_PLACES = ("usa", "u.s.a", "united states", "uk", "u.k", "united kingdom",
               "london", "philippines", "european union", "france", "germany")
FAKE_PUB = re.compile(r"phoenix|agal|akal\s*vilakku", re.I)
WESTERN_AUTHOR = re.compile(r"^[A-Z][a-zA-Z'\-]+,\s+[A-Z][a-zA-Z'\-\.]+")
ISBN_RE = re.compile(r"(97[89][\d\- ]{9,16}[\dxX])")

def clean_isbn(s):
    digits = re.sub(r"[^0-9Xx]", "", s)
    if len(digits) == 13 and digits.startswith("978"):
        return digits
    return None

def isbn13_ok(d):
    tot = sum((1 if i % 2 == 0 else 3) * int(c) for i, c in enumerate(d[:12]))
    return (10 - tot % 10) % 10 == int(d[12])

def records():
    with open(IN) as f:
        for line in f:
            try:
                r = json.loads(line)
            except json.JSONDecodeError:
                continue
            title = (r.get("245") or [""])[0]
            author = (r.get("100") or [""])[0]
            isbns = []
            for raw in r.get("020", []):
                for m in ISBN_RE.finditer(raw):
                    c = clean_isbn(m.group(1))
                    if c: isbns.append(c)
            imprint = ((r.get("260") or [""])[0] + " " + (r.get("264") or [""])[0]).strip()
            oai = r.get("oai_id", "")
            bib = oai.rsplit(":", 1)[-1] if ":" in oai else ""
            for tag in r.get("ctrl", []):
                if tag.startswith("999:"):
                    mm = re.search(r"(\d{4,8})", tag)
                    if mm: bib = mm.group(1)
            yield bib, title, author, isbns, imprint

def norm_title(t):
    return re.sub(r"[^a-z0-9]", "", t.lower())[:80]

def main():
    os.makedirs(os.path.join(ROOT, "data"), exist_ok=True)
    if not os.path.exists(IN):
        print("no records.jsonl yet"); sys.exit(1)
    rows = []
    for bib, title, author, isbns, imprint in records():
        rows.append((bib, title, author, (isbns or [None])[0], isbns, imprint))
    rows = [r for r in rows if r[0]]
    if not rows:
        print(json.dumps({"status": "no records yet"})); return
    con = duckdb.connect(DB)
    con.execute("DROP TABLE IF EXISTS books")
    con.execute("""CREATE TABLE books(bib VARCHAR, title VARCHAR, author VARCHAR,
        isbn VARCHAR, imprint VARCHAR)""")
    con.executemany("INSERT INTO books VALUES (?,?,?,?,?)",
                    [(b, t, a, (isbns or [None])[0], im) for b, t, a, i0, isbns, im in rows])
    tot_books = con.execute("SELECT count(DISTINCT bib) FROM books").fetchone()[0]

    # stem histogram
    stems = {}
    for b, t, a, i0, isbns, im in rows:
        for i in set(isbns or []):
            stems.setdefault(i[:10], set()).add(b)
    bulk_stems = sorted(((s, len(v)) for s, v in stems.items() if len(v) >= 5),
                        key=lambda x: -x[1])
    stemset = {s for s, _ in bulk_stems}

    # rules
    suspects = []  # bib, rule, isbn, title, author, imprint
    for b, t, a, i0, isbns, im in rows:
        im_l = im.lower()
        for i in set(isbns or []):
            if not isbn13_ok(i):
                suspects.append((b, "R1-checkdigit", i, t, a, im))
            if i[:10] in stemset:
                suspects.append((b, "R5-bulkstem", i, t, a, im))
        if FAKE_PUB.search(im):
            suspects.append((b, "R3-fakepub", i0, t, a, im))
        elif any(p in im_l for p in FAKE_PLACES):
            suspects.append((b, "R2-fakeplace", i0, t, a, im))
        if WESTERN_AUTHOR.match(a) and "2023" in im:
            suspects.append((b, "R4-western2023", i0, t, a, im))
    # R6 duplicates
    byta = {}
    for b, t, a, i0, isbns, im in rows:
        if t and a:
            byta.setdefault((norm_title(t), a), set()).update(isbns or [])
    dupkeys = {k for k, v in byta.items() if len(v) > 1}
    for b, t, a, i0, isbns, im in rows:
        if (norm_title(t), a) in dupkeys:
            suspects.append((b, "R6-dup", i0, t, a, im))

    with open(os.path.join(ROOT, "data", "suspects.csv"), "w", newline="") as f:
        f.write("bib,rule,isbn,title,author,imprint\n")
        for r in suspects:
            f.write(",".join('"' + str(x).replace('"', '""') + '"' for x in r) + "\n")
    with open(os.path.join(ROOT, "data", "stem-histogram.csv"), "w", newline="") as f:
        f.write("stem,bibs\n")
        for s, n in bulk_stems:
            f.write(f"{s},{n}\n")
    rulecounts = {}
    for r in suspects:
        rulecounts[r[1]] = rulecounts.get(r[1], 0) + 1
    summary = {"total_records": tot_books, "distinct_isbns": len(stems),
               "suspect_rows": len(suspects), "by_rule": rulecounts,
               "bulk_stems_ge5": len(bulk_stems)}
    json.dump(summary, open(os.path.join(ROOT, "data", "summary.json"), "w"), indent=1)
    print(json.dumps(summary, indent=1))

if __name__ == "__main__":
    main()
