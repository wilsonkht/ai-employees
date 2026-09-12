---
name: creative-testing
description: Build a structured creative testing plan — what to test, in what order, at what budget, for how long, and the exact rule for calling a winner. Use for /testplan, "how should I test these," "what do I run next week," or when someone is about to launch several ads at once and needs the test to actually teach them something.
---

# Building a testing plan

Most small accounts don't have a creative problem, they have a testing problem: five ads live at
once, three variables changed, and nothing learned. A plan's job is to make the result readable.

You are planning the test. You never launch it. The plan is a document the user takes to their ads
manager themselves.

## 1. Test in this order

Bigger variables first. There's no point optimizing a CTA on a concept that was never going to work.

| Level | You're asking | Change between variants |
|---|---|---|
| 1. Angle | Which argument does this audience respond to? | The whole concept |
| 2. Hook | Which opening earns the next 3 seconds? | First 3s only — body identical |
| 3. Format | Does UGC beat founder-to-camera here? | Presentation, same script |
| 4. Body | Does the proof block or the mechanism carry more weight? | One middle section |
| 5. CTA / offer framing | Which ask converts? | Final 5 seconds only |

Never skip a level to test a smaller one. If nothing at level 1 is working, level 5 is noise.

## 2. One variable, honestly

"Same body" means the same body. Same footage, same length, same music, same captions. If a hook
test also changes the edit, the result tells you nothing and — worse — the user will believe it.

Name every asset so the result is self-describing:

```
20260727_C2_H1_UGC_9x16_v1
   date    concept  hook  format  ratio  version
```

## 3. Budget and duration

You need three numbers from the user. **Never estimate them, never use an industry average, and
never carry over a number from another business.**

| Input | Where it comes from |
|---|---|
| Daily budget available | The user |
| Their current CPA or CPL | `Performance/` or the user |
| What they consider an acceptable CPA | The user |

Then the plan states plainly: how many variants, what each gets per day, how many days before
anyone looks, and the number of results per variant that would make the read trustworthy. If the
budget can't produce enough conversions per variant to tell them apart, **say that**, and either
cut the number of variants or move the decision metric earlier in the funnel (3-second hold and
cost per click read much faster than cost per sale).

If any of the three numbers is missing, write `[NEEDS: your current cost per lead]` in the plan and
keep going. Do not fill it in.

## 4. Decision rules, written before launch

The rule goes in the plan *before* anything runs, so nobody negotiates with the data on Friday.

| Signal | What it usually points at |
|---|---|
| Low 3-second hold | Hook problem. Body is irrelevant until this is fixed. |
| Good hold, low click | The middle isn't earning the click — proof or mechanism is weak. |
| Good click, no conversion | Landing page or offer mismatch, not a creative problem. |
| Good everything, high cost | Audience or bid, not creative. Don't rewrite the ad. |

State the kill rule and the scale rule in the user's own numbers, e.g. "kill any variant past 2×
target CPA with zero conversions; scale the winner only after it clears the target across at least
three days."

## Worked example

**Ridgeline Books.** User-provided: $100/day available for testing, current account cost per
booked call $62, acceptable ceiling $85 (from `Performance/meta-2026-07-24.csv` and confirmed in
conversation on July 26).

**Test 1 — Angle test, week of July 27**

| Variant | Concept | Asset name | Budget/day |
|---|---|---|---|
| A | The March Discovery | 20260727_C1_H1_UGC_9x16_v1 | $25 |
| B | Your CPA Is Not Your Bookkeeper | 20260727_C2_H1_UGC_9x16_v1 | $25 |
| C | The 10th (demo) | 20260727_C3_H1_SCR_9x16_v1 | $25 |
| D | $650 vs. the Truck | 20260727_C4_H1_UGC_9x16_v1 | $25 |

- **Constant:** same audience, same placement, same landing page, same CTA. Only the concept moves.
- **Run:** 5 days minimum, no edits, no pausing on day 2 because one looks bad in the morning.
- **Read at day 5:** 3-second hold and cost per booked call. At $25/day for 5 days that's $125 per
  variant — roughly two booked calls each at the current $62. That is not enough to rank D against
  C on conversions, so the primary read is hold rate and cost per click, with cost per call as a
  tiebreaker only.
- **Kill:** any variant over $170 (2× ceiling) with zero calls.
- **Next:** the top concept goes into Test 2, a four-hook test on the same body, at the same
  budget split.

**Needs You:** the July performance export stops on the 24th. If there's newer data, drop it in
`Performance/` and the read on Test 1 gets sharper.

## Where it goes

Write to `_memory/Log/Testplan-YYYY-MM-DD.md`. When results come back, don't edit the plan — log
them through `performance-intake` so the record of what you predicted stays intact.

## Failure modes

- **Too many variants for the money.** Eight ads on $50/day is eight ads with no data. Cut to
  three or four.
- **Calling it early.** Two days is not a result. Say so, even when they're excited.
- **Reading conversions on a budget that can't produce them.** Move up the funnel and say why.
- **Testing a hook against a different edit.** The most common invisible mistake in small accounts.
- **Inventing benchmarks.** "Good CTR is 2%" is not knowledge you have about this business. Their
  own account is the only benchmark that matters, and it lives in `Winners.md` and `Performance/`.
