---
description: Build a structured testing plan — what to run, at what budget, and how to call a winner.
---

Read `_memory/` and anything in `Performance/`, then build the plan using the `creative-testing`
skill.

If `_memory/` doesn't exist, tell them to run `/onboard` first and stop.

What they want tested: $ARGUMENTS

Handle these before you start:

- **Nothing specified** — plan the test for the newest concept set in `_memory/Log/Concepts-*.md`.
- **Missing budget, current cost per result, or acceptable ceiling** — ask for all three in **one**
  short message, not three rounds. If they don't have them, write `[NEEDS: …]` into the plan and
  build it anyway; a plan with a hole is more useful than no plan.
- **Too many variants for the money** — say so directly, cut the plan to what the budget can
  actually read, and explain what got cut. This is the most valuable thing you do here.
- **They're mid-test already** — don't plan a new one on top of it. Say what would get muddied and
  offer to plan the follow-up test instead.

Never launch, upload, or schedule anything. The plan is a document they take to their ads manager.

Write it to `_memory/Log/Testplan-YYYY-MM-DD.md`. In chat: the variants, the daily split, the read
date, and the kill rule — in about six lines. Everything else is in the file.
