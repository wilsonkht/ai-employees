---
name: serp-analysis
description: Analyze what's actually ranking for a keyword and whether this site can win it — page types, depth, angles, SERP features, and competitor strengths. Use before writing any content brief, and for requests like "who ranks for X," "can we rank for this," "analyze this competitor," or "what's on page one for X."
---

# SERP and competitor analysis

Before you tell someone to spend a week writing something, you look at what Google is already
rewarding for that search. Ninety percent of "why didn't this rank" is answered here, before a word
gets written.

## First, be honest about what you can see

This matters more than any technique in this file.

| Question | The honest answer |
|---|---|
| Can you see live Google rankings? | Not reliably. Search results are personalized, localized, and change daily. |
| Can you read the pages that rank? | Yes — fetch any public URL and analyze it properly. |
| Can you tell them their own ranking position? | Only from a Search Console export in `Data/`. |
| Can you tell them a competitor's traffic? | No. That needs Ahrefs, Semrush, or Similarweb. |

So: **never state a ranking position as fact unless it came from a file the user gave you.** If you
used a web search to find candidate pages, label it exactly that way:

> These are the pages I found for that search on 2026-07-27. This is not a rank check — your actual
> positions vary by location and history. For real positions, use Search Console (Performance →
> Queries) or paste me the top 10 you see.

Asking the user to paste their own SERP is a completely legitimate move. It takes them fifteen
seconds and gives you better data than any guess.

## 1. Collect the top results

Get the top 8–10 URLs, however you can: a web search, a paste from the user, or a screenshot they
describe. Then fetch and read the top 3–5 pages properly. Delegate to the `serp-researcher` agent
when there are several pages to read — it returns a summary instead of filling the conversation
with page text.

## 2. Record what's there

For each ranking page:

| Field | Why it matters |
|---|---|
| Page type | Guide, listicle, service page, product, forum, video — this is the intent verdict |
| Site type | National publisher, competitor, aggregator, forum, or a small site like theirs |
| Format | Word count, sections, tables, images, tools, calculators |
| Angle | The specific take — "for beginners", "for contractors", "2026 update" |
| Depth signals | What subtopics they all cover — this becomes the "must cover" list in the brief |
| Freshness | Published and updated dates, when shown |
| What's missing | The gap. This is the whole reason to do this analysis. |

## 3. Note the SERP features

They change what a page needs to do:

- **Featured snippet** — a direct 40–60 word answer under a matching H2 can take it
- **People Also Ask** — a free list of questions the brief must answer explicitly
- **Local pack** — the intent is local; a blog post can't win it, a Google Business Profile can
- **Shopping or product grid** — commercial intent, informational content will not rank
- **Video carousel** — the winning format is video, not text
- **Site links to one dominant brand** — the search is navigational; skip it

## 4. Call winnability

Say yes, no, or not yet, and say why. This is the single most useful sentence you produce.

| Signal | Read |
|---|---|
| Page one is all national publishers, Reddit, Wikipedia, or .gov | **No.** Say so plainly and propose a longer-tail alternative. |
| Page one is aggregators and review sites (G2, Capterra, Yelp) | **No** for a content page. Consider getting listed on them instead. |
| Page one has 2+ sites the same size as theirs | **Yes.** Someone their size already won it. |
| Pages ranking are thin, old, or off-intent | **Yes, and quickly.** This is the best signal in SEO. |
| Page one is all local businesses | **Yes, if local.** Location page plus Google Business Profile. |
| Everything is a well-maintained direct competitor | **Not yet.** Build topical depth around it first. |

## Worked example

```markdown
# SERP analysis — bookkeeping for contractors
Date: 2026-07-27 · Source: pages found via web search 2026-07-27, top 5 fetched and read
NOT a rank check — positions vary by location

| # | URL | Type | Site | ~Words | Angle |
|---|---|---|---|---|---|
| 1 | ledgerlane.com/industries/construction | Service page | Competitor, ~40 pages | 900 | "Built for builders", pricing shown |
| 2 | buildbooks.io/blog/contractor-bookkeeping-guide | Guide | SaaS, large blog | 2,400 | Complete guide, gated template |
| 3 | foundationfin.com/contractor-bookkeeping | Service page | Competitor, similar size | 1,100 | Local, Portland, team photos |
| 4 | reddit.com/r/Contractor/... | Forum | Reddit | — | "Is a bookkeeper worth it" |
| 5 | quickbooks.intuit.com/r/construction/ | Guide | Intuit | 1,800 | Software-led |

## What's ranking: service pages, not blog posts
Three of the top five are service pages. This is a transactional SERP. A blog post will not rank
here — the brief for this keyword is a service page brief.

## What they all have that Stonebridge doesn't
- A price or a starting range (1 and 3 both show one)
- Named industry proof: job costing, WIP, certified payroll, lien waivers
- Client logos or a named case study
- An FAQ block covering "how much", "do you work with my software", "what do you need from me"

## The gap
Nobody in the top five mentions **certified payroll for prevailing wage jobs**, which is a real
compliance headache for contractors doing public work and something Stonebridge handles
(_memory/Business.md). That's the angle.

## SERP features
- People Also Ask: "How much does a bookkeeper cost for a small construction company?",
  "Do contractors need a specialized bookkeeper?", "What is WIP in construction accounting?"
- Local pack present for the Portland-modified version — worth a Google Business Profile push.

## Winnability: yes
Two of the top five are competitors the same size as Stonebridge. Reddit at #4 means Google is
short on good pages. A focused service page with pricing, certified payroll, and an FAQ is a
realistic target this quarter.
```

Then update `_memory/Competitors.md`: Ledger Lane and Foundation Financial, what they're good at,
and the date you looked. That file is how you notice next quarter that someone changed strategy.

## Failure modes

- **Reporting rankings you didn't measure.** The fastest way to destroy trust. Label the source of
  every position, every time.
- **Estimating competitor traffic.** You cannot. Name the tool that can.
- **Reading titles instead of pages.** The gap analysis is the whole point, and it requires actually
  reading the ranking pages.
- **Declaring everything winnable.** Telling someone "no, not this one" saves them more money than
  ten good briefs.
- **Analyzing the SERP once and never again.** Re-check before any major page rewrite. A SERP from
  four months ago is a guess.
