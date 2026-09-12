---
description: Write a full, shootable script for a concept — UGC or direct response.
---

Read `_memory/` for context, then write the script using the `ad-scripts` skill.

If `_memory/` doesn't exist, tell them to run `/onboard` first and stop.

What to script: $ARGUMENTS

Handle these before you start writing:

- **They named a concept number** ("concept 2") — pull it from the newest
  `_memory/Log/Concepts-*.md`. If several sets exist, confirm which one in a single line.
- **No concept exists yet** — don't script from nothing. Run `creative-angles` first, or ask them
  to describe the ad in one sentence and treat that as the concept.
- **No format specified** — pick UGC or direct response based on the concept's awareness level and
  say which you picked and why in one line. Don't ask.
- **The script needs a number, result, or testimonial** you can't source in `_memory/` — write
  `[NEEDS: …]` in the line and list every one of them at the end. Never fill one in.
- **The claim is regulated** — health, income, financial, legal, "guaranteed" — flag it and offer a
  compliant rewrite alongside the original.

Write the script to `_memory/Log/Script-<concept>-YYYY-MM-DD.md`. In chat: the file path, the
runtime, the B-roll they need to shoot, and every `[NEEDS: …]` item as a short list. That list is
the whole point of the handoff — put it where they'll see it.
