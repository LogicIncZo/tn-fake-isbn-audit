#!/usr/bin/env python3
"""Rebuild data/budget/library-book-spend.csv from the local DDG No.43 PDFs.

Pull the object-head-33402 (Purchase of Books & Periodicals to Libraries) lines
out of each demand document, attribute them to the institution owning the
sub-scheme, and emit one row per institution x financial year x stage with the
source document and line number attached.

A DDG prints four value columns: (3) actuals of Y-2, (4) BE of Y-1, (5) RE of
Y-1, (6) BE of Y. Units are rupees thousands; `amount_inr` is that x 1000.

Stages are resolved to the earliest document that can carry them: actuals from
the demand two years on, original BE from the year's own demand, RE from the
next year's demand. Revised beats interim where both exist.

Usage:  python3 scripts/build_library_spend.py [--pdfdir DIR] [--out FILE]
"""
import argparse
import csv
import hashlib
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

# file -> (budget year, document kind, publication URL stem)
DOCS = [
    ("2018-2019_b43.pdf", "2018-19", "BE"),
    ("2019-2020_d43.pdf", "2019-20", "BE"),
    ("2020-2021_d43.pdf", "2020-21", "BE"),
    ("2021_2022_IBE_d43.pdf", "2021-22", "IBE"),
    ("2021_2022_RBE_d43.pdf", "2021-22", "RBE"),
    ("2022-2023_d43.pdf", "2022-23", "BE"),
    ("d43.pdf", "2023-24", "BE"),
    ("DemandBook_43.pdf", "2024-25", "BE"),
    ("DemandBook_43-1.pdf", "2025-26", "BE"),
    ("DemandBook_43-2.pdf", "2026-27", "IBE"),
    ("DemandBook_43-3.pdf", "2026-27", "RBE"),
]

# sub-scheme letter -> institution, as the demand document names it
GROUPS = {
    "AA": "Directorate of Public Libraries (state HQ consolidated)",
    "AF": "Charges under TN Public Libraries Act 1948 (branch/district libraries)",
    "BA": "Muthamizh Arignar Kalaignar Memorial Library, Madurai",
    "BD": "Grand Library and Science Centre, Coimbatore",
    "BE": "Grand Library and Intellectual Centre, Tiruchirappalli",
    "BF": "Bharathidasan Arivulagam Library, Salem",
    "BG": "Anjalaiammal Arivulagam Library, Cuddalore",
    "BH": "Quaid-e-Millat Arivulagam Library, Tirunelveli",
    "JQ": "Children and Adolescents Libraries and Digital Infrastructure Scheme",
}

LINE = re.compile(r"2205\s+00\s+105\s+([A-Z]{2})\s+33402\s*$")
CELL = re.compile(r"(?:\.\.\.|[-\d,]+)(?=\s)")

STAGE_LAG = {"actual": 2, "budget_estimate": 0, "revised_estimate": 1}


def fy_shift(fy, delta):
    start = int(fy[:4]) + delta
    return f"{start}-{str(start + 1)[2:]}"


def text_of(pdf):
    txt = pdf[:-4] + ".txt"
    subprocess.run(["pdftotext", "-layout", pdf, txt], check=True)
    return txt


def parse(txt, doc_year, kind):
    out = []
    for n, line in enumerate(open(txt, encoding="utf-8", errors="replace"), 1):
        m = LINE.search(line.replace("\u00a0", " "))
        if not m:
            continue
        group = m.group(1)
        cells = [c.strip() for c in CELL.findall(line[: m.start()])][-4:]
        if len(cells) < 4:
            continue
        printed = dict(zip(["actual", "budget_estimate", "revised_estimate", "budget_estimate_current"], cells))
        for stage, fy in (("actual", fy_shift(doc_year, -2)),
                          ("budget_estimate", fy_shift(doc_year, -1)),
                          ("revised_estimate", fy_shift(doc_year, -1)),
                          ("budget_estimate", doc_year)):
            raw = printed.get(stage if stage != "budget_estimate" or fy != doc_year else "budget_estimate_current")
            if stage == "budget_estimate" and fy == doc_year:
                raw = printed["budget_estimate_current"]
            elif stage == "budget_estimate":
                raw = printed["budget_estimate"]
            elif stage == "revised_estimate":
                raw = printed["revised_estimate"]
            else:
                raw = printed["actual"]
            if raw in ("...", None):
                val, flag = "", "nil"
            else:
                val = int(raw.replace(",", "")) * 1000
                flag = "token" if val == 1000 else ""
            out.append(dict(group=group, fy=fy, stage=stage, val=val, flag=flag,
                            printed=raw or "", doc_year=doc_year, kind=kind, line=n))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--pdfdir", default=os.path.join(ROOT, "data", "budget", "ddg43"))
    ap.add_argument("--out", default=os.path.join(ROOT, "data", "budget", "library-book-spend.csv"))
    a = ap.parse_args()

    rows = []
    for fname, year, kind in DOCS:
        pdf = os.path.join(a.pdfdir, fname)
        if not os.path.exists(pdf):
            print(f"missing {fname}", file=sys.stderr)
            continue
        for r in parse(text_of(pdf), year, kind):
            r.update(source_file=fname)
            rows.append(r)

    # one row per (group, fy, stage): chosen by stage lag, RBE over IBE
    rank = {}
    for r in rows:
        want = STAGE_LAG[r["stage"]]
        lag = int(r["doc_year"][:4]) - int(r["fy"][:4])
        if lag != want:
            continue
        k = (r["group"], r["fy"], r["stage"])
        cand = (0 if r["kind"] == "RBE" else 1, r["doc_year"], r["line"])
        if k not in rank or cand < rank[k][0]:
            rank[k] = (cand, r)

    os.makedirs(os.path.dirname(a.out), exist_ok=True)
    cols = ["institution_group", "institution", "fiscal_year", "stage", "amount_inr",
            "amount_printed_thousand", "nil_or_token", "budget_doc_year",
            "budget_doc_kind", "source_file", "source_line"]
    with open(a.out, "w", newline="", encoding="utf-8") as fh:
        w = csv.writer(fh)
        w.writerow(cols)
        for (group, fy, stage), (_, r) in sorted(rank.items(), key=lambda x: (x[0][1], x[0][0], x[0][2])):
            w.writerow([group, GROUPS.get(group, group), fy, stage, r["val"],
                        r["printed"], r["flag"], r["doc_year"], r["kind"],
                        r["source_file"], r["line"]])
    print(f"{len(rank)} rows -> {a.out}")

    sums = {}
    for _, r in rank.values():
        if r["val"] and r["flag"] != "token":
            sums[(r["fy"], r["stage"])] = sums.get((r["fy"], r["stage"]), 0) + r["val"]
    for k in sorted(sums):
        print(f"  {k[0]} {k[1]}: Rs {sums[k] / 1e7:.2f} cr")


if __name__ == "__main__":
    main()
