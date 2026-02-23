---
description: Explore and define a game concept through conversation
argument-hint:
allowed-tools: Read, Write, Glob, Grep, AskUserQuestion, Skill
---

## Summary

**Conversational concept extraction — turn a game idea into structured design output.** Part of the session lifecycle: start → **brainstorm** → simulate → build-plan.

**Arguments:** None (operates on the active session from `/game:start`)

**Output:** `concept.yaml`, `brainstorm.md` design brief, seeded `decisions.log`, updated `state.yaml`.

**CRITICAL:** This is a conversation, NOT a questionnaire. Ask one open-ended question, then extract structure from the user's natural response. Only probe for genuinely missing information.

---

## Process

### Step 1: Load Session State

Find the active session. This command is chained from `/game:start`, so an active session should exist.

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

**If the session phase is not `brainstorm`:**

```
PHASE MISMATCH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<title>" is in the <phase> phase, not brainstorm.

To continue this session: /game:<phase>
To start a new session: /game:start
```

**Stop here.**

**If concept.yaml already exists** for this session:

```
Glob(pattern=".game-design/<slug>/concept.yaml")
```

If found, load it:

```
Read(file_path=".game-design/<slug>/concept.yaml")
```

The user is returning to refine an existing concept. Skip to Step 3 (present extraction for confirmation) with the existing concept as context, and display:

```
RESUMING BRAINSTORM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session: <title>
Existing concept loaded — picking up where you left off.
```

**Otherwise, proceed to Step 2.**

Present session context:

```
BRAINSTORM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session: <title>

Let's explore your game idea.
```

### Step 2: Open-Ended Prompt

Ask the user to describe their game idea in their own words. Do NOT present a form, genre list, or structured questionnaire.

```
AskUserQuestion(questions=[{
  question: "Describe the game you want to make. What does the player do? What does it feel like? Say as much or as little as you want — anything from a single sentence to a full pitch.",
  header: "Game idea",
  options: [
    {label: "I'll describe it", description: "Type your game idea freely"},
    {label: "I need inspiration", description: "Show me some starting points to riff on"}
  ],
  multiSelect: false
}])
```

**If the user chose "I need inspiration":**

Read the mechanics palette and exploration prompts for conversation starters:

```
Read(file_path="skills/mechanics-palette/exploration-prompts.md")
```

Use 2-3 prompts from the exploration process to spark ideas. Present them conversationally, then ask the user to describe what resonates. Do NOT turn this into a category-selection menu.

After getting inspiration, re-ask the open-ended question above.

**Once the user describes their idea, proceed to Step 3.**

### Step 3: Extract Structure

Parse the user's natural language description to identify as many of these as possible:

| Field | How to extract |
|-------|---------------|
| `genre` | What genre is implied? ("roguelike where you grapple" → roguelike) |
| `subgenre` | Any modifier? ("deckbuilder roguelike" → subgenre: deckbuilder) |
| `core_loop` | What does the player do repeatedly? Formulate as one sentence. |
| `aesthetics` | What feelings are implied? Map to MDA aesthetics (challenge, discovery, etc.) |
| `platform` | Did they mention where it runs? |
| `input_method` | Did they mention controls? |
| `mechanics` | What verbs/actions did they describe? |
| `scope` | Did they mention team size, timeline, engine? |
| `pitch` | Distill their description into 1-3 sentence elevator pitch. |

**Decision provenance rules — apply to EVERY extracted field:**

| Origin | When to use |
|--------|-------------|
| `user` | The user explicitly said it. "I want a roguelike" → genre is `user`. |
| `inferred` | You extracted it from context. "grapple through dark caverns" implies genre=roguelike, aesthetic=challenge — both are `inferred`. |
| `suggested` | You proposed it and the user accepted. Used in Step 4 if the user chooses "You decide" for the core loop. |

Track provenance for each field internally. You will write it to `decisions.log` in Step 8.

**Present what you extracted** conversationally:

```
Here's what I'm picking up from your description:

**Genre:** <genre> (<subgenre if any>)
**Core loop:** <one-sentence core loop>
**Key mechanics:** <list>
**Feel:** <aesthetics in plain language>
**Platform/input:** <if mentioned, otherwise "not mentioned yet">

Does this capture the right feel? Anything I've got wrong?
```

Wait for the user to confirm or correct. Corrections change the origin to `user` for corrected fields.

### Step 4: Core Loop Check

If you extracted a clear core loop in Step 3, skip to Step 5.

If the core loop is missing or vague, ask ONE focused question:

```
AskUserQuestion(questions=[{
  question: "<Ask specifically about the core loop. Example: 'What does a single round or run look like — what's the player doing moment to moment?'>",
  header: "Core loop",
  options: [
    {label: "I'll describe it", description: "Explain what a typical play session looks like"},
    {label: "You decide", description: "Infer the most likely loop from the genre and mechanics"}
  ],
  multiSelect: false
}])
```

**If "You decide":** Infer the core loop from genre conventions. Mark as `suggested` origin.

For all other missing fields (scope, platform, input method, team size), use sensible defaults from the template. Mark as `inferred` origin. These can be refined in later phases.

### Step 5: Core Loop Validation

Read the core loop validation checklist:

```
Read(file_path="skills/scoping/SKILL.md")
```

Use the **one-sentence test** from scoping:

> "The player [VERB]s [OBJECT] to [REWARD], which lets them [REINVEST]."

Formulate the core loop in this format. Then check against the validation checklist:

- [ ] Can be stated in one sentence
- [ ] Involves player agency (not watching)
- [ ] Has a clear reinvestment path
- [ ] Is inherently repeatable
- [ ] Can be prototyped with programmer art
- [ ] Is fun with zero content

**If the core loop passes:** Present the one-sentence version to the user for confirmation.

**If the core loop is weak or unclear:** Discuss it with the user. Suggest alternatives referencing the genre's expected loop from scoping's genre examples table. Keep it conversational — "Your core loop feels a bit vague — in most roguelikes the loop is something like 'enter room → fight → collect → go deeper.' Does something like that match what you're imagining?"

### Step 6: Enrich with Frameworks

Reference mechanics-palette and design-frameworks to **validate and enrich** the concept. Do NOT use them to interrogate the user.

```
Read(file_path="skills/design-frameworks/SKILL.md")
Read(file_path="skills/mechanics-palette/SKILL.md")
```

**Enrichment checklist (internal — do NOT show this to the user):**

1. **MDA alignment** — Do the chosen mechanics produce dynamics that lead to the target aesthetics? If there's a mismatch, note it.
2. **Mechanics palette** — Are there complementary mechanics from the palette that would strengthen the concept? Suggest at most 1-2, not a laundry list.
3. **Mashup patterns** — Does the concept use an identifiable mashup pattern (loop nesting, verb+context shift, etc.)? Note it for the design brief.

**Present enrichment conversationally** — only if you have something genuinely useful to add:

```
A couple of thoughts on the design:

- <observation about MDA alignment or mechanic synergy>
- <optional: a complementary mechanic suggestion>

These are suggestions, not requirements — your call.
```

**If there is nothing meaningful to add:** Skip this output. Do NOT pad with generic advice.

### Step 7: Digital Game Validation

Confirm the concept is a digital video game. This is a quick sanity check, not a blocker.

**If the concept is clearly digital** (mentions engine, platform, or digital mechanics): Skip this step silently.

**If ambiguous** (could be a board game, TTRPG, or physical game):

```
AskUserQuestion(questions=[{
  question: "Just to confirm — this is a digital video game, right? (Game-spice is designed for digital games, though the concepts transfer.)",
  header: "Digital?",
  options: [
    {label: "Yes, digital", description: "This is a video game"},
    {label: "Not digital", description: "This is a board game, TTRPG, or other non-digital game"}
  ],
  multiSelect: false
}])
```

**If not digital:** Note that game-spice workflows are designed for digital games. Simulation and build-plan phases assume a digital game. Continue anyway — the concept work is still valuable.

### Step 8: Write Outputs

Write the output files. Read templates first:

```
Read(file_path="templates/concept.yaml")
```

**8a: concept.yaml**

Populate every field from the extracted/confirmed data:

```
Write(file_path=".game-design/<slug>/concept.yaml", content=<populated concept>)
```

Use the exact schema from the template. Fill in all fields. Leave empty string `""` only if genuinely unknown after the full conversation.

Example:
```yaml
genre: "roguelike"
subgenre: "action"

core_loop: "Grapple through procedurally generated caverns, fight creatures, collect upgrades, descend deeper"

aesthetics:
  - challenge
  - discovery
  - sensation

platform: "PC"
input_method: "keyboard+mouse"

mechanics:
  - name: "grapple"
    description: "Launch a hook to swing between platforms and traverse gaps"
  - name: "combat"
    description: "Melee and ranged attacks against cave creatures"

scope:
  target: "small"
  team_size: 1
  engine: "godot"

pitch: "A roguelike where you grapple through dark procedural caverns, fighting creatures and collecting upgrades as you descend into the unknown."
```

**8b: brainstorm.md**

Write a design brief summarizing the brainstorm session. This is a human-readable document, not YAML.

```
Write(file_path=".game-design/<slug>/brainstorm.md", content=<design brief>)
```

Structure:
```markdown
# <Title> — Design Brief

## Elevator Pitch

<pitch — 1-3 sentences>

## Core Loop

<one-sentence core loop>

**Validation:** <pass/fail summary against checklist>

## Aesthetics

Target experience: <aesthetics in plain language>

MDA mapping: <mechanics> → <dynamics> → <aesthetics>

## Key Mechanics

<list each mechanic with a one-line description>

## Scope

- Target: <scope target>
- Team: <team size>
- Engine: <engine>
- Platform: <platform> (<input method>)

## Design Notes

<Any enrichment observations from Step 6 — mashup patterns, mechanic synergies, risks>

## Open Questions

<Anything that remains unresolved or worth revisiting in simulation>

## Decision Summary

<count> decisions logged. Origins: <user>/<suggested>/<inferred> breakdown.
```

**8c: Seed decisions.log**

Append decisions to the existing decisions.log (header row created by `/game:start`).

```
Read(file_path=".game-design/<slug>/decisions.log")
```

Append one row per decision. Each decision corresponds to a concept.yaml field established during the brainstorm.

Row format: `id|date|phase|category|origin|decision|rationale|alternatives`

- `id`: Sequential integer starting from 1 (or continuing from the last entry)
- `date`: Today's date (ISO 8601)
- `phase`: `brainstorm`
- `category`: The concept field (e.g., `genre`, `core_loop`, `mechanics`, `scope.target`)
- `origin`: `user`, `suggested`, or `inferred`
- `decision`: What was decided (e.g., "Genre: roguelike")
- `rationale`: Why (e.g., "User described grappling through caverns with permadeath")
- `alternatives`: Other options considered, or empty

```
Write(file_path=".game-design/<slug>/decisions.log", content=<header + all rows>)
```

Count decisions by origin for the state update.

### Step 9: Update State

Update the session state to reflect brainstorm completion:

```
Read(file_path=".game-design/<slug>/state.yaml")
```

Update these fields:
- `phase`: change to `simulate`
- `updated`: today's date
- `decisions.total`: total count of decisions logged
- `decisions.by_origin.user`: count of user-origin decisions
- `decisions.by_origin.suggested`: count of suggested-origin decisions
- `decisions.by_origin.inferred`: count of inferred-origin decisions
- `flags.concept_complete`: `true` (all required concept fields are populated)
- `flags.simulation_ready`: `true` (concept is complete enough to simulate)

```
Write(file_path=".game-design/<slug>/state.yaml", content=<updated state>)
```

Also update the sessions index:

```
Read(file_path=".game-design/sessions.yaml")
```

Update the matching entry:
- `phase`: `simulate`
- `updated`: today's date

```
Write(file_path=".game-design/sessions.yaml", content=<updated index>)
```

### Step 10: Handoff

Present a summary and offer the next step:

```
BRAINSTORM COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session: <title>
Decisions: <total> logged (<user>/<suggested>/<inferred>)

Files written:
  .game-design/<slug>/concept.yaml
  .game-design/<slug>/brainstorm.md
  .game-design/<slug>/decisions.log (<count> entries)
  .game-design/<slug>/state.yaml (updated)
  .game-design/sessions.yaml (updated)
```

```
AskUserQuestion(questions=[{
  question: "What would you like to do next?",
  header: "Next step",
  options: [
    {label: "Simulate", description: "Play through the core loop in ASCII turns (/game:simulate)"},
    {label: "Review outputs", description: "Look at concept.yaml and design brief before continuing"},
    {label: "Done for now", description: "Save progress and come back later"}
  ],
  multiSelect: false
}])
```

**If "Simulate":**
```
Skill(skill="game:simulate")
```
**Stop here** — simulate takes over.

**If "Review outputs":**
```
Read(file_path=".game-design/<slug>/concept.yaml")
Read(file_path=".game-design/<slug>/brainstorm.md")
```

Display the outputs and wait for the user to decide their next step.

**If "Done for now":**
```
Session saved. Resume any time with /game:start.
```

**Stop here.**

## Error Handling

**If templates are missing:**

```
TEMPLATE ERROR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Missing: templates/concept.yaml
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

**If decisions.log is missing:**

Recreate it with the header row and continue. Log a warning but don't block.

## Example Usage

```
/game:brainstorm        # Continue brainstorm for the active session
```

This command is typically chained from `/game:start` and chains to `/game:simulate` on completion.
