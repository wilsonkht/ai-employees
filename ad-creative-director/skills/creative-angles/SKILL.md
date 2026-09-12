---
name: creative-angles
description: Generate a set of genuinely different ad angles for an offer — different emotion, different awareness level, different enemy — instead of variations on one idea. Use for /concepts, for "give me new ad ideas," "our creative is fatiguing," "we need something different," or any time the user needs concepts before scripts get written.
---

# Generating creative angles

An angle is the argument the ad makes. The hook is the sharp end of it. Most ad accounts die
because they run one angle in fifteen outfits and call it testing.

Your job here is to produce four to six concepts that could not be swapped for each other.

## 1. Load the inputs

Read in this order, always:

1. `_memory/Offer.md` — what's actually being sold, at what price, with what proof
2. `_memory/Audience.md` — who buys, in their own words, and what they're afraid of
3. `_memory/Winners.md` — what already worked, and which angles are already used up
4. `_memory/Preferences.md` — voice, hard nos, what they'll never say on camera
5. `Swipe/` — anything they've saved from competitors

If `Winners.md` shows an angle that's been running four-plus weeks, treat it as spent. Your job is
the *next* angle, not a nicer version of the one already fatiguing.

## 2. Set the three dials

Every angle is a position on three dials. Two angles that share all three dials are one angle.

| Dial | Options |
|---|---|
| **Awareness** | unaware · problem-aware · solution-aware · product-aware · most aware |
| **Emotion** | fear · frustration · relief · pride · belonging · greed · curiosity · vindication |
| **Enemy** | the status quo · a competitor category · a bad advisor · their own past decision · time · nobody (pure demonstration) |

Then pick an angle family to carry it:

| Family | The argument | Works best when |
|---|---|---|
| Problem–agitate | "This thing you're tolerating is costing you" | Problem-aware, high pain |
| Enemy / us-vs-them | "The way everyone does this is broken" | Crowded category |
| Identity | "People like you do it this way" | Strong tribe, weak differentiation |
| Myth-bust | "What you believe about X is wrong" | Solution-aware, lots of confusion |
| Mechanism | "Here's exactly how it works" | Skeptical buyers, real proof |
| Case study | "Here's what happened for one customer" | You have a documented result |
| Cost of inaction | "Here's what waiting costs" | Deferrable purchase |
| Objection-killer | "You think X — here's why that's not a problem" | Known sales objection |

## 3. Apply the distinctness test

Before a concept goes on the page, run it against every other concept in the set:

- **Swap test.** Can you put concept A's hook on concept B's body and have it still make sense? If
  yes, they're the same angle. Kill one.
- **Two-dial rule.** Every pair must differ on at least two of the three dials.
- **Objection test.** Each concept should defuse a *different* objection from `Offer.md`.

## 4. Score before you hand it over

Rate each surviving concept 1–5 and cut anything scoring under 3 on the first two rows.

| Criterion | What you're checking |
|---|---|
| Truth | Every claim in it is supported by `Offer.md` or `Winners.md`. No invented results. |
| Voice | It sounds like a customer sentence from `Audience.md`, not like marketing. |
| Shootable | They can film it this week with what they own — phone, screen recording, existing footage. |
| Freshness | Not an angle already logged in `Winners.md` as running or spent. |
| Bet | Would you spend your own $500 on it? Say which one you'd run first. |

## Worked example

**Business:** Ridgeline Books, done-for-you bookkeeping for HVAC and plumbing contractors.
$650/mo. Promise: books closed by the 10th or the month is free. `Winners.md` shows the
"Shoebox" UGC ad (problem-aware / frustration / status quo) has run since June 3 and its 3-second
hold has slid from 38% to 26%. That angle is spent.

Four concepts for the week of July 27, 2026:

| # | Concept | Awareness · Emotion · Enemy | Objection it kills |
|---|---|---|---|
| 1 | **The March Discovery** — owner finds out in July that March was never reconciled | problem-aware · fear · their own past decision | "My current setup is fine" |
| 2 | **Your CPA Is Not Your Bookkeeper** — the two jobs people conflate, and what falls through the gap | solution-aware · vindication · a bad advisor | "I already have a CPA" |
| 3 | **The 10th** — a countdown demo showing exactly what happens on days 1–10 of a close | product-aware · relief · time | "How do I know you're actually faster?" |
| 4 | **$650 vs. the Truck** — comparing the monthly cost to one service call's revenue | most aware · greed · the status quo | "It's too expensive right now" |

Every pair differs on at least two dials. Concept 2 is the one to run first — `Audience.md` has
three separate quotes where owners assume their CPA handles monthly books, which means the
objection is real and nobody in `Swipe/` is naming it. Concept 4 is the weakest bet; price
comparisons work but they only reach people who already want the thing.

## Format

For each concept: name, the one-sentence argument, the three dials, who it's for, the objection it
kills, the proof it leans on (with the source line), and the format it wants (UGC, founder to
camera, screen recording, static). Three or four hook options come from `hook-writing`, not here.

Write the set to `_memory/Log/Concepts-YYYY-MM-DD.md` before you report back. In chat, list the
concept names, one line each, plus which one you'd run first and why.

## Failure modes

- **The clone set.** Five ideas that all say "save time." Run the swap test; you'll catch it.
- **Angles with no proof.** If a concept needs a result the business doesn't have, mark it
  `[NEEDS PROOF]` rather than writing a number into it.
- **Writing hooks here.** Concepts first, in the user's hands, before anyone writes a line of copy.
- **Ignoring `Winners.md`.** Handing back an angle they ran in April is the fastest way to look
  like a stranger to their business.
- **Clever over clear.** If the concept needs a paragraph of explanation to land, it will not
  survive three seconds on a phone.
