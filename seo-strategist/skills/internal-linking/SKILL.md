---
name: internal-linking
description: Plan internal links across the site — hubs and clusters, orphan pages, anchor text, and links into money pages. Use for /links, or requests like "how should these posts link to each other," "find my orphan pages," "we just published a post, what should link to it," or "fix my site structure."
---

# Internal linking

Internal links are the cheapest SEO work that exists. No writing, no outreach, no waiting — you're
telling Google which of your pages matter and what they're about, using pages you already own.

The deliverable is never "add more internal links." It's a table of exact edits: which page, which
section, what sentence, what anchor, pointing where.

## 1. Build the map

From `_memory/Site.md` and `_memory/Keywords.md`, lay out every page with three facts: its target
cluster, what links to it, and what it links to. If `Site.md` doesn't have the page list, build it
first — you cannot plan links against a site you haven't listed.

Then answer:

- **What are the money pages?** Service, product, pricing, contact. Everything ultimately points here.
- **What are the hubs?** The broad page for each topic cluster.
- **What are the spokes?** The specific posts that belong to each hub.
- **What's orphaned?** Any page nothing links to except the nav or sitemap.
- **What's a dead end?** Any page that links nowhere.

## 2. The structure: hub and spoke

```
/services/contractor-bookkeeping        ← money page
        ↑            ↑            ↑
/blog/contractor-   /blog/quickbooks-  /blog/construction-
 chart-of-accounts   job-costing        payroll-basics
        ↕                ↕                    ↕
        └──── spokes link to each other ──────┘
```

Three rules that produce this shape:

1. **Every spoke links up to its hub or money page**, once, in context, with a descriptive anchor.
2. **Spokes link sideways** to the two or three most related spokes — where it genuinely helps the
   reader, not in a "related posts" widget.
3. **The hub links down** to every spoke. That's what makes it a hub.

## 3. Anchor text

| Do | Don't |
|---|---|
| Describe the destination: "bookkeeping for contractors" | "click here", "this post", "read more" |
| Vary it naturally across pages | Use the exact same anchor from 30 pages |
| Use the target keyword of the **destination** page | Use the keyword of the page you're writing on |
| Put it in a sentence someone would actually write | Bolt a link onto the end of a paragraph |

The anchor is the strongest hint you give Google about what the destination page is for. A page
whose inbound anchors all say "learn more" has told Google nothing.

## 4. The rules that keep it sane

- **Three clicks from the homepage, maximum.** Anything deeper gets crawled less and ranks worse.
- **Two to five contextual links per post.** Fifty links dilute every one of them.
- **Links in the body beat links in the footer.** Sitewide footer link stacks are close to worthless.
- **Newest content needs links most.** A post nobody links to takes far longer to get indexed and
  ranked. Every time something publishes, that's the moment to add three inbound links.
- **Don't link two pages that target the same keyword to each other with that keyword.** That's
  cannibalization with extra steps — flag the overlap instead.

## Worked example

Stonebridge Bookkeeping just published `/blog/quickbooks-job-costing-contractors` on 2026-07-24.
Site has 18 pages (`_memory/Site.md`). Task: get the new post linked in.

```markdown
# Internal linking plan — quickbooks job costing post
Date: 2026-07-27 · Source: _memory/Site.md (18 pages, updated 2026-07-24)

## Add these links (7 edits, about 25 minutes)

| On this page | In this section | Anchor text | Links to |
|---|---|---|---|
| /blog/contractor-chart-of-accounts | "Tracking costs by job" | how to set up job costing in QuickBooks | /blog/quickbooks-job-costing-contractors |
| /blog/construction-payroll-basics | "Allocating labor" | tag labor hours to a job | /blog/quickbooks-job-costing-contractors |
| /services/contractor-bookkeeping | FAQ, "Do you set up job costing?" | our job costing setup walkthrough | /blog/quickbooks-job-costing-contractors |
| /blog/quickbooks-job-costing-contractors | Step 2 | contractor chart of accounts | /blog/contractor-chart-of-accounts |
| /blog/quickbooks-job-costing-contractors | Closing section | bookkeeping for contractors | /services/contractor-bookkeeping |
| /blog/job-costing-mistakes | Intro | setting up job costing correctly | /blog/quickbooks-job-costing-contractors |
| /resources/ (hub) | Bookkeeping how-tos list | QuickBooks job costing for contractors | /blog/quickbooks-job-costing-contractors |

## Suggested sentences
- On /blog/contractor-chart-of-accounts, in "Tracking costs by job":
  "Once your accounts are set up, the next step is [how to set up job costing in QuickBooks], which
  is where the per-job numbers actually come from."

## While I was in here
- **2 orphan pages:** /services/catch-up-bookkeeping and /about/team have no inbound links except
  the nav. The catch-up page is a money page — it should be linked from the two "behind on books"
  blog posts.
- **1 dead end:** /blog/1099-vs-w2-subcontractors links nowhere. It's a natural feeder to
  /services/contractor-bookkeeping.

## Needs You
- /blog/job-costing-mistakes and the new post both mention "job costing setup." They're close but
  not identical in intent. Worth a look — if the older post is thin, folding it into the new one and
  redirecting is cleaner than linking them.
```

Then update `_memory/Site.md` with the new inbound and outbound links once the user confirms they
made the edits. Don't record them as done before that — you didn't touch the site.

## Failure modes

- **Vague advice.** "Add more internal links" is not a deliverable. Name the page, section, sentence,
  anchor, and destination.
- **Recommending links to pages that don't exist.** Every destination must be in `_memory/Site.md`
  or a URL the user confirmed. Never invent a URL.
- **Linking for the algorithm instead of the reader.** If the link wouldn't help someone reading
  that paragraph, don't recommend it.
- **Marking edits as done.** You propose; they publish. `Site.md` gets updated after they confirm.
- **Ignoring the money pages.** A perfectly interlinked blog that never points at a service page
  generates traffic and no revenue.
