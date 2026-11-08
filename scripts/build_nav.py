#!/usr/bin/env python3
"""Keep the navbar identical across every page in docs/.

Single source of truth: NAV_TEMPLATE below. The "569 records" figure is
computed from docs/data/final-classification.csv at run time, so the label
can never drift from the data.

Run: python3 scripts/build_nav.py
(build_site.py imports and calls sync_all() at the end of every build.)
"""
import csv, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DOCS = os.path.join(ROOT, "docs")

NAV_TEMPLATE = """<nav>
  <a href="index.html"{ia}>The Report</a>
  <a href="anatomy.html"{an}>The Anatomy</a>
  <a href="ghosts.html"{gh}>The Ghosts Speak</a>
  <a href="ledger.html"{le}>The Ledger — {total} records</a>
  <a href="verify.html"{ve}>Verify It Yourself</a>
  <a href="https://github.com/LogicIncZo/tn-fake-isbn-audit">Open Data (GitHub)</a>
</nav>"""


def total_records():
    with open(os.path.join(DOCS, "data", "final-classification.csv")) as f:
        return sum(1 for _ in csv.DictReader(f))


def render_nav(active=None):
    flags = {k: "" for k in ("ia", "an", "gh", "le", "ve")}
    key = {"index.html": "ia", "anatomy.html": "an", "ghosts.html": "gh",
           "ledger.html": "le", "verify.html": "ve"}.get(active)
    if key:
        flags[key] = ' aria-current="page"'
    return NAV_TEMPLATE.format(total=total_records(), **flags)


def sync_all():
    nav_re = re.compile(r"<nav>.*?</nav>", re.S)
    changed = []
    for name in sorted(os.listdir(DOCS)):
        if not name.endswith(".html"):
            continue
        path = os.path.join(DOCS, name)
        html = open(path, encoding="utf-8").read()
        new = nav_re.sub(render_nav(active=name), html, count=1)
        if new != html:
            open(path, "w", encoding="utf-8").write(new)
            changed.append(name)
    return changed


if __name__ == "__main__":
    changed = sync_all()
    print(f"nav synced across {len([f for f in os.listdir(DOCS) if f.endswith('.html')])} pages"
          + (f"; updated: {', '.join(changed)}" if changed else " (all already identical)"))
    sys.exit(0)
