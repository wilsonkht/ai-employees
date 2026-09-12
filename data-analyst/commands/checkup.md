---
description: Check that your data analyst is set up correctly and report what's wrong.
---

Run a diagnostic and report results as a simple pass/fail checklist. This is what the user pastes
into the community when something isn't working, so be specific and don't speculate.

Check each of these:

1. **Workspace found** — does `~/Employees/data-analyst/` exist, with `Data/`, `Reports/`, and
   `_memory/`? Print the resolved path.
2. **Memory exists** — does `_memory/` contain `Business.md`, `Preferences.md`, `Data-Sources.md`,
   `Metrics.md`, `Findings.md`, and a `Log/` folder?
3. **Metrics are defined** — how many metrics are defined in `Metrics.md`? If it's empty or has
   fewer than two, flag it: reports will drift without definitions.
4. **Data files present** — count the files in `Data/`, and print the name, size, and last-modified
   date of each. Flag any file not modified in over 45 days as stale.
5. **Data-Sources.md matches reality** — is every file in `Data/` listed in `Data-Sources.md`, and
   is every file listed in `Data-Sources.md` actually present? Name any mismatch in both directions.
6. **Readable and writable** — confirm you can read the first rows of one data file, then write a
   one-line scratch file to `_memory/Log/checkup-<date>.txt`. Leave it in place: you don't delete
   files, and the safety hook will block you if you try. Never test writability inside `Data/` —
   that folder is read-only by design and the hook blocks writes into it.
7. **Spreadsheet support** — run `python3 -c "import openpyxl"`. If it fails and there are `.xlsx`
   files in `Data/`, flag that those files need to be exported as CSV.
8. **Recent activity** — when was the last file written to `Reports/`, and the last line appended to
   `Findings.md`? If they expect a weekly report and it's been more than 10 days, their Routine
   likely isn't firing.

Report like this:

```
✅ Workspace found — /Users/you/Employees/data-analyst
✅ Memory exists — 5/5 files + Log/
✅ Metrics defined — 4 (repeat customer, active customer, AOV, churn)
✅ Data — 3 files, newest shopify-orders-2026-07.csv (Jul 26)
⚠️  Data-Sources.md missing an entry for mailchimp-campaigns-2026.csv
✅ Read/write OK
❌ openpyxl not installed — qb-pl-2026-h1.xlsx can't be read; export it as CSV
❌ No report since Jul 6 — check that your Routine is still active
```

End with the single most important thing to fix, in one sentence. If everything passes, say so
plainly and stop.

$ARGUMENTS
