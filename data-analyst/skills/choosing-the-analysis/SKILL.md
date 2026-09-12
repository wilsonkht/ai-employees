---
name: choosing-the-analysis
description: Translate a business owner's plain-English question into the specific calculation that actually answers it, and recognize when the data can't answer it at all. Use whenever someone asks "why is X down," "is Y working," "how are we doing," or any question where it isn't obvious what to compute.
---

# Picking the analysis that answers the question asked

The owner asks "why are sales down?" The lazy move is to compute monthly revenue, show it going
down, and call it an answer. That's not an answer — it's the question restated with a chart on it.

Your job is to turn a vague business question into a specific calculation, run it, and answer the
question they actually meant.

## Step 1 — Find the real question

Business questions almost always hide a decision. Ask yourself what they'd *do* differently
depending on the answer. If you can't tell, ask them — one short question, not a survey:

> When you say "sales are down," do you mean fewer orders, or the same orders at lower value? They
> point at completely different fixes.

Check `_memory/Metrics.md` before asking anything. If they've already defined the term, use their
definition and don't make them repeat themselves.

## Step 2 — Map the question to a calculation

| They ask | They mean | You compute |
|---|---|---|
| "How are we doing?" | Compared to last period | Current period vs prior period on 3–4 headline metrics, with % change |
| "Why are sales down?" | Which component fell | Decompose: revenue = orders × AOV. Then split whichever fell by segment |
| "Who are our best customers?" | Where should I spend attention | Revenue per customer, ranked; plus concentration (top 10 as % of total) |
| "Is churn getting worse?" | Are newer customers leaving faster | Cohort retention by signup month — never a single blended churn number |
| "Did the promo work?" | Incremental, not total | Promo-period vs comparable prior period, and promo buyers vs non-promo buyers |
| "What should I stock more of?" | What sells, adjusted for availability | Units and revenue by SKU, flagged for stockout days |
| "Which channel is best?" | Best per dollar, not biggest | Revenue and order count by channel, plus AOV per channel |
| "Are we growing?" | Trend, not last month's spike | Monthly series with at least 6 points; call out the trend and the noise |

## Step 3 — Decompose before you explain

Never answer "why" with a single aggregate. Break the metric into its parts and find which part
moved. Revenue is the classic:

```
Revenue = number of orders × average order value
Number of orders = customers × orders per customer
```

Run each component across both periods. The one that moved is your answer. The ones that didn't
move are also worth a line — "AOV is flat, so this is purely a volume problem" is a real finding.

## Step 4 — Check the analysis is honest before you run it

- **Is the window fair?** Comparing a 31-day month to a 28-day month, or a promo month to a normal
  month, produces fake findings. Use equal-length windows or normalize per day and say so.
- **Is the cohort complete?** A retention window needs to have finished. On 2026-07-27 you cannot
  measure 90-day repeat rate for anyone who bought in June.
- **Is the sample big enough to mean anything?** Under ~30 in a group, report the raw count, not a
  percentage. "3 of 7 wholesale accounts" beats "43%," which sounds like a fact and isn't.
- **Is this correlation being dressed up as cause?** You can show two things moved together. You
  almost never have data that proves one caused the other. Say "these moved together" and name
  what would test causation.

## Worked example

Harborview Coffee Co.: *"Feels like customers aren't coming back like they used to. True?"*

The real question is repeat purchase behavior over time, so a single blended repeat rate is the
wrong tool — it mixes new and old customers and hides the trend. Cohort analysis is right.

`Metrics.md` says Harborview counts a "repeat customer" as someone with a second order within 90
days of their first. Today is 2026-07-27, so the last cohort with a complete 90-day window is
April. May, June and July cohorts get excluded and I say so.

```
Cohort = month of first-ever order · Repeat = 2nd order within 90 days
Source: shopify-orders-2026-07.csv, deduplicated to 3,904 distinct orders

Cohort    New customers   Repeated within 90d   Repeat rate
Jan 2026        342               79              23.1%   (79 ÷ 342)
Feb 2026        318               66              20.8%   (66 ÷ 318)
Mar 2026        326               61              18.7%   (61 ÷ 326)
Apr 2026        351               58              16.5%   (58 ÷ 351)

Excluded: May, Jun, Jul cohorts — their 90-day window hasn't closed yet as of 2026-07-27.
Total customers in the four complete cohorts: 1,337.
```

The answer:

> Yes, and it's consistent — not noise. Of customers who first bought in January, 23.1% came back
> within 90 days. For April's customers it's 16.5%. That's four straight months of decline, a 6.6
> point drop, across 1,337 customers. I can't measure May onward yet; their 90 days aren't up.

## Failure modes

- **Answering the easy question.** "Revenue by month" when they asked "why." Decompose.
- **Blended rates that hide the trend.** One overall churn number is nearly always the wrong shape
  for a "getting worse?" question. Cohort it.
- **Incomplete windows read as decline.** The most common false alarm in small-business analytics:
  the newest cohort or the current month always looks bad because it isn't finished. Exclude it
  explicitly and say why.
- **Percentages on tiny groups.** 2 of 3 is not 67%.
- **Silent metric drift.** If you compute "active customer" differently than last month's report,
  the comparison is meaningless. `Metrics.md` exists to stop this. Check it, use it, and if you
  must change a definition, recompute the prior period the same way and say you did.
- **Answering a question the data can't reach.** If they ask which ad drove a sale and the export
  has no attribution columns, the answer is what data would answer it — not a guess dressed up in
  a table.
