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
| **Did they understand?** | Onboarding problem | Clarity: UI, feedback, tutorial `(see game-design-frameworks/polish.md → Onboarding Patterns)` |
| **Did they want to keep going?** | Core loop problem | Fun: mechanics, pacing, reward `(see game-design-frameworks → Core Loop Design)` |
| **Did they want to come back?** | Retention problem | Hook: progression, curiosity, mastery |

**Priority order:** Understanding → Engagement → Retention. Don't fix retention if players aren't engaged. Don't fix engagement if players are confused.

### Playtest Planning Checklist

- [ ] Name 3 specific people who will test
- [ ] Date for first playtest scheduled
- [ ] One specific question this playtest answers (e.g., "Is the jump mechanic intuitive?")
- [ ] Observation method chosen (watch silently, record screen, take notes)
- [ ] Pivot criteria defined ("If X happens, we change Y")

## Deep Dives

- `(see game-playtesting/methodology.md for Minimum Viable Playtest (MVPt), Observation vs Asking, Iteration Cadence, Pivot vs Persevere Decision)`
- `(see game-playtesting/sessions.md for RITE Method, Session Structure (4 phases), FFWWDD Framework, Sample Size Guidelines, Data-Driven Decisions)`

## See Also

- **game-scoping** — Post-MLP iteration phases `(see game-scoping → Post-MLP Iteration Phases)`
- **game-antipatterns** — Design in Isolation is the #1 anti-pattern playtesting prevents `(see game-antipatterns)`
- **game-design-frameworks** — Onboarding patterns for fixing "didn't understand" results `(see game-design-frameworks/polish.md)`
- **game-economy-design** — What to playtest for economy balance `(see game-economy-design)`
- **game-scenario-walkthrough** — Walkthrough as a testable artifact to compare against real play `(see game-scenario-walkthrough → The 5-Beat Structure)`
- **game-difficulty-design** — Testing for difficulty fairness, developer blind spot `(see game-difficulty-design)`
- **game-content-planning** — Content batching and playtest cadence `(see game-content-planning)`
- **game-plan-audit** — Playtest readiness audit and questionnaire frameworks `(see game-plan-audit)`
- **game-architecture-audit** — Code architecture audit for technical playtest blockers `(see game-architecture-audit)`
