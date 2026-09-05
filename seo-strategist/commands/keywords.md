---
description: Research and cluster keywords for a topic, with intent and priority.
---

Research keywords for: $ARGUMENTS

Read `~/Employees/seo-strategist/_memory/` first — that folder is your workspace, whatever
directory Claude Code was started in. If it isn't there, tell the user to run `/onboard` and stop.

Use the `keyword-research` skill. Check `Data/` for any Search Console or keyword-tool export
before you start, and check `_memory/Keywords.md` so you don't re-research a cluster you already
own.

If no topic was given, propose one instead of guessing: read `_memory/Business.md` and
`_memory/Keywords.md`, then name the two or three topics with the biggest gap between what they
sell and what the site covers, and ask which to run.

If page-one winnability is unclear for the head term of any cluster, run `serp-analysis` on that
term before assigning it a priority.

Write the research to `Research/YYYY-MM-DD - <topic>.md`, append the new clusters to
`_memory/Keywords.md` with status `planned`, and report back only the clusters, their intent, and
which one to do first. Don't paste the full research file into chat.
