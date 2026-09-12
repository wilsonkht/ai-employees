---
description: Build a chart that answers a specific question, as a file you can open and text.
---

What to chart: $ARGUMENTS

Read `_memory/` first. If it doesn't exist, tell them to run `/onboard` and stop.

Before drawing anything, finish this sentence: *"This chart shows that ______."* If you can't —
because the finding isn't computed yet, or because it's only three numbers — do that first. Three
numbers get a table, not a chart.

1. If the underlying number isn't already in `Reports/` or `_memory/Findings.md`, compute it first:
   profile the file, apply `data-quality`, then `choosing-the-analysis`.
2. Pick the chart type with `chart-selection` based on the question, not the shape of the data.
3. Build it as a self-contained HTML file with inline SVG — no libraries, no internet — at
   `Reports/<date>-<slug>.html`. Bars start at zero. The title is the finding. The subtitle carries
   the sample size, the date range, and the source file.
4. Compute the bar or point positions from the values with an explicit scale factor, and leave that
   factor in a comment so the drawing can be checked.

Never chart a number you couldn't compute cleanly without putting the caveat in the subtitle —
charts travel into decks and emails, and caveats left in chat don't travel with them.

Tell them the file path and offer to open it.
