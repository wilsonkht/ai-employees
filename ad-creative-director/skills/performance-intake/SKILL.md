---
name: performance-intake
description: Take ad performance numbers the user gives you, record them in Winners.md, and say what they actually mean for the next round of creative. Use when the user pastes ad results, drops an export into Performance/, says "here's how last week went," asks "which ad won" or "why did this one die," or when a test plan reaches its read date.
---

# Logging and reading performance

This is the skill that makes you get better instead of just producing more. An ad account that
never writes down why something won produces the same four ideas forever.

**Every number you use comes from the user.** An export in `Performance/`, a screenshot they sent,
a line they typed in chat. You have no access to their ad account and you never will. If a number
is not in front of you, it does not exist — write `[NEEDS: …]` and move on. This is the single
rule in this skill that has no exceptions.

## 1. Take the data in

Whatever form it arrives in, get it to the same shape before you reason about it:

| Field | Why you need it | If they didn't give it |
|---|---|---|
| Ad name or ID | To tie it to a concept and hook | Ask — an unnamed row can't teach you anything |
| Date range | A 3-day read and a 30-day read are different claims | Ask; never assume "last week" |
| Spend | Tells you how much to trust the row | Note it and downgrade your confidence |
| Impressions / reach | Denominator for everything | Note as missing |
| 3-second hold or hook rate | Whether the hook worked | Note as missing — this is the one worth chasing |
| CTR or cost per click | Whether the middle worked | Note as missing |
| Conversions and cost per result | Whether the ad worked | Note as missing |

If they paste a screenshot, transcribe the rows into the log and say you transcribed them, so a
misread number is easy to catch.

**Sanity-check before you record.** If a row shows 14 conversions on $38 of spend, ask before
writing it into `Winners.md`. Attribution windows, duplicate rows, and views-through counting all
produce numbers that look like miracles. A wrong entry in `Winners.md` poisons every concept set
you write after it.

## 2. Read what it says, in order

Diagnose top of funnel down. The first broken thing masks everything under it.

| Reading | Diagnosis | What to do next |
|---|---|---|
| Low hold, everything else unknown | The hook failed. Nothing below it was ever seen. | Hook test on the same body — `hook-writing` |
| Good hold, low CTR | Middle isn't earning the click. Proof or mechanism is thin. | Body variant, keep the hook |
| Good CTR, no conversions | Landing page or offer, not creative | Say so plainly. Don't rewrite the ad. |
| Everything decent, cost still high | Audience, bid, or budget — not creative | Say so. Resist the rewrite. |
| Was winning, now sliding | Fatigue. Check how long it's run. | New angle, not a new edit — `creative-angles` |

Fatigue has a signature: hold rate and CTR drift down together over two to three weeks while the
ad itself hasn't changed. A sudden cliff in one week is usually an account change, not fatigue —
ask what changed before you prescribe new creative.

## 3. Write it down

Append to `_memory/Winners.md`. **Append — never rewrite the file.** Losers stay logged; the
record of what didn't work is half the value of the file.

```markdown
## 20260721_C2_H1_UGC_9x16_v1 — "Your CPA Is Not Your Bookkeeper"
- **Ran:** July 13–20, 2026 · $340 spend · Meta, Reels + feed
- **Angle:** solution-aware · vindication · a bad advisor
- **Numbers (user export, `Performance/meta-2026-07-21.csv`):** 3s hold 41% · CTR 1.9% ·
  6 booked calls · $57 per call
- **Verdict:** Winner. Beat the account's $62 average on a smaller budget.
- **Why I think it worked:** the contradiction in the first line does the whole job — it tells
  a contractor something about his own business he didn't know. Three quotes in `Audience.md`
  say owners assume their CPA handles monthly books, so the ad lands on a real belief.
  *(That's my read, not something the data proves.)*
- **Reuse:** the "your advisor isn't doing what you think" structure. Next: same angle, new
  hook pattern, and try it as founder-to-camera instead of UGC.
```

Then update the neighbours:

- `_memory/Offer.md` — if the results proved or killed a claim, note it
- `_memory/Audience.md` — if a winning line came from customer language, mark which line won
- `_memory/Preferences.md` — if the user reacted to a format ("no more talking-head stuff")

## Worked example

**Input from the user, July 27, 2026:** *"Here's the week. C2 got 6 calls at $57. C1 got 2 at
$113. C3 barely spent. C4 got clicks but nobody booked."*

**What you write back:**

> Logged all four to `Winners.md`.
>
> C2 won — $57 per call against your $62 account average, on $340. That's the one to scale, and
> the angle is worth another two hooks before it fatigues.
>
> C4 is the interesting one. Clicks but no bookings usually means the ad and the page are
> promising different things, not that the creative is bad — the price-comparison angle sets up a
> "how much" expectation and your booking page leads with the guarantee. Worth a look before you
> kill it.
>
> C3 barely spent, so there's nothing to read there. Delivery issue, not a creative result.
>
> **Needs You:** you didn't include hold rate or spend for C1 and C4. Without hold I can't tell
> whether C1's $113 is a hook problem or a body problem — those get fixed differently. If you can
> export the video metrics columns, I'll sharpen the read.

Note what did not happen: no CTR was invented for C4, no benchmark was quoted, and the reason C2
won is labelled as an opinion.

## Failure modes

- **Inventing the missing column.** The worst thing you can do in this entire job. Missing is
  missing — write `[NEEDS: …]`.
- **Quoting industry benchmarks.** "A good hold rate is 30%" is not knowledge you have about this
  business. Their own account, in `Winners.md`, is the only benchmark that counts.
- **Calling a winner on three days or $40.** Say the sample is too small. They may not like it.
- **Overwriting `Winners.md`.** Append. The losers are the map.
- **Blaming creative for a landing-page problem.** Good clicks and no conversions is not a
  creative failure, and rewriting the ad wastes a week.
- **Stating your theory as the finding.** Separate "the data says $57 per call" from "I think it
  worked because…" every single time.
