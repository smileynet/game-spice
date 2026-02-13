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

<details><summary>RITE Method (Rapid Iterative Testing and Evaluation)</summary>

From Microsoft (Medlock et al., developed for game usability testing). The key insight: fix problems immediately after each participant, verify the fix with the next participant.

**Process:**
1. Test with participant 1 → identify critical problems
2. Fix those problems immediately (same day)
3. Test with participant 2 using the updated build → verify fixes, find new problems
4. Repeat until no changes needed
5. Run 3-6 verification participants on the stable build

**Rules:**
- Decision makers must observe directly — no secondhand reports
- Fix only "critical" and "serious" issues between participants (don't chase minor polish)
- Stop iterating when a participant encounters no new critical issues

**Typical result:** 3-4 iteration participants + 6 verification participants = robust usability. More efficient than testing 10 people then fixing everything at once.

**When to use RITE vs batch testing:**

| Method | Best For | Efficiency |
|--------|----------|-----------|
| **RITE** | Usability, onboarding, UI flows | High — fixes compound across participants |
| **Batch (5-8 at once)** | Core loop fun, difficulty, retention | Better — need pattern across multiple players |

</details>

<details><summary>Session Structure</summary>

### Four Phases

**1. Briefing (2-5 minutes)**
- Explain what you're testing (not how to play)
- "Play however feels natural. There are no wrong answers."
- Ask them to think aloud if comfortable
- Get consent for recording/notes

**2. Play Session (15-60 minutes)**
- **Observe silently** — don't help, don't hint, don't react
- Take timestamped notes on behavior, not interpretation
- Note: hesitations, confusion, delight, frustration, repeated actions
- Only intervene if the player is stuck for 2+ minutes on a non-test-relevant blocker

**3. Debrief (10-15 minutes)**
- **Questionnaire FIRST** — written responses before discussion (prevents interviewer influence)
- Then open-ended interview following up on observed moments
- "I noticed you paused at [moment] — what were you thinking?"
- Use FFWWDD questions for structured qualitative feedback

**4. Post-Session (15-30 minutes, team only)**
- Review notes while memory is fresh
- Compare observations across team members
- Identify top 3 issues to address
- Decide: fix now (RITE) or collect more data (batch)

</details>

<details><summary>FFWWDD Framework</summary>

Six essential open-ended questions — **F**rustrating, **F**avorite, **W**anted, **W**and, **D**oing, **D**escribe. Ask in this exact order during debrief. Overlap between answers reveals true priorities: when the same theme appears in 3+ answers from one player, it's their top concern. When it appears across 3+ players, it's a pattern worth acting on.

`(see game-plan-audit/questionnaires.md → FFWWDD Deep Dive for full question list, ordering rationale, and analysis tips)`

</details>

<details><summary>Sample Size Guidelines</summary>

| Method | Minimum | Ideal | Rationale |
|--------|---------|-------|-----------|
| **Usability testing** | 5 per round | 8-12 | 5 testers find ~80% of major usability issues |
| **RITE method** | 1-3 per iteration | 5-10 total | Iterate between participants |
| **Core loop validation** | 5 | 8-10 | Need pattern consistency across players |
| **Surveys/questionnaires** | 20-30 | 50-100+ | Statistical significance needs larger N |
| **Heatmaps/telemetry** | 30-50 | 100+ | Spatial patterns need volume |

**Counting rule:** 3 out of 5 testers independently encounter the same issue → pattern worth fixing. 1 out of 5 → note it, wait for more data.

**Diminishing returns:** Going from 5 to 10 testers adds ~15% more issue discovery. Going from 0 to 5 adds ~80%. Don't wait for "enough" testers — test with who you have.

</details>

<details><summary>Data-Driven Decisions</summary>

Combine observation with structured data for stronger conclusions.

**Qualitative** (observation, interviews, FFWWDD) answers "what's happening and why."
**Quantitative** (telemetry, questionnaire scores) answers "how much and how often."

Best results combine both: telemetry shows WHERE players struggle, observation shows WHY.

For detailed frameworks and templates:
- `(see game-plan-audit/questionnaires.md for validated instruments: GEQ, PENS, GUESS-18, SUS, FFWWDD)`
- `(see game-plan-audit/telemetry.md for data collection tiers, analysis methods, and evidence chains)`

</details>

## See Also

- **game-scoping** — Post-MLP iteration phases `(see game-scoping → Post-MLP Iteration Phases)`
- **game-antipatterns** — Design in Isolation is the #1 anti-pattern playtesting prevents `(see game-antipatterns → Design in Isolation)`
- **game-design-frameworks** — Onboarding patterns for fixing "didn't understand" results `(see game-design-frameworks → Onboarding Patterns)`
- **game-economy-design** — What to playtest for economy balance `(see game-economy-design → MLP Economy Checklist)`
- **game-scenario-walkthrough** — Walkthrough as a testable artifact to compare against real play `(see game-scenario-walkthrough → The 5-Beat Structure)`
- **game-difficulty-design** — Testing for difficulty fairness, developer blind spot `(see game-difficulty-design → Difficulty Anti-Patterns)`
- **game-content-planning** — Content batching and playtest cadence `(see game-content-planning → Content Sequencing in Development)`
- **game-plan-audit** — Playtest readiness audit and questionnaire frameworks `(see game-plan-audit → Playtest Readiness Audit)`
- **game-architecture-audit** — Code architecture audit for technical playtest blockers `(see game-architecture-audit → Game Architecture Health Scorecard)`
