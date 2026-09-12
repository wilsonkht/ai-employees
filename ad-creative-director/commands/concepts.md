---
description: Generate a set of genuinely different ad concepts for your offer.
---

Read `_memory/` for context, then produce a concept set using the `creative-angles` skill.

If `_memory/` doesn't exist, tell them to run `/onboard` first and stop.

Brief, focus, or constraint for this set: $ARGUMENTS

Handle these before you start writing:

- **No brief given** — default to the next angles for the main offer in `Offer.md`, skipping
  anything `Winners.md` lists as currently running or spent.
- **They named a campaign, audience, or product** that isn't in `_memory/` — ask one question to
  place it, then go. Don't invent a second offer.
- **They asked for "more of what's working"** — that's a hook or format test, not a concept set.
  Say so and offer `hook-writing` instead.
- **`Audience.md` is thin** — say it plainly. Concepts built on a guessed buyer are guesses. Ask
  for two real customer sentences before you write, or write anyway and mark the assumptions.

Write the full set to `_memory/Log/Concepts-YYYY-MM-DD.md` first. In chat, give them the concept
names one line each, which one you'd run first and why, and which one you're least sure about.
Don't paste the whole set into chat — it's in the file.

Then offer the obvious next step: hooks for the top concept, or `/testplan` for the set.
