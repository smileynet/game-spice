---
name: game-playtesting
description: Playtesting methodology and iteration planning for games. Use when planning playtests, defining test criteria, setting up feedback loops, deciding when to pivot or persevere, or structuring build-test-learn cycles. Covers observation techniques, minimum viable playtests, iteration cadence, pivot decisions.
---

# Playtesting & Iteration

Test early, test often. No design decision survives first contact with a playtester.

## Quick Reference

### Playtest Type Selection

| Type | Tester | What It Validates | When to Use |
|---|---|---|---|
| **Self-test** | You | Basic functionality, obvious breaks | Every build |
| **Friend test** | Someone who knows you | Core loop fun, clarity of mechanics | After tracer bullet works |
| **Stranger test** | Someone with no context | Onboarding, first impression, intuitiveness | After friend test passes |
| **Group test** | 3-5 strangers simultaneously | Consistency, edge cases, varied play styles | Before calling MLP "done" |

**Rule:** Self-testing finds bugs. Friend-testing finds confusion. Stranger-testing finds the truth.

### The 3-Question Framework

After every playtest, evaluate these three questions:

| Question | If No → | Fix Category |
|----------|---------|-------------|
| **Did they understand?** | Onboarding problem | Clarity: UI, feedback, tutorial `(see game-design-frameworks → Onboarding Patterns)` |
| **Did they want to keep going?** | Core loop problem | Fun: mechanics, pacing, reward `(see game-design-frameworks → Core Loop Design)` |
| **Did they want to come back?** | Retention problem | Hook: progression, curiosity, mastery |

**Priority order:** Understanding → Engagement → Retention. Don't fix retention if players aren't engaged. Don't fix engagement if players are confused.

### Playtest Planning Checklist

- [ ] Name 3 specific people who will test
- [ ] Date for first playtest scheduled
- [ ] One specific question this playtest answers (e.g., "Is the jump mechanic intuitive?")
- [ ] Observation method chosen (watch silently, record screen, take notes)
- [ ] Pivot criteria defined ("If X happens, we change Y")

## Methodology

<details><summary>Minimum Viable Playtest (MVPt)</summary>

The smallest build that can answer "is this fun?"

**Requirements:**
- Core loop completes one full cycle (action → reward → reinvestment)
- Player can fail and try again
- Programmer art is fine — polish is irrelevant
- No menus, saves, or settings needed
- Runs for at least 5 minutes without crashing

**Timeline test:** If you can't produce an MVPt within one week of starting development, your scope is too large `(see game-scoping → The 30% Rule)`.

**What an MVPt is NOT:**
- Not a demo (it's an experiment)
- Not polished (ugly is fine)
- Not feature-complete (one path only)
- Not for showing off (it's for learning)

</details>

<details><summary>Observation vs Asking</summary>

**What players DO is more reliable than what they SAY.**

| Observe | Don't Ask |
|---------|-----------|
| Where they get stuck | "Was it confusing?" |
| What they skip or ignore | "Did you notice the tutorial?" |
| When they lean forward (engaged) | "Was it fun?" |
| When they check their phone (bored) | "Were you bored?" |
| What they try to do that isn't possible | "What features do you want?" |

**Observation checklist during playtest:**
- [ ] Where did they hesitate or pause? (confusion signal)
- [ ] What did they try that didn't work? (expectation mismatch)
- [ ] When did they smile or react? (delight signal)
- [ ] When did they disengage? (boredom/frustration signal)
- [ ] Did they complete the core loop without prompting?

**After the playtest, ask open-ended questions:**
- "What were you trying to do when [observed moment]?"
- "Walk me through what you were thinking during [specific section]"
- "What would you do next if you kept playing?"

**Never ask:** "Was it fun?" "Did you like it?" "What should I change?" — these produce polite lies, not useful data.

</details>

<details><summary>Iteration Cadence</summary>

**Build → Test → Learn cycle:**

```
┌──────────┐     ┌──────────┐     ┌──────────┐
│  BUILD   │────→│   TEST   │────→│  LEARN   │
│ (1-3 days)│    │ (1 session)│   │ (same day)│
└──────────┘     └──────────┘     └────┬─────┘
     ↑                                  │
     └──────────────────────────────────┘
```

**Cadence targets:**
- **MLP phase:** Test every 3-5 days minimum
- **Fun polish phase:** Test after every significant change
- **Content phase:** Test each content batch before making more

**Red flags for cadence:**
- More than 2 weeks since last playtest → testing too rarely
- Testing every day → not enough change between tests to learn
- Only testing when "it's ready" → it's never ready, test anyway

</details>

<details><summary>Pivot vs Persevere Decision</summary>

After playtest results, decide what to do:

| Signal | Diagnosis | Action |
|--------|-----------|--------|
| Core mechanic isn't fun after 3+ tests | Core loop failure | **Pivot** — change the core mechanic |
| Fun in short bursts, boring over time | Pacing/variety problem | **Iterate** — add variation, adjust pacing |
| Fun when explained, confusing without help | Onboarding problem | **Iterate** — improve teaching, UI, feedback |
| Different testers have wildly different experiences | Inconsistency problem | **Iterate** — identify and fix variance sources |
| Tester engaged but frustrated by specific part | Difficulty/balance problem | **Iterate** — adjust that specific area |
| "I don't get why I'm doing this" | Motivation problem | **Iterate** — clarify goals, add feedback |

**Pivot criteria (define BEFORE testing):**
- "If 3 out of 5 testers don't complete the core loop, we change [specific thing]"
- "If average play session is under 3 minutes, we rethink [specific mechanic]"
- "If no tester voluntarily starts a second round, the loop isn't hooking"

**When in doubt:** More testing, not more building. One more playtest costs an hour. One more feature costs a week.

</details>

## See Also

- **game-scoping** — Post-MLP iteration phases `(see game-scoping → Post-MLP Iteration Phases)`
- **game-antipatterns** — Design in Isolation is the #1 anti-pattern playtesting prevents `(see game-antipatterns → Design in Isolation)`
- **game-design-frameworks** — Onboarding patterns for fixing "didn't understand" results `(see game-design-frameworks → Onboarding Patterns)`
- **game-economy-design** — What to playtest for economy balance `(see game-economy-design → MLP Economy Checklist)`
- **game-scenario-walkthrough** — Walkthrough as a testable artifact to compare against real play
