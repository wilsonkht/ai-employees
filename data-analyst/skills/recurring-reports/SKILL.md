---
name: recurring-reports
description: Produce a repeating report — weekly sales, monthly performance, quarterly review — computed the same way every time so periods are actually comparable, with changes measured against the archive in Findings.md. Use for /report, any scheduled or unattended run, and requests like "same report as last month" or "how did this week compare."
---

# Reports that repeat

A one-off analysis has to be right. A recurring report has to be right *and* consistent, because
its entire value is the comparison to last time. If you change how you compute "active customer"
in month three, months one and two become fiction and nobody notices.

**Consistency beats cleverness here.** If you find a better way to compute something, recompute
the prior periods the same way and say in the report that you changed it.

## Before you compute anything

1. Read `_memory/Metrics.md` for the definition of every metric in this report. Use those
   definitions exactly, even if you'd choose differently.
2. Read `_memory/Findings.md` and the previous report in `Reports/` — you need last period's
   numbers to compute the change, and you need to know what you flagged last time.
3. Profile the file again (`data-profiling`). Exports break silently. A refresh that quietly
   dropped a channel will otherwise show up as a 30% revenue collapse and you'll report it.
4. Confirm the window. State it explicitly: `2026-07-20 → 2026-07-26 (Mon–Sun)`. Compare
   like-for-like — a 7-day week against the prior 7-day week, a full month against a full month.

## The standard shape

```markdown
# Week of Jul 20 — revenue up 8%, but wholesale carried it

**Headline.** Revenue $11,840 (+8.1% vs prior week). All of the gain is one wholesale reorder;
online revenue was down 3.4%.

| Metric | This week | Last week | Change |
|---|---|---|---|
| Revenue | $11,840 | $10,952 | +8.1% |
| Orders | 268 | 279 | −3.9% |
| Average order value | $44.18 | $39.25 | +12.6% |
| New customers | 61 | 74 | −17.6% |
| Repeat orders | 44 | 51 | −13.7% |

## What changed and why
- One wholesale order to Fairhaven Market ($1,910) is the entire revenue increase. Without it,
  revenue is $9,930, down 9.3%.
- New customers down for the third straight week: 88 → 74 → 61.

## Watch list
- New customer count, 3 weeks declining. If next week is under 55, that's a trend, not noise.

## Needs You
- `channel` is blank on 22 of 268 orders this week (8.2%). It was 0% last week — something
  changed in the export. Channel splits below exclude those 22 orders.

*Source: shopify-orders-2026-07.csv, 2026-07-20 → 2026-07-26. Definitions per `_memory/Metrics.md`.*
```

## Rules for the comparison

- **Same window length, always.** Week vs week, month vs month. If a month is short or has an
  extra weekend, normalize per day and say you did.
- **Show the change in both forms** when the base is small. "+8.1%" on 12 orders is 1 order. Give
  the absolute number too.
- **Never report a percentage change off a base under 30** without the raw counts next to it.
- **One line per metric, not a paragraph.** The table carries the numbers; prose carries the why.
- **Three sections maximum in the body.** What changed, what to watch, what needs them.
- **Flag the streak.** "Third straight week" is the most valuable sentence in a recurring report,
  and it only exists because you read `Findings.md` first.
- **Don't re-explain stable metrics.** If AOV moved 0.4%, it goes in the table and nowhere else.

## Worked example of the trap

Harborview's Monday report for the week of 2026-07-06 showed revenue down 41%. The profile caught
it before the report went out: the export ran on Sunday morning and contained only 4 days of that
week. The correct output was not a revenue crash — it was:

> This week's export covers Jul 6–9 only, not the full week. I'm not reporting a comparison from
> a partial week. Re-run the Shopify export through Jul 12 and I'll have the real numbers in a
> few minutes. Nothing in the data suggests an actual decline.

Reporting the 41% would have been technically true of the file and completely false about the
business. Always check that the window in the file matches the window in the report.

## Unattended runs

Scheduled reports run with nobody there. In those runs:

- **Never ask a question.** Compute with what's on disk.
- **Write the report to `Reports/` before sending any notification.** If the text fails, the work
  survives.
- **Missing or stale file:** still produce the report. Mark that section "no data available for
  this period — source file last modified 2026-07-14" and put it under `## Needs You`. Never
  carry last period's number forward as if it were current.
- **Errors** go to `_memory/Log/run-<date>.md` with what failed and what you did instead.
- **Append to `_memory/Findings.md`** every run, one line, so next period's comparison exists.
- Keep the notification to four sentences and a file path. The report is the artifact; the text
  is a pointer to it.

## Failure modes

- **Definition drift.** The silent killer. Metrics.md is the source of truth; check it every run.
- **Comparing a partial period to a complete one.** Produces a fake crash every single time.
- **Overwriting last period's report.** New dated file each run. History is the whole point.
- **Reporting noise as news.** A 2% move on 268 orders is nothing. Say "flat" and move on.
- **Losing the streak.** If you don't read `Findings.md`, every week looks like the first week.
