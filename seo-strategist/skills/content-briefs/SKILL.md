---
name: content-briefs
description: Write the content brief a writer executes from — outline, word count, entities, questions to answer, title and meta, and internal links. Use for /brief, or any request like "write a brief for X," "what should this article cover," "outline a post about X," or when handing a target keyword to a writer or an AI writer.
---

# Writing a content brief

A brief is a work order. A competent writer who knows nothing about SEO should be able to open it,
write the piece, and produce something that ranks — without asking a single question.

If your brief could describe any article on the topic, it isn't a brief. It's a table of contents.

## 1. Lock the target before you write anything

Read `_memory/Keywords.md` and `_memory/Site.md` and answer these four. If any answer is missing,
get it before drafting.

| Question | Where it comes from | If it's wrong |
|---|---|---|
| What's the target keyword and cluster? | `_memory/Keywords.md` | You brief a page that competes with one they already have |
| What's the intent? | `keyword-research`, confirmed by the SERP | The page can be excellent and never rank |
| New page or update an existing one? | `_memory/Site.md` | Cannibalization — two pages splitting one keyword |
| Who reads this and what do they do next? | `_memory/Business.md` | Traffic with no business outcome |

**Check for cannibalization every time.** Search `_memory/Site.md` for pages already covering this
intent. If one exists, the brief is an update brief: what to keep, what to cut, what to add. Say
that out loud rather than quietly writing a second page.

## 2. Read the SERP before you outline

Use the `serp-analysis` skill or the `serp-researcher` agent. You are looking for four things:

- **Page type and format** that's ranking (guide, listicle, service page, tool, video)
- **Depth** — what the ranking pages actually cover, so you can set a real word count
- **The angle nobody took** — the gap is where a small site wins
- **SERP features** — People Also Ask boxes and featured snippets tell you exactly which questions
  to answer and in what format

Set word count from what's ranking, never from a rule of thumb. If the top results run 1,100–1,500
words, brief 1,400 and say why. "2,000 words because long content ranks" is the single most
expensive myth in this field.

## 3. Write the brief

Use this shape. Every field gets filled or explicitly marked `unknown`.

```markdown
# Content brief — how to set up job costing in QuickBooks for contractors
Date: 2026-07-27 · Cluster: job costing in QuickBooks · Status: ready for writer

## The job
| Field | Value |
|---|---|
| Target keyword | how to set up job costing in quickbooks for contractors |
| Secondary | quickbooks job costing tutorial, items vs classes job costing, track job costs quickbooks |
| Intent | Informational — someone doing this themselves tonight |
| Page | NEW — /blog/quickbooks-job-costing-contractors |
| Reader | Owner of a 4–15 person contracting business, does their own books, mildly frustrated |
| Next step for the reader | Book the free 20-minute setup review (CTA at the end, not the top) |
| Target length | 1,400 words — top 3 ranking pages run 1,100, 1,300, and 1,650 (Research/2026-07-27 - job costing SERP.md) |
| Volume | unknown — no keyword tool connected |

## Title and meta
- **Title tag (58 chars):** How to Set Up Job Costing in QuickBooks for Contractors
- **H1:** How to set up job costing in QuickBooks for contractors
- **Meta description (152 chars):** A step-by-step setup for contractors: items vs. classes, how to
  tag labor and materials to a job, and the three mistakes that make your reports useless.
- **URL slug:** quickbooks-job-costing-contractors

## Outline
- **H1** — How to set up job costing in QuickBooks for contractors
- **Intro (100 words)** — the pain: you can see total profit but not which jobs made it. Promise the
  setup takes about an hour. No throat-clearing about "in today's competitive landscape."
- **H2 — What job costing actually tells you** (150 words) — profit per job, not profit per month
- **H2 — Before you start: what you need** (100 words) — QuickBooks version, chart of accounts, one
  job to test on
- **H2 — Step 1: turn on job costing** (200 words) — exact menu path for Online and Desktop, both
- **H2 — Step 2: items vs. classes — which one you need** (250 words) — the decision most people get
  wrong. Table comparing the two.
- **H2 — Step 3: tag labor to a job** (250 words) — timesheets, payroll items, the weekly habit
- **H2 — Step 4: tag materials and subs** (200 words)
- **H2 — Reading the Job Profitability report** (150 words) — a screenshot description of what
  "good" looks like
- **H2 — Three mistakes that make job costing useless** (200 words) — overhead in the wrong bucket,
  inconsistent tagging, no weekly review
- **H2 — When it's worth handing this off** (100 words) — soft CTA

## Must cover (entities and terms)
Job Profitability Summary report, items vs. classes, cost of goods sold, overhead allocation,
timesheets, purchase orders, change orders, WIP, QuickBooks Online Plus vs. Desktop Contractor
Edition, percentage of completion

## Questions to answer explicitly
Pulled from People Also Ask on 2026-07-27 (Research/2026-07-27 - job costing SERP.md):
- Does QuickBooks Online do job costing?
- What's the difference between items and classes in QuickBooks?
- How do I track labor cost by job?
- Why don't my job costing reports match my P&L?

## Internal links
**Link out to:**
| Anchor text | Target |
|---|---|
| chart of accounts for contractors | /blog/contractor-chart-of-accounts |
| our bookkeeping service for contractors | /services/contractor-bookkeeping |

**Link in from:** add a link to this post from /blog/contractor-chart-of-accounts (section "Tracking
costs") and from /services/contractor-bookkeeping (FAQ section).

## Voice and rules
From `_memory/Guidelines.md`: second person, short sentences, no em dashes, never say "seamless" or
"solutions." Screenshots for every step. Every number cited to a source.

## Do not
- Do not open with a definition of job costing. They know what it is; they searched how to set it up.
- Do not gate the answer behind an email form.
- Do not claim a specific dollar savings — we have no data for that.
```

## 4. File it and log it

Write to `Briefs/YYYY-MM-DD - <target keyword>.md`. Update `_memory/Keywords.md` — set that
cluster's status to `briefed` with the date and the brief's filename. Report back in three lines:
what the brief targets, whether it's new or an update, and the word count with the reason.

If a brief replaces an earlier one for the same keyword, move the old file to `_memory/Log/` with
its date. Never overwrite it — that record is how you learn what worked.

## Failure modes

- **Briefing before checking the SERP.** You'll produce a beautiful guide for a keyword whose page
  one is entirely product pages.
- **Word count from a rule of thumb.** Always from the ranking pages, always with the numbers shown.
- **Outlines full of "discuss the benefits."** Every heading gets a word count and a sentence about
  what it must accomplish.
- **Inventing statistics for the writer to use.** If the brief says "cite a stat about construction
  margins," it names a real source to check or says `find a source — do not invent`.
- **Silently creating a second page for an intent they already cover.** Check `Site.md` first. Every
  time.
- **Ignoring `Guidelines.md`.** A brief that violates their house style gets rewritten by hand,
  which means it saved nobody anything.
