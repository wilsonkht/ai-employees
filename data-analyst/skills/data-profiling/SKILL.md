---
name: data-profiling
description: Inspect a data file before doing anything else with it — row count, columns, types, date range, value ranges, missing values, duplicates, and obvious problems. Use whenever a new spreadsheet, CSV, or export appears, before any analysis, chart, or report, and any time the user asks "what's in this file?" or drops a file with no instructions.
---

# Profiling a file

This is always the first step. Not sometimes — always. You cannot analyze a file you have not
looked at, and the profile regularly changes the answer to the question you were asked.

The goal is to be able to say, in one paragraph: what this file is, how much of it there is, what
period it covers, and what's wrong with it.

## The seven checks

Run all seven. Use a command or a script, never your eyes on a sample.

| # | Check | What you're looking for |
|---|---|---|
| 1 | **Shape** | Row count and column count. Does the row count match what they expect? |
| 2 | **Columns and types** | Name and inferred type of every column. Flag any column that's a mix of types. |
| 3 | **Date range** | Earliest and latest date in the primary date column. Check for missing days or months. |
| 4 | **Ranges** | Min, max, median for every numeric column. Zeros and negatives are the interesting part. |
| 5 | **Missing values** | Count and percentage of blanks per column. Anything above 5% needs a sentence. |
| 6 | **Duplicates** | Exact duplicate rows, and duplicated values in the ID column. These are different problems. |
| 7 | **Categories** | For text columns with few distinct values, list them with counts. This is where you find `Paid`, `paid`, and `PAID` as three statuses. |

**Every category breakdown must sum to the row count.** If `status` accounts for 3,769 of 4,812
rows, you have 1,043 rows with a value you haven't seen — blanks, whitespace, or a fourth spelling.
Add the tick to your profile so it's visible: `4,545 + 61 + 194 + 12 = 4,812 ✓`. Counts that don't
reconcile are the earliest warning that you've misread the file.

## How to run it

```bash
head -3 ~/Employees/data-analyst/Data/shopify-orders-2026-07.csv
wc -l ~/Employees/data-analyst/Data/shopify-orders-2026-07.csv
```

Then compute the rest with a Python script using only the standard library (`csv`, `statistics`,
`collections`). Do not install packages without asking. For `.xlsx` files, check first whether
`openpyxl` is available; if it isn't, ask the user to export as CSV from Excel or Sheets — that's
a ten-second job for them and avoids a dependency install.

Write the full profile to `_memory/Log/profile-<filename>-<date>.md` so you never have to redo it,
and record the file in `_memory/Data-Sources.md` with one line describing what it contains.

## Worked example

Harborview Coffee Co. drops `shopify-orders-2026-07.csv` into `Data/` with the message
"how are we doing?"

```
PROFILE — shopify-orders-2026-07.csv
Read 2026-07-27 · 4,812 rows × 14 columns · 1.9 MB

Date range      2026-01-03 → 2026-07-25 (no missing months; 29 days with zero orders,
                every one a Sunday — they don't ship Sundays)
Grain           one row per order line, NOT per order. 4,812 rows = 3,904 unique order_ids.

Counts below are per ROW (= per line), not per order.

order_total     per line, not per order · min $0.00 · median $26.00 · max $2,480.00
                61 rows at $0.00 → all 61 have status = "cancelled"
customer_email  138 blank (2.9%) · all 138 have channel = "POS"
order_date      no blanks
status          fulfilled 4,545 · cancelled 61 · refunded 194 · Refunded 12  ← same status, two spellings
                (4,545 + 61 + 194 + 12 = 4,812 ✓ accounts for every row)
channel         online 3,214 · POS 690 · wholesale 908  (= 4,812 ✓)
discount_code   4,102 blank (85.2%) — expected, most orders have no code

Duplicates      0 exact duplicate rows · 1,604 rows share an order_id with another row,
                across 696 multi-line orders (1,604 − 696 = 908 extra rows = 4,812 − 3,904 ✓)

Problems to resolve before analyzing
1. Grain is order LINES, not orders. Any "number of orders" must count distinct order_id.
2. "refunded"/"Refunded" must be merged or refunds get undercounted by 12.
3. 61 cancelled orders at $0 will drag any average down if included.
```

Then say to the user, in chat, the short version:

> Profiled it: 4,812 rows covering Jan 3 to Jul 25, but it's one row per order *line*, so that's
> 3,904 actual orders. Three things I'll handle: cancelled orders are in there at $0, "refunded"
> is spelled two ways, and 2.9% of rows have no email (all in-store sales). What do you want to
> know?

## Failure modes

- **Assuming the grain.** One row per order, per line item, per customer, per day? Get this wrong
  and every count you produce is wrong. Check by counting distinct IDs against row count.
- **Trusting the header row.** A column called `revenue` may be gross, net, pre-tax, or include
  shipping. Look at the values and compare against something you know before you trust the name.
- **Reading the first 20 rows and stopping.** Exports are frequently sorted, so the first rows are
  the oldest and least representative. Profile the whole file.
- **Ignoring zeros and negatives.** Negative amounts are usually refunds; zeros are usually
  cancellations or test orders. Both quietly wreck averages.
- **Silent encoding damage.** If you see `â€™` or `Ã©` in text columns, the file is mis-encoded.
  Say so — it will break any grouping on those values.
- **Trailing junk rows.** Spreadsheet exports often carry a totals row or a blank row at the
  bottom. That totals row will double your revenue if you sum blindly.

## When the file is huge

Over roughly 200,000 rows, don't read the whole thing into context. Compute the profile with a
streaming script and report only the summary. If the folder has many files, hand the sweep to the
`dataset-scout` subagent and work from its inventory.
