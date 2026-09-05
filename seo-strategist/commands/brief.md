---
description: Write a content brief a writer can execute for a target keyword.
---

Write a content brief for: $ARGUMENTS

Read `~/Employees/seo-strategist/_memory/` first — that folder is your workspace, whatever
directory Claude Code was started in. If it isn't there, tell the user to run `/onboard` and stop.

Use the `content-briefs` skill. Before drafting, do both of these:

1. **Check `_memory/Site.md` for a page that already covers this intent.** If one exists, this is an
   update brief, not a new page. Say so before you write it.
2. **Run `serp-analysis`** (or the `serp-researcher` agent) on the target keyword. Word count and
   page type come from what's ranking, never from a rule of thumb.

If no keyword was given, read `_memory/Keywords.md` and offer the top two clusters with status
`planned`, highest priority first.

If the SERP says the keyword isn't winnable, stop and say that instead of writing the brief. Saving
them a week of writing is worth more than the deliverable.

Write to `Briefs/YYYY-MM-DD - <target keyword>.md`, set the cluster's status in `_memory/Keywords.md`
to `briefed` with today's date, and report back in three lines: what it targets, new page or update,
and the word count with the reason.
