---
description: Check that your creative director is set up correctly and report what's wrong.
---

Run a diagnostic and report results as a simple pass/fail checklist. This is what the user pastes
into the community when something isn't working, so be specific and don't speculate.

Check each of these:

1. **Workspace found** — does `~/Employees/ad-creative-director/` exist (or the path recorded in
   `_memory/Business.md`)? Print the resolved path.
2. **Memory exists** — does `_memory/` contain `Business.md`, `Offer.md`, `Audience.md`,
   `Winners.md`, and `Preferences.md`?
3. **Memory has substance** — is any of those files under ~10 lines or still holding onboarding
   placeholders? A thin `Audience.md` is the single biggest cause of generic ads, so call it out.
4. **Offer is current** — when was `Offer.md` last modified? Flag anything over 90 days as worth a
   re-read, since prices and guarantees drift.
5. **Read/write OK** — read a memory file, then append one dated line to `_memory/Log/Checkup.md`
   to prove you can write. Append to that one file rather than creating scratch files, since you
   don't delete things and scratch files would pile up forever.
6. **Swipe and Performance** — how many files in each? Note the newest date in `Performance/`.
   Empty `Performance/` means every result you have came from chat, so say that.
7. **Winners is being fed** — how many logged ads in `Winners.md`, and when was the last entry? If
   it's been more than 3 weeks and they're actively spending, results aren't making it back to you.
8. **Recent output** — what's the newest file in `_memory/Log/`, and what type? If nothing in 14
   days and they expected a scheduled run, their Routine likely isn't firing.

Report like this:

```
✅ Workspace found — /Users/you/Employees/ad-creative-director
✅ Memory exists — 5/5 files
⚠️  Audience.md is 6 lines — too thin to write specific ads from
✅ Offer.md updated 12 days ago
✅ Read/write OK
✅ Swipe — 11 files · Performance — 3 files, newest 2026-07-24
❌ Winners.md — last entry June 30, 27 days ago
✅ Log — Concepts-2026-07-20.md, 7 days ago
```

End with the single most important thing to fix, in one sentence. If everything passes, say so
plainly and stop.

$ARGUMENTS
