---
name: game-scenario-walkthrough
description: MLP scenario walkthrough and player experience narration. Use when visualizing the player experience before building, writing gameplay storyboards, narrating a play session, mapping player inputs to feedback, or validating that a plan feels concrete and playable. Covers 5-beat walkthrough, input/feedback mapping, experience narration.
---

# MLP Scenario Walkthrough

Narrate the player's experience before writing code. If you can't describe it, you can't build it.

## Quick Reference

### What Is a Scenario Walkthrough?

A moment-by-moment narration of a complete play session through your MLP. Not a feature list — a story of what the player sees, does, and feels from launch to session end.

**Write one when:** Core loop + 3 features are defined, BEFORE implementation begins `(see game-scoping → The 3-Feature Rule)`.

### The 5-Beat Structure

| Beat | Question It Answers | Duration |
|---|---|---|
| **1. First Contact** | What does the player see on launch? | First 10 seconds |
| **2. Learning the Verb** | How do they discover the core mechanic? | First 1-2 minutes |
| **3. Core Loop in Motion** | What does a full loop cycle feel like? | 2-3 cycles |
| **4. Rising Stakes** | How does challenge emerge? | First failure |
| **5. Session End** | Why would they play again? | Last moment |

### Input & Feedback Mapping

For each key moment, fill in this template:

| Player Intent | Input | Visual Feedback | Audio Feedback | State Change |
|---|---|---|---|---|
| *"I want to jump"* | *Space bar* | *Character rises, squash & stretch* | *Whoosh sound* | *Position changes, airborne state* |
| *"I want to attack"* | *Click* | *Sword swing animation, hit flash* | *Slash + impact sound* | *Enemy HP decreases* |

**Rule:** If you can't fill in all 5 columns for a core action, the design isn't concrete enough to build.

### MLP Scenario Checklist

- [ ] First 30 seconds described — what does the player see and do first?
- [ ] First failure described — how does the player lose/fail and what happens?
- [ ] Complete core loop cycle narrated — action → reward → reinvestment
- [ ] Every input method used in MLP is mentioned at least once
- [ ] A reason to replay or continue is present at session end
- [ ] No beat says "the player has fun" — describe what they DO, not how they feel

## The 5-Beat Walkthrough Template

<details><summary>Beat 1: First Contact</summary>

**Prompt:** The player launches the game. What happens?

Narrate:
- What appears on screen (title? game world? character select?)
- Time to first input (how quickly can they DO something?)
- First moment of agency (what's the first choice they make?)

**Good example:** "The screen shows a dark forest. A character stands at the left edge. No menu, no text. The player presses right arrow — the character walks. They see a gap ahead."

**Bad example:** "The main menu loads with Play, Settings, and Credits buttons. Player clicks Play and watches a cutscene."

**Principle:** Minimize time between launch and first player action. Every second of non-interaction is a second they might quit.

</details>

<details><summary>Beat 2: Learning the Verb</summary>

**Prompt:** How does the player discover what they can do?

Narrate:
- How the core mechanic is introduced (show, don't tell)
- The first time they use it successfully
- The feedback they receive (what do they see/hear?)

**Key question:** Could a player discover this without text instructions? `(see game-design-frameworks → Onboarding Patterns)`

**Good example:** "The gap is too wide to walk across. The player notices the character's legs bend slightly near edges. They press space — the character jumps. They clear the gap. A subtle chime plays."

**Bad example:** "A tooltip says 'Press SPACE to jump.' Player presses space."

</details>

<details><summary>Beat 3: The Core Loop in Motion</summary>

**Prompt:** Narrate 2-3 complete cycles of the core loop.

For each cycle, describe:
- **Action:** What does the player decide to do?
- **Execution:** What input do they give? What do they see?
- **Outcome:** What changes in the game state?
- **Reinvestment:** How does the outcome feed back into the next action?

`(see game-design-frameworks → Core Loop Design)` for loop structure theory.

**Key question:** Does each cycle feel slightly different from the last? If all 3 cycles read identically, the loop lacks variation.

**Input/feedback mapping:** Fill in the mapping table for every new input introduced in this beat.

</details>

<details><summary>Beat 4: Rising Stakes</summary>

**Prompt:** How does the player first encounter real challenge?

Narrate:
- What changes to make the game harder (new obstacle, faster enemies, resource scarcity)
- The first time the player fails — what do they see? `(see game-design-frameworks → Flow State & Difficulty)`
- How they recover (respawn? restart? lose progress?)
- What they learn from failure (skill growth signal)

**Key question:** Does the player understand WHY they failed? If failure feels random, it's frustrating. If it feels like "I should have done X," it's motivating.

</details>

<details><summary>Beat 5: Session End</summary>

**Prompt:** What makes the player want to play again?

Narrate:
- The moment a natural session end occurs (death, level complete, time limit)
- What the player sees (score? progress? unlock? teaser?)
- The "one more round" hook — what pulls them back in?
- What carries over between sessions (if anything)

**Key question:** If you stopped playing here, would you open the game again tomorrow? Why?

**MLP note:** For MLP, the hook can be simple — "I want to beat my score" or "I want to see if I can clear that section." Progression systems come later `(see game-scoping → Post-MLP Iteration Phases)`.

</details>

<details><summary>Visual Snapshot Prompts</summary>

At any point in the walkthrough, you can add a **visual snapshot** to increase specificity:

- **"What is on screen right now?"** — Describe layout: player character position, UI elements, environment features, enemy positions
- **"What are the player's options?"** — List every action available to the player at this moment
- **"What draws their eye?"** — What is the most visually prominent element? Does it guide them correctly?
- **"What information does the player have?"** — Health, score, resources, objective — what do they know?

**Use snapshots when:** A beat feels too abstract. If you can't visualize the screen, the designer hasn't decided enough yet.

</details>

<details><summary>Walkthrough Anti-Patterns</summary>

| Anti-Pattern | Example | Fix |
|---|---|---|
| **Too abstract** | "The player has fun exploring" | Describe specific actions and feedback |
| **Too technical** | "The sprite renderer instantiates a prefab" | Describe what the player SEES, not implementation |
| **Skipping failure** | Only narrating the happy path | Add Beat 4 — how does failure work? |
| **Feature listing** | "The player can jump, attack, dash, and wall-climb" | Narrate them discovering ONE mechanic at a time |
| **Emotion prescribing** | "The player feels excited and engaged" | Describe what happens; let the emotion follow |
| **Missing inputs** | Describing what happens without HOW the player causes it | Fill in the input/feedback mapping table |

</details>

## See Also

- **game-design-frameworks** — Onboarding (Beat 2), core loop design (Beat 3), flow and difficulty (Beat 4), game feel (feedback mapping)
- **game-scoping** — Tracer bullet as the technical equivalent of a walkthrough `(see game-scoping → Tracer Bullet Methodology)`
- **game-playtesting** — Use the walkthrough as a testable artifact `(see game-playtesting → The 3-Question Framework)`
- **game-antipatterns** — Design in Isolation and GDD Tome — walkthroughs help avoid both
- **game-economy-design** — Narrate economy decisions within the walkthrough
