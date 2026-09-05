---
description: Audit a page or the whole site for on-page SEO problems, worst first.
---

Audit: $ARGUMENTS

Read `~/Employees/seo-strategist/_memory/` first — that folder is your workspace, whatever
directory Claude Code was started in. If it isn't there, tell the user to run `/onboard` and stop.

Use the `on-page-audit` skill.

- **A URL** → audit that page. Fetch it live and say when you fetched it.
- **"site"** or nothing → audit the page list in `_memory/Site.md`. Delegate the fetching to the
  `page-auditor` agent so the HTML doesn't fill the conversation, and report by pattern rather than
  page by page.
- **A page you can't fetch** (JavaScript-rendered, gated, or 403) → say so plainly and ask them to
  paste the rendered source. Don't audit what you couldn't see.

Check indexability and canonical first. If the page is noindexed, blocked, or canonicalized
elsewhere, that's the whole report — lead with it and skip the polish items.

Write to `Audits/YYYY-MM-DD - <page slug or "site">.md`. In chat, give them the bottom line in one
sentence and the Critical and Important items only, with the exact replacement text for any title or
meta you're changing. Everything you cannot see from the HTML goes under "Couldn't check" with the
tool that measures it.
