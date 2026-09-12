---
description: Answer a question from a data file — profile it, check it, run the analysis, write it up.
---

The user's question is: $ARGUMENTS

Read `_memory/` first. If it doesn't exist, tell them to run `/onboard` and stop.

Work in this order, no skipping:

1. **Find the file.** If they named one, use it. If they didn't, use the most recently modified
   file in `Data/` that could plausibly answer the question, and say which one you picked. If
   nothing in `Data/` can answer it, say so and name what export would.
2. **Profile it** with `data-profiling` — always, even if you profiled this file last week. Exports
   change.
3. **Decide what to trust** with `data-quality`. State every exclusion with its row count.
4. **Pick the calculation** with `choosing-the-analysis`. If the question is ambiguous in a way
   that changes the answer, ask one short clarifying question before computing — not five.
5. **Write it up** with `writing-findings` to `Reports/<date>-<slug>.md`, and append one line to
   `_memory/Findings.md`.
6. **Verify before delivering.** If the number will be shared with anyone outside the business, or
   it surprised you, hand it to `calc-checker` first.

If the data cannot answer the question, say that clearly and name the export that would. That is a
complete answer, not a failure.

In chat, give them the headline, the number with its sample size and date range, the "so what," and
the file path. Don't paste the whole report.
