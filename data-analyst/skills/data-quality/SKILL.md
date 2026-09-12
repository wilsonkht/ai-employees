---
name: data-quality
description: Decide whether a file is good enough to answer the question, and what to do about the parts that aren't — missing values, duplicates, inconsistent categories, outliers, date gaps, and wrong grain. Use after profiling and before any analysis, and whenever a number looks wrong or two files disagree.
---

# Is this data good enough to answer the question?

Profiling tells you what's wrong. This skill decides whether it matters and what you do about it.

The test is never "is this data clean." No business file is clean. The test is: **does this
problem change the answer to the question I was asked?** A 40% blank `phone_number` column is
irrelevant to a revenue question and fatal to a contact-rate question.

## The decision table

For each problem the profile turned up, pick one of four responses. Say which one you picked, in
the write-up, every time.

| Response | When to use it | What you must write |
|---|---|---|
| **Ignore** | The bad column isn't used in this analysis | "138 rows have no email; not used here." |
| **Exclude** | Bad rows are identifiable and a small share | "Excluded 61 cancelled orders (1.3% of rows)." |
| **Fix** | The fix is mechanical and reversible | "Merged `Refunded` into `refunded` (12 rows)." |
| **Stop** | The problem makes any answer misleading | Report the data problem *as* the finding. |

You never fix the source file. Fixes happen in your working copy or in the script. `Data/` is
read-only, always.

## Thresholds that actually matter

These are defaults. State the number you found either way — never just say "some missing values."

- **Missing in a column you're analyzing:** under 5%, exclude and note it. 5–20%, exclude, note it,
  and check whether the missing rows are systematically different (they usually are — the 138
  blank emails were all in-store sales, which is a real pattern, not random noise). Over 20%, stop
  and tell the user the column can't carry a conclusion.
- **Duplicate IDs:** never ignore. Either the grain isn't what you thought, or the export ran
  twice. Both change every count. Resolve before proceeding.
- **Outliers:** never delete an outlier because it looks weird. Investigate it. A single $2,480
  line in a business with a $26.00 median line is either the wholesale channel or a data error, and
  which one it is matters enormously. If you exclude it, say so and show the number both ways.
- **Date gaps:** a missing week is usually a broken export, not a week with no sales. Check before
  reporting a dip that isn't real.
- **Two files disagree:** show both numbers, name both files, and ask. Never silently pick one.

## Worked example

Harborview asks: "What's our average order value this quarter?"

The profile turned up four problems. Working through them:

| Problem | Response | Why |
|---|---|---|
| Grain is order lines, not orders | **Fix** | Group by `order_id` and sum `order_total` per order first — otherwise a 3-item order counts as 3 cheap orders and AOV collapses |
| 61 cancelled rows at $0.00 | **Exclude** | A cancelled order isn't a sale. Excluding raises AOV; say so. |
| 194 + 12 refunded rows, two spellings | **Fix, then report both** | Merge the spellings. Then give AOV including refunded orders (gross) and excluding them (net). They're different questions and the owner cares about the second. |
| 138 blank emails | **Ignore** | AOV doesn't need a customer identity. |

The result, with the arithmetic visible:

```
Q2 2026 (2026-04-01 → 2026-06-30), shopify-orders-2026-07.csv

Order lines in window            1,486
Distinct orders                  1,204
  less cancelled                   -18
  = orders counted               1,186
Gross order value              $46,131.40
AOV (gross)  $46,131.40 ÷ 1,186 = $38.90

Refunded orders in window          -47  ($2,104.30)
Net orders                       1,139
AOV (net)  $44,027.10 ÷ 1,139 = $38.65
```

And the sentence they read:

> Q2 average order value is **$38.90** across 1,186 orders (Apr 1 – Jun 30). Backing out the 47
> refunded orders, it's $38.65. I excluded 18 cancelled orders that show as $0.00.

## When to stop instead of answering

Say this plainly, early, and without apology. It is one of the most valuable things you do:

> I can't give you a reliable channel breakdown from this file. `channel` is blank on 1,340 of
> 4,812 rows (27.8%), and the blanks are concentrated in March and April — that looks like the
> export broke, not like those orders had no channel. Any percentage I gave you would be wrong by
> an unknown amount. Re-export the orders report from Shopify with the channel column included and
> I'll have the breakdown in five minutes.

## Failure modes

- **Cleaning silently.** If you dropped rows and didn't say so, you fabricated a number.
- **Deleting outliers to make the chart look nice.** Never. Investigate, then decide, then disclose.
- **Averaging an average.** The mean of monthly AOVs is not the quarter's AOV. Recompute from rows.
- **Treating blank as zero.** A blank `order_total` is unknown. A zero is a real zero. Summing
  blanks as zeros understates revenue and nobody notices for months.
- **Assuming the export is complete.** Platform exports are commonly capped (first 1,000 rows,
  first 90 days). If the row count is a suspiciously round number, or the date range starts
  exactly N days ago, say so before analyzing.
