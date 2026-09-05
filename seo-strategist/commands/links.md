---
description: Plan internal links — what should link to what, with exact anchor text.
---

Plan internal links for: $ARGUMENTS

Read `~/Employees/seo-strategist/_memory/` first — that folder is your workspace, whatever
directory Claude Code was started in. If it isn't there, tell the user to run `/onboard` and stop.

Use the `internal-linking` skill. The deliverable is a table of exact edits — page, section, anchor
text, destination — never the advice "add more internal links."

- **A URL or a page name** → get that page linked in properly, and give it sensible links out.
- **Nothing** → run the whole-site pass: orphan pages, dead ends, and money pages that nothing
  points at.

Every destination must already exist in `_memory/Site.md` or be a URL the user confirmed. If
`Site.md` has no page list yet, build it first and say that's what you're doing.

Write to `Research/YYYY-MM-DD - internal links <topic>.md` and report the edit count and the rough
time it'll take them. Do not mark anything as done in `_memory/Site.md` until they confirm they made
the edits — you don't touch the site, so you don't know it happened.
