---
description: Generate a Game Design Document and Technical Specification from simulation data
argument-hint:
allowed-tools: Read, Write, Glob, Grep, AskUserQuestion, Skill
---

## Summary

**Output generation — transform simulation data into a GDD and tech spec.** Part of the session lifecycle: start → brainstorm → simulate → **build-plan**.

**Arguments:** None (operates on the active session from `/game:start`)

**Output:** `gdd.md`, `tech-spec.md` in `.game-design/<slug>/output/`, updated `state.yaml`.

**CRITICAL:** Populate documents from session data only. Flag gaps with placeholders rather than inventing content the simulation did not explore. Every section must trace back to concept.yaml, decisions.log, turn files, or wireframes.

---

## Process

### Step 1: Validate Session Readiness

Find the active session and confirm it's in the right phase.

```
Glob(pattern=".game-design/sessions.yaml")
```

**If `.game-design/sessions.yaml` does not exist:**

```
NO ACTIVE SESSION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

No game design sessions found. Start one first.

Run: /game:start
```

**Stop here.**

**If `.game-design/sessions.yaml` exists:**

```
Read(file_path=".game-design/sessions.yaml")
```

Select the most recently updated session. Load its state:

```
Read(file_path=".game-design/<slug>/state.yaml")
```

**If the session phase is not `build-plan`:**

```
PHASE MISMATCH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<title>" is in the <phase> phase, not build-plan.

To continue this session: /game:<phase>
To start a new session: /game:start
```

**Stop here.**

**Check coverage meets minimum criteria:**

```
Read(file_path=".game-design/<slug>/simulation/coverage.yaml")
```

Check the `transition.minimum` criteria: all beats must have confidence at or above `transition.minimum.beats_threshold` (default `0.3`, i.e. at least `partial`).

**If minimum coverage is NOT met:**

Identify which beats are below threshold and warn the user:

```
COVERAGE WARNING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<title>" has insufficient simulation coverage.

Beats below minimum:
  ○ <beat name>: uncovered (confidence <value>)
  ○ <beat name>: uncovered (confidence <value>)

The generated plan will have gaps in these areas. Sections based on
uncovered beats will contain placeholders instead of design decisions.
```

```
AskUserQuestion(questions=[{
  question: "Continue generating the plan with gaps, or return to simulation?",
  header: "Coverage",
  options: [
    {label: "Continue anyway", description: "Generate plan with placeholders for uncovered areas"},
    {label: "Return to simulation", description: "Go back and cover more beats first (/game:simulate)"}
  ],
  multiSelect: false
}])
```

**If "Return to simulation":**

Revert the phase in both files:

```
Read(file_path=".game-design/<slug>/state.yaml")
```

Update `phase` to `simulate` and `updated` to today's date. Write back:

```
Write(file_path=".game-design/<slug>/state.yaml", content=<updated state>)
```

```
Read(file_path=".game-design/sessions.yaml")
```

Update the matching entry's `phase` to `simulate` and `updated` to today's date. Write back:

```
Write(file_path=".game-design/sessions.yaml", content=<updated index>)
```

Then chain to simulate:

```
Skill(skill="game:simulate")
```

**Stop here** — simulate takes over.

**If "Continue anyway":** Proceed to Step 2.

**If minimum coverage IS met:** Proceed to Step 2 silently.

### Step 2: Load All Session Data

Load all session data in parallel:

```
Read(file_path=".game-design/<slug>/concept.yaml")
Read(file_path=".game-design/<slug>/decisions.log")
Read(file_path=".game-design/<slug>/brainstorm.md")
Read(file_path=".game-design/<slug>/simulation/coverage.yaml")
Read(file_path=".game-design/<slug>/simulation/legend.yaml")
Read(file_path=".game-design/<slug>/simulation/game-state.yaml")
```

```
Glob(pattern=".game-design/<slug>/simulation/turns/turn-*.md")
Glob(pattern=".game-design/<slug>/simulation/wireframes/wf-*.txt")
```

For each file returned by the Glob calls above, read it:

```
Read(file_path=<each turn file path>)
Read(file_path=<each wireframe file path>)
```

Load the templates:

```
Read(file_path="templates/gdd.md")
Read(file_path="templates/tech-spec.md")
```

Load skill references for enrichment:

```
Read(file_path="skills/scoping/SKILL.md")
Read(file_path="skills/plan-audit/SKILL.md")
```

Display loading status:

```
BUILD PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session: <title>
Genre: <concept.genre> (<concept.subgenre>)
Core loop: <concept.core_loop>

Data loaded:
  Turns: <count>
  Wireframes: <count>
  Decisions: <count> (<user>/<suggested>/<inferred>)
  Coverage: <beats_covered>/<beats_total> beats covered

Generating plan...
```

### Step 3: Generate GDD

Populate the GDD template (`templates/gdd.md`) using the loaded session data. Map simulation data to each GDD section:

**3a: Design Pillars**

Derive 2-4 design pillars from:
- `brainstorm.md` → Aesthetics and MDA mapping
- `decisions.log` → recurring themes across decision categories
- `concept.yaml` → aesthetics list

Each pillar: bold name + one-sentence description of what it means for design decisions.

**3b: Success Criteria**

Define measurable criteria from:
- The core loop validation ("Is it fun?")
- Simulation decisions about what "done" looks like
- Observable player behavior targets

**3c: Game Overview**

- **Concept**: from `concept.yaml → pitch`
- **Audience**: from `concept.yaml → scope`, simulation decisions about target players
- **Platform**: from `concept.yaml → platform, input_method`
- **Core Loop**: from `concept.yaml → core_loop`, validated format from brainstorm

**3d: Mechanics**

Parse `decisions.log` for decisions in the `mechanic` category. Cross-reference with `concept.yaml → mechanics` and simulation turns.

- **Core Mechanics**: mechanics essential to the core loop, with references to simulation turns that explored them
- **Supporting Mechanics (MLP)**: up to 3 amplifier features (per the 3-Feature Rule from scoping)
- **Deferred Mechanics**: mechanics identified but deferred beyond MLP, with reasons

**3e: Game World**

From simulation turns and wireframes:
- **Setting**: world description, narrative context, tone
- **Areas/Environments**: distinct areas encountered during simulation, with world structure type
- **Visual Style**: art direction from wireframes and brainstorm aesthetics

**3f: UI/UX**

From wireframe files and simulation turns:
- **HUD Layout**: primary gameplay HUD wireframe with legend (from legend.yaml)
- **Screen Flow**: screen-to-screen navigation based on simulation turn progression
- **Input Mapping**: from concept.yaml and simulation decisions about input
- **Additional Wireframes**: all wireframes from `.game-design/<slug>/simulation/wireframes/`, organized by screen/state

**3g: Economy & Progression**

Include this section only if simulation decisions touch economy or progression topics. From decisions with category `progression` or related `mechanic` decisions:
- **Resources**: source/sink/decision table
- **Progression**: how the player advances

Omit this section entirely if no economy-related decisions exist.

**3h: Content Requirements**

From simulation coverage and content-planning production ratios:
- Content needed at each quality level (L0 tracer → L1 MLP → L2 alpha → L3 release)
- Derived from what the simulation explored and what remains

**3i: Appendix**

- **Decision Log Summary**: group decisions by category, include origin. Reference full log.
- **Coverage Report**: from coverage.yaml — beat and system status/confidence/turns
- **Wireframe Index**: all wireframes with turn references and descriptions

### Step 4: Assumptions to Validate

Scan `decisions.log` for all decisions with origin `suggested` or `inferred`. Collect them into a dedicated GDD section.

Insert this section after the main content sections and before the Appendix:

```markdown
## Assumptions to Validate

<!-- Decisions made by the AI (suggested or inferred) during brainstorm and simulation.
     These should be validated during playtesting — the designer did not explicitly confirm them. -->

**<count> assumptions flagged** (<suggested_count> suggested, <inferred_count> inferred)

### High Priority (Mechanic Assumptions)

<!-- Assumptions about how game systems work — incorrect assumptions here break gameplay -->

| ID | Decision | Origin | Source Turn |
|----|----------|--------|-------------|
| <id> | <decision> | <origin> | Turn <NNN> |

### Medium Priority (Feedback & Progression)

<!-- Assumptions about what the player sees/feels — wrong assumptions hurt experience -->

| ID | Decision | Origin | Source Turn |
|----|----------|--------|-------------|
| <id> | <decision> | <origin> | Turn <NNN> |

### Low Priority (Content & Scope)

<!-- Assumptions about content details — easy to change later -->

| ID | Decision | Origin | Source Turn |
|----|----------|--------|-------------|
| <id> | <decision> | <origin> | Turn <NNN> |
```

**Priority mapping:**
- High: decisions with category `mechanic`
- Medium: decisions with category `feedback` or `progression`
- Low: decisions with category `content` or `scope`

**Source Turn attribution:** For simulation-phase decisions (id format `sim-NNN`), cross-reference with turn files to find which turn recorded the decision. For brainstorm-phase decisions (numeric id), show "Brainstorm" in the Source Turn column instead of a turn number.

If a priority level has zero assumptions, omit that subsection.

### Step 5: Generate Tech Spec

Populate the tech spec template (`templates/tech-spec.md`) using the GDD output and simulation data:

**5a: Architecture Overview**

- **Engine/Framework**: from `concept.yaml → scope.engine` with rationale derived from scope target, team size, platform, and genre
- **Module Decomposition**: derive module structure from the GDD mechanics. Each core and supporting mechanic maps to a module.

**5b: Implementation Phases**

Follow the tracer bullet → core loop → content → polish progression from scoping:

- **Phase 0: Tracer Bullet** — first end-to-end vertical slice through all 5 layers (input → core mechanic → game state → feedback → consequence). Use `scoping/tracer-bullets.md` for the 5-Layer Slice structure.
- **Phase 1: Core Loop (MLP)** — complete core loop + up to 3 supporting features from the GDD. Goal: validate fun.
- **Phase 2: Content Alpha** — add variety (enemies, levels, items). Derived from GDD Content Requirements L2 targets.
- **Phase 3: Systems & Polish** — progression, meta-game, saves, UI polish. Derived from GDD Economy & Progression and deferred mechanics.

**5c: Per-Phase Task Breakdown**

Create detailed tasks for each phase. Each task is a vertical slice (player-facing outcome), not a horizontal system. Tasks follow the verb test: "Player [verb]s..."

Include estimates, dependencies between tasks, and exit criteria.

**5d: Technical Decisions**

From simulation decisions in the technical category and engine constraints:
- Rendering approach
- State management pattern
- Input handling
- Audio approach
- Save/load strategy

**5e: Risk Register**

From:
- Brainstorm open questions
- Simulation coverage gaps
- Scope analysis
- The Assumptions to Validate section

Include:
- Technical risks with likelihood, impact, and mitigation plans
- Design risks (assumptions that could invalidate the plan)

### Step 6: Quality Review

Reference the plan-audit skill to validate completeness of the generated documents.

Run the **Plan Completeness Scorecard** (10 checks):

1. Core loop defined in one sentence
2. Target aesthetics identified (1-2 from MDA)
3. MLP has ≤3 features beyond core loop
4. Tracer bullet defined
5. Economy complexity decided
6. Difficulty approach selected
7. Scenario walkthrough written (simulation acts as this)
8. Playtest plan exists
9. Over-scope score ≤2
10. Content scope estimated with production ratios

Run the **Core Loop Validation Tests**:
- Sentence Test
- Verb Chain Test
- Reinvestment Test
- 30-Second Test

Run the **GDD Actionability Test** (7 checks, score 1-5 each):
1. Verb Test
2. Prototype Test
3. Decision Test
4. Feedback Test
5. Scope Test
6. Cut Test
7. Pillar Test

**Present quality results:**

```
QUALITY REVIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Plan Completeness: <score>/10
  ✓ Core loop defined
  ✓ Aesthetics identified
  ✗ Playtest plan missing          (if any check fails)

Core Loop Validation: <pass/fail count>/4
  ✓ Sentence Test
  ✓ Verb Chain Test
  ✓ Reinvestment Test
  ✓ 30-Second Test

GDD Actionability: <total>/35
  Verb Test: <score>/5
  Prototype Test: <score>/5
  Decision Test: <score>/5
  Feedback Test: <score>/5
  Scope Test: <score>/5
  Cut Test: <score>/5
  Pillar Test: <score>/5

Overall: <READY TO BUILD / MINOR GAPS / NEEDS WORK>
```

**Interpretation:**
- Completeness ≥7 AND Actionability ≥28 = READY TO BUILD
- Completeness ≥7 AND Actionability 20-27 = MINOR GAPS
- Completeness <7 OR Actionability <20 = NEEDS WORK

- **MINOR GAPS**: Note the gaps as advisory.
- **NEEDS WORK**: Note the specific gaps as items to address before building.

### Step 7: Write Outputs

Write the generated documents to the output directory:

```
Write(file_path=".game-design/<slug>/output/gdd.md", content=<populated GDD>)
Write(file_path=".game-design/<slug>/output/tech-spec.md", content=<populated tech spec>)
```

### Step 8: Update State

Update `state.yaml` to mark the session as complete:

```
Read(file_path=".game-design/<slug>/state.yaml")
```

Update:
- `phase`: `complete`
- `updated`: today's date
- `flags.plan_ready`: `true`

```
Write(file_path=".game-design/<slug>/state.yaml", content=<updated state>)
```

Update the sessions index:

```
Read(file_path=".game-design/sessions.yaml")
```

Update the matching entry:
- `phase`: `complete`
- `updated`: today's date

```
Write(file_path=".game-design/sessions.yaml", content=<updated index>)
```

### Step 9: Present Summary

Present the build plan completion summary:

```
BUILD PLAN COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session: <title>
Phase: complete ✓

Files written:
  .game-design/<slug>/output/gdd.md
  .game-design/<slug>/output/tech-spec.md
  .game-design/<slug>/state.yaml (updated)
  .game-design/sessions.yaml (updated)

Quality Review:
  Plan Completeness: <score>/10
  Core Loop Validation: <pass/fail>/4
  GDD Actionability: <score>/35
  Overall: <READY TO BUILD / MINOR GAPS / NEEDS WORK>

Assumptions to validate: <count>
  <mechanic_count> mechanic (high priority)
  <feedback_count> feedback/progression (medium priority)
  <content_count> content/scope (low priority)
```

```
AskUserQuestion(questions=[{
  question: "What would you like to do next?",
  header: "Next step",
  options: [
    {label: "Review GDD", description: "Read through the Game Design Document"},
    {label: "Review tech spec", description: "Read through the Technical Specification"},
    {label: "Review assumptions", description: "Look at the assumptions that need playtesting"},
    {label: "Done", description: "Session complete — start building!"}
  ],
  multiSelect: false
}])
```

**If "Review GDD":**
```
Read(file_path=".game-design/<slug>/output/gdd.md")
```
Display the GDD and wait for user feedback. Then re-present the "What would you like to do next?" menu.

**If "Review tech spec":**
```
Read(file_path=".game-design/<slug>/output/tech-spec.md")
```
Display the tech spec and wait for user feedback. Then re-present the "What would you like to do next?" menu.

**If "Review assumptions":**
Display the Assumptions to Validate section from the GDD and wait for user feedback. Then re-present the "What would you like to do next?" menu.

**If "Done":**
```
Session complete. Your game design documents are ready in:
  .game-design/<slug>/output/

Start building with the tracer bullet from the tech spec!
```

**Stop here.**

## Error Handling

**If concept.yaml is missing or incomplete:**

```
CONCEPT INCOMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<title>" is missing concept data needed for plan generation.

Missing: <list missing required fields>

The brainstorm phase may not have completed fully.

Options:
  1. Return to brainstorm: /game:brainstorm
  2. Continue anyway (plan will have gaps)
```

**If decisions.log is missing or empty (header only):**

```
NO DECISIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<title>" has no design decisions recorded.

The simulation phase may not have completed or no decisions were logged.

Options:
  1. Return to simulation: /game:simulate
  2. Continue anyway (plan will be mostly placeholders)
```

**If templates are missing:**

```
TEMPLATE ERROR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Missing: templates/gdd.md or templates/tech-spec.md
The game-spice plugin may not be fully installed.

Run: Check that the game-spice plugin is installed in your project.
```

**If state.yaml is corrupted:**

```
SESSION ERROR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<slug>" has a corrupted state file.
Missing fields: <list>

Options:
  1. Re-initialize: /game:start
  2. Continue anyway (may produce incomplete outputs)
```

## Example Usage

```
/game:build-plan        # Generate plan for the active session
```

This command is typically chained from `/game:simulate` and produces the final outputs of the game design workflow.
