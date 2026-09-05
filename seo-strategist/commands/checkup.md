---
description: Check that your SEO strategist is set up correctly and report what's wrong.
---

Run a diagnostic and report results as a simple pass/fail checklist. This is what the user pastes
into the community when something isn't working, so be specific and don't speculate.

Check each of these:

1. **Workspace found** — does `~/Employees/seo-strategist/` exist, with `_memory/`, `Briefs/`,
   `Audits/`, `Research/`, and `Data/`? Print the resolved path.
2. **Memory exists** — are all six files there: `Business.md`, `Site.md`, `Keywords.md`,
   `Competitors.md`, `Guidelines.md`, `Preferences.md`?
3. **Memory is current** — when was each last modified? Flag anything older than 60 days as stale,
   and `Site.md` older than 30 days as likely out of date if they've published since.
4. **Read/write works** — read a memory file, write a scratch file to `_memory/Log/`, then leave it
   (don't delete it — just name it so they know it's a test file).
5. **Safety hook active** — run exactly this, which names a file that doesn't exist:
   `rm ~/Employees/seo-strategist/_memory/.guard-selftest`
   Being **blocked** is the pass — report "Safety hook active, deletes are blocked." If the command
   runs instead, that's a failure: the hook isn't loaded, so nothing is stopping a destructive
   command. Tell them to reinstall the plugin, and say it plainly rather than burying it.
6. **Site reachable** — fetch the domain in `Site.md`. Report the status and whether the HTML came
   back readable or JavaScript-rendered and empty.
7. **Search data present** — what's in `Data/`? List each file with its date. Flag if empty, or if
   the newest export is over 60 days old.
8. **Keyword pipeline** — from `Keywords.md`, count clusters by status: planned, briefed, published,
   ranking. Flag if everything has sat at `briefed` for more than 30 days — that means briefs are
   being written and never published.
9. **Work produced** — count files in `Briefs/`, `Audits/`, and `Research/`, and print the date of
   the most recent one. If it's been over two weeks and they expect scheduled runs, their Routine
   probably isn't firing.

Report like this:

```
✅ Workspace found — /Users/you/Employees/seo-strategist
✅ Memory exists — 6/6 files
⚠️  Memory stale — Site.md last updated 41 days ago, and Briefs/ has 3 newer briefs
✅ Read/write OK
✅ Safety hook active — deletes are blocked
✅ Site reachable — stonebridgebooks.com, 200, HTML readable
❌ No search data — Data/ is empty. I'm working without volumes or positions.
✅ Keywords — 12 clusters: 5 planned, 4 briefed, 3 published
⚠️  Nothing published in 34 days — 4 briefs are waiting on a writer
```

End with the single most important thing to fix, in one sentence. If everything passes, say so
plainly and stop.
