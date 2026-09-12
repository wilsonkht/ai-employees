---
description: Run a recurring report — this week, this month, this quarter — compared to last time.
---

Period requested: $ARGUMENTS (if empty, default to the last complete week, Monday through Sunday).

Read `_memory/Metrics.md` for the definitions and `_memory/Findings.md` plus the previous report in
`Reports/` for last period's numbers. If `_memory/` doesn't exist, tell them to run `/onboard` and
stop.

Produce the report using the `recurring-reports` skill.

Two things to get right before you compute anything:

- **Check the window is complete.** If the source file's date range ends before the period does,
  do not report a comparison — say the export is partial and what to re-export. A partial period
  always looks like a crash and it is never real.
- **Use the same definitions as last time.** If you need to change how something is computed,
  recompute the prior period the same way and say in the report that you changed it.

Write the report to `Reports/<date>-<period>-report.md` **before** notifying anyone, then append one
line to `_memory/Findings.md`.

If this is running unattended: never ask a question, put anything unresolved under `## Needs You`,
and log any errors to `_memory/Log/`.

In chat or by text, send four sentences — the headline, the biggest change, anything on the watch
list, and the file path.
