---
name: writing-findings
description: Turn a finished analysis into a write-up a non-technical business owner can act on — answer first, what it means second, method last. Use at the end of every analysis, before delivering any number, chart, or report, and whenever the user says "just tell me what this means."
---

# Writing it up for the person who signs the checks

The analysis is not the deliverable. The decision they can now make is the deliverable.

The owner will read the first two sentences, so everything you want them to know has to be in
those two. Method, caveats, and tables live below for the one time in ten they check your work.

## The shape

```markdown
# <The finding, as a sentence with a number in it>

**Answer.** One or two sentences. The number, the direction, the period.
**So what.** What it means for the business and what it suggests doing. The section they hired
you for. One short paragraph, no hedging.
**How confident.** How solid this is and what would make it more solid.

## The numbers          <the table, with the calculation shown>
## What I excluded and why   <every row you dropped, with counts>
## Method               <how you computed it: file, columns, window>
```

Cut any section that has nothing in it. A three-section write-up is a good write-up.

## The rules

- **Lead with the answer, never the methodology.** "Repeat rate is falling" comes before "I ran a
  cohort analysis." They do not care that you ran a cohort analysis.
- **The title is the finding.** "Repeat rate fell 6.6 points since January," not "Customer
  Retention Analysis Q1–Q2."
- **Every number carries its denominator and its window.** `16.5% (58 of 351 April customers)`.
- **Show the arithmetic** for anything they might repeat to a partner or a lender.
- **Plain words.** "Customers who bought again," not "retention cohort conversion." "Typical
  order," not "median." A technical term must be defined in the same sentence, in six words.
- **Separate what you measured from what you think.** Measured: "repeat rate fell 6.6 points."
  Inferred: "that usually means the product mix changed — worth checking." Label the second as
  yours. Never let an inference wear the clothes of a measurement.
- **Bad news goes in the first line.** They can handle it; they can't handle finding out in month four.
- **Say what you'd look at next**, in one line. It's the difference between a report and an analyst.

## Worked example

The bad version — every mistake in four lines:

> I conducted a comprehensive cohort-based retention analysis leveraging your Shopify order data.
> The methodology involved deduplicating order lines to distinct order identifiers. Results
> indicate a potential downward directional trend in the 90-day repeat purchase conversion metric,
> though further analysis may be warranted.

The good version:

```markdown
# Repeat customers are down 6.6 points since January

**Answer.** Of the customers who first bought in January, 23.1% came back within 90 days. For
April's customers it's 16.5%. That's four months of steady decline across 1,337 customers —
consistent enough that it isn't noise.

**So what.** You're still winning about the same number of new customers each month (342 in
January, 351 in April), so this isn't a traffic problem. You're losing them after the first
order. At April's rate you'll get roughly 23 fewer second orders per month than in January —
about $890 a month at your $38.90 average order value, and it compounds because second-time
buyers are the ones who become regulars. The two things worth checking first: whether the
first-order product mix changed (subscriptions retain differently than one-off bags), and
whether anything changed in the post-purchase email flow in February.

**How confident.** Solid on the trend, no read on the cause. Four complete cohorts, all months
of the year, no data gaps. I can't measure May, June or July yet — their 90-day windows haven't
closed. If the pattern is real, May's cohort should land near 15% when it completes on
August 29, and I'll check then.

## The numbers

| First bought | New customers | Came back within 90 days | Repeat rate |
|---|---|---|---|
| January 2026 | 342 | 79 | 23.1% |
| February 2026 | 318 | 66 | 20.8% |
| March 2026 | 326 | 61 | 18.7% |
| April 2026 | 351 | 58 | 16.5% |

Repeat rate = customers with a 2nd order within 90 days ÷ customers whose first order was that
month. April: 58 ÷ 351 = 16.5%.

## What I excluded and why

- May, June, July cohorts — 90-day window hasn't closed as of 2026-07-27
- 61 cancelled orders ($0.00) — not sales
- Order lines collapsed to distinct order_id: 4,812 lines → 3,904 orders

## Method

Source: `Data/shopify-orders-2026-07.csv`, orders dated 2026-01-03 to 2026-07-25. Cohort =
calendar month of a customer's first-ever order, identified by `customer_email`. The 138 rows with
no email (all in-store POS) are excluded from cohorts — they can't be tracked across orders, so
true repeat rate may be slightly higher than shown, equally across all four cohorts.
```

Then log it: write the file to `Reports/2026-07-27-repeat-rate-by-cohort.md`, append one line to
`_memory/Findings.md`, and send four sentences in chat with the file path — never the whole report.

```
2026-07-27 · Repeat rate by cohort · 23.1% (Jan) → 16.5% (Apr), 4 complete cohorts, 1,337
customers · shopify-orders-2026-07.csv · Reports/2026-07-27-repeat-rate-by-cohort.md
```

## Failure modes

- **Burying the answer under method.** The most common failure. Method last, always.
- **Hedge stacking.** "May potentially indicate a possible trend" tells them nothing.
- **A number with no window.** "AOV is $38.90" is not a finding until it has a date range.
- **Inference smuggled in as fact.** "Customers left because of the price increase" — unless the
  data has a reason field, you don't know that. You know they left.
- **Recommending an action the data doesn't support.** Suggest what to *check*, not what to *do*,
  unless the numbers genuinely carry the decision.
- **Pasting the whole report into chat.** Write the file, then give the headline and the path.
