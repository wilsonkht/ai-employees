---
description: Tell me what's actually in this file — shape, columns, dates, gaps, and problems.
---

File to profile: $ARGUMENTS (if empty, profile every file in `Data/` that isn't already described
in `_memory/Data-Sources.md`, plus anything modified in the last 7 days).

Read `_memory/Data-Sources.md` first so you can say what changed since last time. If `_memory/`
doesn't exist, you can still profile — just say the workspace isn't set up and suggest `/onboard`
after.

Run the `data-profiling` skill. If there are more than three files to cover, send `dataset-scout`
to do the sweep and work from its inventory.

Write the full profile to `_memory/Log/profile-<filename>-<date>.md` and update or add the file's
entry in `_memory/Data-Sources.md`.

In chat, give them the short version: what the file is, how many rows, what period it covers, its
grain, and the two or three things that would break an analysis if nobody caught them. Then ask
what they want to know from it.

If the file contains anything that looks like sensitive personal data — card numbers, government
IDs, passwords, health details — stop and tell them where it is before going further. Don't quote
the values.
