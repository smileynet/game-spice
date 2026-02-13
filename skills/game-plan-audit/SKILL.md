---
name: game-plan-audit
description: Game-specific plan quality auditing. Use when auditing game project plans, checking game plan completeness, evaluating game MLP scope, reviewing GDD quality, assessing economy design, difficulty curves, playtest readiness, or running plan-audit on a game project. Covers core loop validation, scope complexity scoring, design document quality, economy red flags, difficulty assessment.
---

# Game Plan Audit

Audit game plans for completeness, scope realism, and design quality. Catches game-specific gaps that generic plan audits miss.

## Quick Reference

### Game Plan Completeness Scorecard

| # | Check | Severity | Cross-Reference |
|---|-------|----------|-----------------|
| 1 | Core loop defined in one sentence | Critical | `(see game-scoping → Core Loop Identification)` |
| 2 | Target aesthetics identified (1-2 from MDA) | Critical | `(see game-design-frameworks → MDA Framework)` |
| 3 | MLP has ≤3 features beyond core loop | Warning | `(see game-scoping → The 3-Feature Rule)` |
| 4 | Tracer bullet defined | Warning | `(see game-scoping → Tracer Bullet Methodology)` |
| 5 | Economy complexity decided | Warning | `(see game-economy-design → Economy Complexity Decision)` |
| 6 | Difficulty approach selected | Info | `(see game-difficulty-design → Difficulty Curve Patterns)` |
| 7 | Scenario walkthrough written | Info | `(see game-scenario-walkthrough → The 5-Beat Structure)` |
| 8 | Playtest plan exists (who, when, what) | Warning | `(see game-playtesting → Playtest Planning Checklist)` |
| 9 | Over-scope score ≤2 | Warning | `(see game-antipatterns → Is My Plan Over-Scoped?)` |
| 10 | Content scope estimated with production ratios | Info | `(see game-content-planning → Content Scope Estimation)` |

**Scoring:** 10/10 = ready to build. 7-9 = minor gaps, address before starting. 4-6 = return to scoping. <4 = needs fundamental design work.

### Core Loop Validation Tests

Four tests every core loop must pass:

| Test | Method | Pass Criteria |
|------|--------|---------------|
| **Sentence Test** | Describe in one sentence: "Player [verbs] to [goal], earning [reward] that enables [reinvestment]" | Active verbs, clear goal, explicit reinvestment |
| **Verb Chain Test** | List the verbs in sequence | 2-5 verbs that feed into each other. >5 = too complex. <2 = not a loop |
| **Reinvestment Test** | Output of one cycle meaningfully changes the next | Strong: Diablo (Kill→Loot→Equip→Kill stronger). Weak: Flappy Bird (score up, nothing changes) |
| **30-Second Test** | Time one micro-loop cycle | Under 60 seconds. If 5+ minutes, loop is too slow for rapid iteration |

**Core Loop Red Flags:**

| Red Flag | Symptom |
|----------|---------|
| No Reinvestment | Cycle output doesn't change next cycle |
| External Motivation Only | Story/obligation drives play, not mechanics |
| Complexity Explosion | 6+ verbs in the loop |
| Hidden Loop | Actual fun ≠ stated loop (players enjoy the metagame, not what you designed) |
| No Failure State | Can't lose or make bad decisions |
| Mandatory Grinding | Progression requires repetition without meaningful choice |

## GDD Quality Audit

### Design Document Antipatterns

| Antipattern | Symptom | Fix |
|-------------|---------|-----|
| **The Novel** | 100+ pages of prose | Max 5 pages for MLP. Decision tables, not paragraphs |
| **The Wishlist** | Describes v5.0, no MLP definition | Define MLP first, park the rest |
| **The Fog** | Adjectives without verbs ("engaging combat") | Every feature needs concrete player verbs |
| **The Fossil** | Written once, never updated | Living doc, date-stamp sections |
| **The Silo** | Only designers can read it | Cross-discipline sections with implementation notes |
| **The Clone** | "Like X but..." without understanding WHY X works | Identify specific mechanics/dynamics, not the brand |

### Actionability Test

Score each item 1-5. Total ≥28 = actionable. 20-27 = needs work. <20 = rewrite.

| # | Test | What to Check |
|---|------|---------------|
| 1 | **Verb Test** | Does every feature description contain player verbs? |
| 2 | **Prototype Test** | Could you build a prototype from this description alone? |
| 3 | **Decision Test** | Does it contain clear decisions (not "we'll figure it out later")? |
| 4 | **Feedback Test** | Are player feedback loops described (action → response)? |
| 5 | **Scope Test** | Is there a clear MLP boundary? |
| 6 | **Cut Test** | Are deferred ideas explicitly listed? |
| 7 | **Pillar Test** | Would the design pillars cause you to reject some plausible features? |

## MLP Scope Audit

### Scope Complexity Scoring Matrix

| Factor | 1 (Low) | 2 (Medium) | 3 (High) |
|--------|---------|------------|----------|
| System count | ≤3 systems | 4-6 | 7+ |
| Content volume | 1 level, 2-3 enemies | 3-5 levels, 5-10 enemies | 10+ levels |
| Multiplayer | None | Local co-op | Online |
| Procgen | None | Simple (rooms) | Complex (terrain, narrative) |
| Narrative | Minimal/emergent | Linear story | Branching |
| Platforms | 1 platform | 2 | 3+ |
| Art style | Programmer art / pixel | Stylized | Realistic |
| Audio | Minimal SFX | Music + SFX | Voice acting |
| Save complexity | None/auto | Manual saves | Cloud + cross-platform |
| AI opponents | None / scripted | Basic FSM | Planning / learning |

**Score 10-15:** Solo-dev feasible. **16-22:** Small team. **23-30:** Reconsider scope.

<details><summary>Genre-Specific Scope Traps</summary>

| Genre | Common Trap | Why It Kills Scope |
|-------|-------------|-------------------|
| **RPG** | Branching dialogue, open worlds, item combinatorics | Content grows exponentially with choices |
| **Roguelike** | "One more system" syndrome, procgen complexity | Each system multiplies interaction surface |
| **Platformer** | Level count ambition ("just 50 more levels") | Each level needs design, testing, polish |
| **Strategy** | AI opponents, complex UI | AI is its own project; UI is 50% of work |
| **Narrative** | Voice acting, branching consequences | Every branch doubles content cost |

</details>

<details><summary>Economy/Balance Design Audit</summary>

Using Daniel Cook's Value Chains methodology. Every resource must have:

| Element | Question |
|---------|----------|
| **Source** | Where does the resource come from? |
| **Sink** | Where does it leave the system? |
| **Flow Rate** | How fast does it accumulate? |
| **Lifetime** | How long does a unit last before being spent? |
| **Player Decision** | What choice does the player make with it? |
| **Interconnection** | How does it connect to other resources? |

**10 Economy Red Flags:**

1. **No Sinks** — Resources accumulate forever, economy inflates
2. **Infinite Accumulation** — No cap or diminishing returns
3. **Dead-End Resources** — Resource has nowhere useful to go
4. **Obvious Spending** — No real decision, one clearly best option
5. **Unconnected Systems** — Resources exist in isolation
6. **Unchecked Positive Feedback** — Rich get richer with no catch-up
7. **Currency Without Choice** — Only one thing to buy
8. **Single Optimal Path** — Spreadsheet-solvable economy
9. **Invisible Economy** — Player can't see resource flows
10. **Complexity Mismatch** — Economy sophistication doesn't match genre (platformer with stock market)

</details>

<details><summary>Difficulty Curve Assessment</summary>

### Curve Shapes

| Shape | Description | Best For |
|-------|-------------|----------|
| **Staircase** (recommended) | Alternating challenge and rest | Most games — allows mastery consolidation |
| **Ramp** | Linear increase | Short experiences, arcade |
| **Wave** | Oscillating intensity | Story-driven, pacing-focused |
| **Cliff** (antipattern) | Sudden unwarned spike | Never — causes ragequits |
| **Plateau** (antipattern) | Stops escalating | Never — causes boredom |

### Difficulty Antipatterns

| Antipattern | Description |
|-------------|-------------|
| **Fake Difficulty** | Challenge from bad controls/camera, not game design |
| **Number Inflation** | Enemies just get more HP, no new behaviors |
| **Cliff Difficulty** | Sudden spike with no warning or ramp |
| **Gotcha Difficulty** | Must die to learn (trial-and-error as core design) |
| **Grind Gates** | Progress blocked by repetition, not skill |

### Skill Floor/Ceiling Matrix

| | Low Ceiling | High Ceiling |
|---|---|---|
| **Low Floor** | Casual (mobile puzzle) | Accessible depth (Smash Bros) |
| **High Floor** | Frustrating (avoid) | Hardcore niche (fighting games) |

Match your audience: broad appeal needs low floor. Depth needs high ceiling. Both = best.

</details>

<details><summary>Playtest Readiness Audit</summary>

Before building, verify the plan includes:

- [ ] Testers named (3+ specific people)
- [ ] First playtest date scheduled
- [ ] Test questions defined (what this playtest answers)
- [ ] Observation method chosen (watch, record, notes)
- [ ] Pivot criteria defined ("If X happens, we change Y")
- [ ] Questionnaire selected for structured feedback

`(see game-plan-audit/questionnaires.md for validated frameworks and templates)`

</details>

<details><summary>Data Strategy Audit</summary>

Before building, verify the plan accounts for:

- [ ] Telemetry events defined (what to measure)
- [ ] Collection method chosen (manual, CSV, SDK)
- [ ] Analysis approach planned (qualitative, quantitative, or both)
- [ ] Before/after measurement defined for changes

`(see game-plan-audit/telemetry.md for collection and analysis methods)`

</details>

## Decision Table: Is This Plan Ready to Build?

| # | Question | If No → |
|---|----------|---------|
| 1 | Can you state the core loop in one sentence? | **STOP** — Define the core loop first |
| 2 | Does the core loop pass the Reinvestment Test? | **STOP** — Loop isn't a loop, it's linear |
| 3 | Is scope complexity score ≤15 for solo dev? | **STOP** — Cut scope until feasible |
| 4 | Does the GDD pass the Actionability Test (≥20)? | **STOP** — Rewrite vague sections |
| 5 | Is a playtest planned within the first 2 weeks? | **STOP** — Schedule a test before building |

All five "Yes" → **READY TO BUILD.** Start with the tracer bullet.

## Checklists

### Plan Audit Checklist

- [ ] Completeness Scorecard ≥7/10
- [ ] Core loop passes all 4 validation tests
- [ ] No core loop red flags present
- [ ] GDD has none of the 6 antipatterns
- [ ] Actionability Test score ≥20
- [ ] Scope Complexity score appropriate for team size
- [ ] No genre-specific scope traps triggered
- [ ] Economy design has sources, sinks, and player decisions (if applicable)
- [ ] Difficulty approach matches target audience
- [ ] Playtest plan is concrete (who, when, what)
- [ ] Data collection strategy exists

## See Also

- **game-scoping** — MLP process and cutting heuristics that this audit validates `(see game-scoping → Scope Management)`
- **game-antipatterns** — Anti-pattern detection complements this comprehensive audit `(see game-antipatterns → Top 10 Anti-Patterns)`
- **game-design-frameworks** — MDA framework for aesthetic validation `(see game-design-frameworks → MDA Framework)`
- **game-economy-design** — Detailed economy design guidance `(see game-economy-design → Economy Complexity Decision)`
- **game-difficulty-design** — Difficulty curves and accessibility `(see game-difficulty-design → Difficulty Curve Patterns)`
- **game-playtesting** — Playtest methodology and iteration `(see game-playtesting → Playtest Planning Checklist)`
- **game-architecture-audit** — Code architecture audit (companion to plan audit) `(see game-architecture-audit → Game Architecture Health Scorecard)`
