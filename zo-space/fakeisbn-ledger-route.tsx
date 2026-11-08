import { useState } from "react";
import { Shield, FileWarning, BookOpen, Search, ExternalLink, Database } from "lucide-react";

// Aram fake-ISBN ledger — Anna Centenary Library (ACL, Chennai) + Kalaignar Centenary Library (KCL, Madurai)
// Data: /data/fakeisbn-verification.json (381 rows), uploaded as zo.space asset.
const theme = {
  bg: "#0e1116", fg: "#e8e6e1", card: "rgba(24,28,36,0.9)", muted: "#9aa3af",
  red: "#f87171", amber: "#fbbf24", green: "#4ade80", blue: "#60a5fa", gold: "#d8a657",
};
const VERDICT_META: Record<string, { label: string; color: string }> = {
  "HIJACKED-ALLOCATED-ELSEWHERE": { label: "Stolen ISBN (live allocation elsewhere)", color: theme.red },
  "NEVER-ALLOCATED": { label: "ISBN never allocated by registry", color: theme.amber },
  "NO-ISBN-IN-CATALOG": { label: "No ISBN recorded in catalog record", color: theme.muted },
};
type Row = {
  library: string; city: string; opac_link: string; biblio: string;
  fake_title: string; fake_author: string; fake_imprint: string; isbn: string;
  copies: string; date_acquired: string; price_shown: string;
  registry_verdict: string; registry_original_title: string; registry_original_publisher: string;
  registry_original_lang: string; registry_original_date: string;
  verify_isbn_gov_in: string; verify_openlibrary: string; verify_worldcat: string; verify_google_books: string;
};

export default function Ledger() {
  const [rows, setRows] = useState<Row[] | null>(null);
  const [lib, setLib] = useState("ALL");
  const [verdict, setVerdict] = useState("ALL");
  const [q, setQ] = useState("");
  const [page, setPage] = useState(0);
  const PER = 50;

  async function load() {
    if (rows) return;
    const r = await fetch("/data/fakeisbn-verification.json", { headers: { Accept: "application/json" } });
    setRows(await r.json());
  }
  load();

  if (!rows) return <main className="min-h-screen p-10 text-center" style={{ background: theme.bg, color: theme.fg }}>Loading ledger…</main>;

  const filtered = rows.filter(r =>
    (lib === "ALL" || r.library === lib) &&
    (verdict === "ALL" || r.registry_verdict === verdict) &&
    (!q || (r.fake_title + r.fake_author + r.isbn + r.fake_imprint).toLowerCase().includes(q.toLowerCase()))
  );
  const pages = Math.max(1, Math.ceil(filtered.length / PER));
  const view = filtered.slice(page * PER, page * PER + PER);
  const counts: Record<string, number> = {};
  rows.forEach(r => { counts[r.registry_verdict] = (counts[r.registry_verdict] || 0) + 1; });
  const aclPriced = rows.filter(r => r.library === "ACL Chennai" && r.price_shown).length;

  return (
    <main className="min-h-screen p-4 md:p-8" style={{ background: theme.bg, color: theme.fg }}>
      <div className="max-w-6xl mx-auto">
        <header className="mb-6">
          <div className="flex items-center gap-3 mb-2">
            <BookOpen style={{ color: theme.gold }} className="size-7" />
            <h1 className="text-2xl md:text-3xl font-bold">Fake-ISBN book ledger — Tamil Nadu public libraries</h1>
          </div>
          <p className="text-sm" style={{ color: theme.muted }}>
            381 catalog records screened against the isbn.gov.in registry (live queries, 07–08 Nov 2026).
            Every row links to the public sources used for verification.            Note: IsbnSearch is a plain search page (paste the row's ISBN); library OPAC links go live — ACL Chennai's OPAC was intermittently unreachable on 07 Nov 2026.
            Part of the <a className="underline" href="/aram/fakeisbn">Aram fake-ISBN investigation</a>.
          </p>
        </header>

        <section className="grid grid-cols-2 md:grid-cols-4 gap-3 mb-6">
          <Card n={rows.length} label="records screened" c={theme.fg} />
          <Card n={counts["HIJACKED-ALLOCATED-ELSEWHERE"] || 0} label="ISBNs stolen from live allocations" c={theme.red} />
          <Card n={counts["NEVER-ALLOCATED"] || 0} label="ISBNs never allocated at all" c={theme.amber} />
          <Card n={counts["NO-ISBN-IN-CATALOG"] || 0} label="records with no ISBN in catalog" c={theme.muted} />
        </section>

        <section className="rounded-xl p-4 mb-6 border" style={{ background: theme.card, borderColor: "#2a3140" }}>
          <div className="flex flex-wrap gap-3 items-center text-sm">
            <span className="flex items-center gap-2"><Search className="size-4" style={{ color: theme.muted }} />
              <input value={q} onChange={e => { setQ(e.target.value); setPage(0); }} placeholder="title / author / ISBN / imprint"
                className="rounded-md px-3 py-1.5 border bg-transparent" style={{ borderColor: "#2a3140", color: theme.fg }} /></span>
            <select value={lib} onChange={e => { setLib(e.target.value); setPage(0); }} className="rounded-md px-2 py-1.5 border bg-transparent" style={{ borderColor: "#2a3140", color: theme.fg }}>
              <option value="ALL">All libraries</option><option value="ACL Chennai">ACL Chennai</option><option value="KCL Madurai">KCL Madurai</option>
            </select>
            <select value={verdict} onChange={e => { setVerdict(e.target.value); setPage(0); }} className="rounded-md px-2 py-1.5 border bg-transparent" style={{ borderColor: "#2a3140", color: theme.fg }}>
              <option value="ALL">All verdicts</option>
              {Object.entries(VERDICT_META).map(([k, v]) => <option key={k} value={k}>{v.label}</option>)}
            </select>
            <span style={{ color: theme.muted }}>{filtered.length} rows</span>
            <span style={{ color: theme.muted }}>· ACL copies priced at procurement: {aclPriced} records, ₹89,870 total</span>
          </div>
        </section>

        <div className="overflow-x-auto rounded-xl border" style={{ borderColor: "#2a3140" }}>
          <table className="w-full text-xs md:text-sm">
            <thead>
              <tr className="text-left" style={{ background: "rgba(255,255,255,0.04)", color: theme.muted }}>
                <th className="p-2">Library</th><th className="p-2">Fake title (catalog)</th><th className="p-2">Fake author / imprint</th>
                <th className="p-2">ISBN</th><th className="p-2">Verdict</th><th className="p-2">Registry says the ISBN belongs to</th>
                <th className="p-2">Copies</th><th className="p-2">Acquired</th><th className="p-2">Price</th><th className="p-2">Verify</th>
              </tr>
            </thead>
            <tbody>
              {view.map((r, i) => {
                const vm = VERDICT_META[r.registry_verdict] || { label: r.registry_verdict, color: theme.fg };
                return (
                  <tr key={r.library + r.biblio} className="border-t align-top" style={{ borderColor: "#1d2430" }}>
                    <td className="p-2 whitespace-nowrap"><a href={r.opac_link} target="_blank" rel="noreferrer" className="underline" style={{ color: theme.blue }}>{r.library}</a><br /><span style={{ color: theme.muted }}>#{r.biblio}</span></td>
                    <td className="p-2">{r.fake_title}</td>
                    <td className="p-2">{r.fake_author}<br /><span style={{ color: theme.muted }}>{r.fake_imprint}</span></td>
                    <td className="p-2 font-mono">{r.isbn || "—"}</td>
                    <td className="p-2" style={{ color: vm.color }}>{vm.label}</td>
                    <td className="p-2">{r.registry_verdict === "HIJACKED-ALLOCATED-ELSEWHERE"
                      ? <>{r.registry_original_title}<br /><span style={{ color: theme.muted }}>{r.registry_original_publisher} · {r.registry_original_lang} · {r.registry_original_date}</span></>
                      : <span style={{ color: theme.muted }}>—</span>}</td>
                    <td className="p-2 whitespace-nowrap">{r.copies}</td>
                    <td className="p-2 whitespace-nowrap" title={r.date_acquired || ""}>{r.date_acquired || <span style={{ color: theme.muted }}>?</span>}</td>
                    <td className="p-2 whitespace-nowrap">{r.price_shown ? <>₹{r.price_shown}</> : <span style={{ color: theme.muted }}>—</span>}</td>
                    <td className="p-2 whitespace-nowrap">
                      {r.isbn ? <>
                        <a href={r.verify_isbn_gov_in} target="_blank" rel="noreferrer" className="underline mr-2" style={{ color: theme.blue }}>registry</a>
                        <a href={r.verify_openlibrary} target="_blank" rel="noreferrer" className="underline mr-2" style={{ color: theme.blue }}>OpenLib</a>
                        <a href={r.verify_worldcat} target="_blank" rel="noreferrer" className="underline mr-2" style={{ color: theme.blue }}>WorldCat</a>
                        <a href={r.verify_google_books} target="_blank" rel="noreferrer" className="underline" style={{ color: theme.blue }}>GB</a>
                      </> : <span style={{ color: theme.muted }}>no ISBN</span>}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>

        <div className="flex items-center justify-between mt-3 text-sm">
          <span style={{ color: theme.muted }}>Page {page + 1} / {pages}</span>
          <div className="flex gap-2">
            <button onClick={() => setPage(p => Math.max(0, p - 1))} disabled={page === 0} className="rounded-md px-3 py-1 border disabled:opacity-40" style={{ borderColor: "#2a3140" }}>Prev</button>
            <button onClick={() => setPage(p => Math.min(pages - 1, p + 1))} disabled={page >= pages - 1} className="rounded-md px-3 py-1 border disabled:opacity-40" style={{ borderColor: "#2a3140" }}>Next</button>
          </div>
        </div>

        <footer className="mt-8 text-xs space-y-2" style={{ color: theme.muted }}>
          <p className="flex items-center gap-2"><Database className="size-4" /> Full dataset: <a className="underline" href="/data/fakeisbn-verification.csv" download>CSV</a> · <a className="underline" href="/data/fakeisbn-verification.json" target="_blank" rel="noreferrer">JSON</a> (381 rows, one row per catalog record; ACL + KCL).</p>
          <p>Method: catalog records read from each library's public Koha OPAC (MARC + detail views); ISBNs checked digit-validated, then matched against the live isbn.gov.in public search (India-IP vantage). "Stolen ISBN" = the registry shows a different, real book allocated to another registrant on that exact ISBN. No claim is made about any physical book's contents — only that catalog metadata and registry allocations conflict.</p>
          <p>Investigation desk: Aram · TN anti-corruption · pages: <a className="underline" href="/aram/fakeisbn">registry verification</a> · <a className="underline" href="/aram/kss">KSS scheme</a></p>
        </footer>
      </div>
    </main>
  );
}

function Card({ n, label, c }: { n: number; label: string; c: string }) {
  return (
    <div className="rounded-xl border p-4" style={{ background: theme.card, borderColor: "#2a3140" }}>
      <div className="text-2xl font-bold" style={{ color: c }}>{n.toLocaleString()}</div>
      <div className="text-xs mt-1" style={{ color: theme.muted }}>{label}</div>
    </div>
  );
}
