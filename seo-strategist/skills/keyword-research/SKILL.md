---
name: keyword-research
description: Build and cluster a keyword list for a topic, classify search intent, and decide what page each cluster needs. Use for /keywords, or any request like "what should we write about," "find keywords for X," "is this keyword worth targeting," or when the user drops a keyword export into Data/.
---

# Keyword research and intent

The output of this skill is not a list of keywords. It's a short list of **pages worth building**,
each with a reason. A spreadsheet of 400 keywords helps nobody. Five clusters with an intent, a
page type, and a priority is a quarter of work.

## 1. Establish what data you actually have

Before anything else, look in `Data/` and read `_memory/Keywords.md`.

| What you have | What you can do |
|---|---|
| Search Console export | Real impressions, clicks, and average position **for their site only**. Best data they own. |
| Ahrefs / Semrush / Keyword Planner export | Volume and difficulty estimates for any keyword. |
| Nothing | Build the seed list and the clusters, mark every volume `unknown`, and tell them what to pull. |

**Never invent a search volume, difficulty score, or position.** If you have no export, say exactly
this and keep working:

> I don't have volume data for these. Two options: Google Search Console (free, tells you what
> you're already getting impressions for — Performance → Queries → Export) or a paid tool like
> Ahrefs or Semrush for volume on keywords you don't rank for yet. Drop the CSV in
> `~/Employees/seo-strategist/Data/` and I'll add the numbers. The clustering below doesn't change.

## 2. Build the seed set from the business, not from a tool

Read `_memory/Business.md`. Generate seeds across all six of these — most people only think of the
first one, which is why their blog reads like a brochure:

1. **What they sell** — the service or product, plus how customers say it, not how they say it
2. **The problem before the purchase** — what someone searches at 11pm before they know a solution exists
3. **Comparisons** — "X vs Y", "best X for Z", "X alternatives"
4. **Cost and process** — "how much does X cost", "how long does X take", "do I need X"
5. **Qualifiers** — by industry, by city, by size, by software, by regulation
6. **Their own words** — objections, phrases, and questions from sales calls, reviews, and support

## 3. Classify intent — this decides the page

Intent is the single highest-leverage judgment in this whole job. Get it wrong and the page can be
perfect and still never rank.

| Intent | Sounds like | Page type | The page must | Success looks like |
|---|---|---|---|---|
| Informational | "how to", "what is", "why does" | Guide, tutorial, explainer | Answer completely, fast, then link onward | Traffic and email signups, not sales |
| Commercial | "best", "vs", "alternatives", "review" | Comparison, listicle, buying guide | Compare honestly, including where they lose | Traffic that converts in weeks |
| Transactional | "near me", "hire", "buy", "pricing", "[service] company" | Service page, product page, location page | Prove it, price it, make contact obvious | Leads and sales |
| Navigational | brand names, "[brand] login" | Homepage, brand page | Nothing much — don't chase other brands' names | Skip unless it's their own brand |

Two rules that catch most mistakes:

- **When the words are ambiguous, the SERP decides.** If the top ten results for "job costing
  software" are all listicles, the intent is commercial and a product page will not rank there no
  matter how good it is. Use the `serp-analysis` skill.
- **Transactional keywords get a service page, never a blog post.** Blog posts about hiring a
  bookkeeper do not rank for "bookkeeper for contractors" and do not convert if they do.

## 4. Cluster

Group keywords that **the same page would satisfy**. The test: if someone searching A and someone
searching B would both be happy landing on the same page, that's one cluster and one brief.

- Same intent + same answer → one cluster
- Same words, different intent → different clusters (`quickbooks job costing` vs `quickbooks job costing setup service`)
- Name the cluster after its head term, and pick the head term the way a customer would say it
- One cluster maps to exactly one URL. Write that URL into `_memory/Keywords.md` so you never brief
  the same page twice

## 5. Prioritize

Score each cluster on three things, in this order:

1. **Revenue proximity** — how close is this searcher to buying? A transactional cluster with 40
   searches a month beats an informational one with 4,000 for most small businesses.
2. **Winnability** — can this site realistically rank? Check `_memory/Competitors.md` and the SERP.
   If page one is Forbes, Reddit, and three national brands, it's a no for now.
3. **Existing coverage** — do they already have a page for this? Updating a page that ranks #14 is
   faster and cheaper than a new post, every time.

## Worked example

Stonebridge Bookkeeping — bookkeeping for construction contractors, Portland OR
(`_memory/Business.md`). They asked: "what should we write about for job costing?"

Data available: `Data/gsc-export-2026-07-20.csv` (their Search Console, last 3 months). No Ahrefs.

```markdown
# Keyword research — job costing
Date: 2026-07-27 · Volume source: none · GSC source: Data/gsc-export-2026-07-20.csv

## Cluster 1 — job costing in QuickBooks  (informational)
Head: how to set up job costing in quickbooks for contractors
Also: quickbooks job costing tutorial, track job costs quickbooks desktop, qb items vs classes job costing
Volume: unknown · GSC: 412 impressions / 6 clicks / avg pos 18.4 for 3 related queries
Page: NEW guide, /blog/quickbooks-job-costing-contractors
Why: They already get impressions with no dedicated page — position 18 on a topic they know cold.
Priority: 1

## Cluster 2 — job costing services  (transactional)
Head: job costing services for contractors
Also: hire someone to set up job costing, construction job costing consultant
Volume: unknown, likely low · GSC: 22 impressions / 1 click
Page: UPDATE existing /services/ — no page targets this today
Why: Lowest volume, closest to money. One service page, done once.
Priority: 2

## Cluster 3 — job costing software comparison  (commercial)
Head: best job costing software for contractors
Volume: unknown · GSC: no impressions
Page: hold
Why: SERP is Capterra, G2, and software vendors. Unwinnable for a services site this year.
Priority: hold — revisit after the site has more topical depth

## Needs You
- Volume is unknown for all three. Pull Keyword Planner or Ahrefs for the head terms if you want
  the numbers before committing. My priority order wouldn't change.
```

Then append the three clusters to `_memory/Keywords.md` with status `planned` and their owning URL.

## Failure modes

- **Inventing numbers.** Never. `unknown` is a legitimate value and it's in the template for a reason.
- **Clustering by words instead of by intent.** "Bookkeeping software" and "bookkeeping service"
  share a word and share nothing else.
- **Handing back 200 keywords.** If the list is long, the work isn't finished. Cluster it.
- **Ignoring what they already rank for.** Positions 8–20 in Search Console are the cheapest wins
  on the whole site. Check those before proposing anything new.
- **Chasing volume.** For a business doing $40k a month, ten transactional searches that convert
  beat ten thousand that don't.
