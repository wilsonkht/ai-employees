---
name: on-page-audit
description: Audit a page or a whole site for on-page SEO problems — indexability, titles, headings, meta, thin content, intent mismatch, and internal links — and return a prioritized fix list. Use for /audit, or requests like "why isn't this page ranking," "review this URL," "check my titles," or "audit my site."
---

# Auditing a page

An audit is a fix list, not a report card. Every finding gets a severity, a reason, and the exact
replacement text where one applies. The user should be able to work top to bottom and stop when
they run out of time.

## 1. Get the actual page

You can only audit what you can see. In order of preference:

1. **A URL you can fetch** — use `WebFetch`, or hand the page to the `page-auditor` agent
2. **A saved HTML file in `Data/`** — ask them to use File → Save Page As, or View Source and paste
3. **A description from the user** — audit only what they told you, and say so in the report

If the page is built with JavaScript and the fetched HTML is nearly empty, stop and say so. You are
seeing what a naive crawler sees, which may not be what Google sees. Ask them to paste the rendered
source (right-click → Inspect → copy the `<html>` element) instead of guessing.

**Never report on something you couldn't see.** Page speed, Core Web Vitals, mobile rendering, and
crawl errors are not visible in HTML — name the tool instead (PageSpeed Insights, Search Console).

## 2. Run the checklist

| # | Check | What good looks like | Common failure |
|---|---|---|---|
| 1 | Indexability | No `noindex`, not blocked in robots.txt, canonical points to itself | A staging `noindex` shipped to production |
| 2 | Canonical | Self-referencing, absolute URL | Canonical points at the homepage, so the page never ranks |
| 3 | Title tag | 50–60 characters, target keyword near the front, reads like a human wrote it | Company name first, keyword missing, 80 chars and truncated |
| 4 | H1 | Exactly one, matches the page's promise | Zero H1s, or the logo is the H1 |
| 5 | Heading order | H2s under the H1, H3s under H2s, no skipped levels | H4 used because it looked smaller |
| 6 | Meta description | 140–160 characters, describes the page, gives a reason to click | Missing, duplicated across 40 pages, or keyword salad |
| 7 | URL | Short, readable, keyword present, no dates or IDs | `/p?id=4471` or `/2023/06/final-final-post-v2` |
| 8 | Intent match | Page type matches what ranks for the target keyword | A blog post targeting a "hire a ___" keyword |
| 9 | Depth | Covers what the ranking pages cover, plus something they don't | 300 words on a topic where page one averages 1,400 |
| 10 | Thin or duplicate | No near-identical pages (location pages are the usual culprit) | Twelve city pages with one word swapped |
| 11 | Cannibalization | One page per keyword and intent | Blog post and service page both targeting the same term |
| 12 | Internal links in | At least 2–3 relevant pages link here with descriptive anchors | Orphan page reachable only from the sitemap |
| 13 | Internal links out | Links to the next logical page and to the money page | Dead end |
| 14 | Images | Descriptive alt text, sane file names, not 4MB | `IMG_2213.jpeg`, alt text empty |
| 15 | Structured data | Correct type present (Article, LocalBusiness, FAQ, Product) | None, or marked up for content not on the page |
| 16 | Freshness | Dates accurate; "updated" means actually updated | A 2021 post claiming 2026 pricing |
| 17 | CTA | One clear next step matched to intent | An informational post with three pricing CTAs and no answer |

Checks 1 and 2 come first and they outrank everything. A page Google won't index has no other
problems worth discussing.

## 3. Assign severity

| Severity | Means | Examples |
|---|---|---|
| **Critical** | The page cannot rank, or is actively losing traffic it had | noindex, wrong canonical, cannibalization, intent mismatch |
| **Important** | Ranking is being held back and the fix is cheap | Missing keyword in title, no H1, thin section, no internal links in |
| **Polish** | Real but small | Alt text, meta description wording, image file names |

If everything is Important, you haven't prioritized. Most pages have one or two things that matter.

## 4. Write the report

```markdown
# Audit — /services/contractor-bookkeeping
Date: 2026-07-27 · Source: fetched live 2026-07-27 · Target keyword: bookkeeping for contractors

**Bottom line:** The page is indexable and reads well, but its title doesn't contain the keyword and
nothing on the site links to it. Two fixes, about twenty minutes.

## Critical
None.

## Important
1. **Title tag is missing the keyword.**
   Now: `Stonebridge Bookkeeping | Portland, OR` (38 chars)
   Change to: `Bookkeeping for Contractors in Portland | Stonebridge` (53 chars)
   Why: the target keyword doesn't appear in the title at all, and the title is the strongest
   on-page signal you control.

2. **The page is an orphan.** No page on the site links to it except the top nav
   (`_memory/Site.md`). Add contextual links from `/blog/contractor-chart-of-accounts` and
   `/blog/quickbooks-job-costing-contractors` using the anchor "bookkeeping for contractors."

3. **No pricing signal.** The three pages ranking above you all show a starting price or a range
   (Research/2026-07-27 - contractor bookkeeping SERP.md). You have neither. Add a "Starting at"
   line or a range, or expect the bounce.

## Polish
4. Meta description is 91 characters and generic. Rewrite to 150 and name the outcome.
5. Two of five images have empty alt attributes.

## Couldn't check
- Page speed and Core Web Vitals — run PageSpeed Insights on this URL.
- Whether this page is getting impressions — needs a Search Console export in `Data/`.

## Needs You
- `/services/bookkeeping-for-builders` looks like it targets the same intent as this page. If it
  does, one of them should redirect to the other. Which one do you want to keep?
```

## Site-wide audits

Same checklist, applied across the page list in `_memory/Site.md`. Report by pattern, not page by
page: "19 of 34 pages share the same meta description" is one finding, not nineteen. Then list the
five worst offenders and stop.

Always include these three site-level checks: duplicate titles, duplicate meta descriptions, and
orphan pages. They're the fastest wins on almost every small site.

## Failure modes

- **Auditing what you can't see.** No speed scores, no rendering claims, no crawl-budget theory from
  a single HTML file.
- **Padding the list.** Twenty findings where three matter trains the user to ignore all of them.
- **Rewriting the page.** You produce replacement lines they paste. You do not edit the live site,
  ever — that's a hard rule and the guard hook enforces it.
- **Ignoring intent.** The most common reason a technically perfect page doesn't rank is that it's
  the wrong type of page. Check #8 before you polish anything.
- **Character counts by eyeball.** Count them. A 62-character title gets cut off and the fix is free.
