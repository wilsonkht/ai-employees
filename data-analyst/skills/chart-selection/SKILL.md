---
name: chart-selection
description: Choose the chart type that actually answers the question, and build it as a self-contained file the user can open, screenshot, or text. Use for /chart, any request to "graph this," "show me a chart," or "make it visual," and whenever a finding is easier to see than to read.
---

# Which chart answers which question

A chart is not decoration and it is not proof. It exists to make one comparison obvious at a
glance. Before you draw anything, finish this sentence: *"This chart shows that ______."* If you
can't, don't build it — write the sentence instead.

## Pick by the question, not by the data

| The question | Chart | Why |
|---|---|---|
| How has this changed over time? | **Line** | Continuous time, position shows trend. Needs 5+ points to be honest |
| How do these categories compare? | **Horizontal bar**, sorted by value | Easiest comparison a human can make. Sort by value, never alphabetically |
| How does this month compare to last? | **Grouped bar**, 2 bars per category | Two periods side by side beats two charts |
| What's the mix? | **Stacked bar** (one bar per period) | Shows composition *and* total. Beats a pie every time |
| Where do people drop off? | **Funnel** (labeled horizontal bars, descending) | Stage-to-stage % is the finding |
| Do these two things move together? | **Scatter** | And label it "moves with," not "causes" |
| How does retention decay by cohort? | **Small multiples** — one small line per cohort | One tangled chart with 8 lines shows nothing |
| Is one number good or bad? | **No chart.** One big number with the comparison | A single number does not need a graph |

**Never use a pie chart.** Humans compare angles badly. A sorted bar chart shows the same thing
and can be read in one second. If the user asks for a pie, build the bar and say why in one line —
they almost always prefer it.

## Rules that make a chart honest

- **Bar charts start at zero.** Always. A truncated bar axis exaggerates a difference and is the
  single most common way charts lie. Line charts may use a narrower range — label it clearly.
- **Label the axes with units.** `$`, `%`, `orders`. No bare numbers.
- **Put the sample size and date range in the subtitle**, every chart, no exceptions:
  `1,337 customers · first order Jan–Apr 2026`.
- **The title is the finding, not the topic.** "Repeat rate fell 6.6 points since January" beats
  "Repeat Rate by Cohort."
- **Show incomplete periods differently** or cut them. A partial current month drawn as a normal
  bar reads as a crash.
- **Under 5 data points, use a table.** A 3-bar chart is a table with extra steps.

## How to build it

Write a **single self-contained HTML file with inline SVG** to
`~/Employees/data-analyst/Reports/<date>-<slug>.html`. No libraries, no CDN, no internet. It opens
in any browser with a double-click, screenshots cleanly, and texts well. Keep it under ~1000px
wide, with dark text on white so it reads in a message thread.

```html
<h1>Repeat rate fell 6.6 points since January</h1>
<p>Second order within 90 days · 1,337 customers · first order Jan–Apr 2026 ·
   source: shopify-orders-2026-07.csv</p>
<svg viewBox="0 0 640 300" width="640" role="img" aria-label="Repeat rate by cohort">
  <!-- baseline y=250 is zero. scale = 180px ÷ 23.1 points = 7.79px per point.
       bar height = rate × 7.79 ; bar y = 250 − height -->
  <rect x="60"  y="70"  width="90" height="180" fill="#2b6cb0"/><text x="105" y="62" text-anchor="middle">23.1%</text>
  <rect x="200" y="88"  width="90" height="162" fill="#2b6cb0"/><text x="245" y="80" text-anchor="middle">20.8%</text>
  <rect x="340" y="104" width="90" height="146" fill="#2b6cb0"/><text x="385" y="96" text-anchor="middle">18.7%</text>
  <rect x="480" y="121" width="90" height="129" fill="#3182ce"/><text x="525" y="113" text-anchor="middle">16.5%</text>
  <line x1="50" y1="250" x2="620" y2="250" stroke="#333"/>
  <text x="105" y="270" text-anchor="middle">Jan</text><text x="245" y="270" text-anchor="middle">Feb</text>
  <text x="385" y="270" text-anchor="middle">Mar</text><text x="525" y="270" text-anchor="middle">Apr</text>
</svg>
```

Bar heights must be proportional to the values from a zero baseline — compute them, don't eyeball
them. Above, 180px ÷ 23.1% = 7.79px per point, and 16.5% × 7.79 = 129px. Show that scale factor in
a comment so anyone can check the drawing is honest.

If the user specifically needs a PNG and `matplotlib` is already installed, use it. Do not install
packages to make a picture — ask first.

Tell them where it landed and offer to open it:

> Chart is at `~/Employees/data-analyst/Reports/2026-07-27-repeat-rate-by-cohort.html`. Want me to
> open it?

## Colors and clarity

One color for one series. A second, brighter shade only to highlight the one bar that is the
point. Never use a rainbow — different colors imply different *kinds* of things. If a category is
"other," make it gray so it recedes.

## Failure modes

- **Charting three numbers.** Use a sentence or a table.
- **Truncated bar axes.** Dishonest, even accidentally.
- **A chart with no date range.** Unfalsifiable, therefore useless.
- **Dual y-axes.** Two scales on one chart can be arranged to show any relationship you like. Use
  two stacked charts sharing an x-axis instead.
- **Charting a metric you couldn't compute cleanly.** If the underlying number came with heavy
  caveats, the chart will travel — into a deck, into an investor email — and the caveats won't.
  Put the caveat in the subtitle where it can't get separated from the picture.
- **Rebuilding a chart instead of updating the data.** Charts belong in `Reports/` with a date in
  the filename. Never overwrite last month's chart; make a new one so the history survives.
