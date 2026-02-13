---
name: game-scoping
description: MLP scoping and tracer bullet planning for games. Use when scoping a game idea, prioritizing game features, defining vertical slices, creating a game MLP, or breaking down a game concept into buildable phases. Covers core loop identification, MoSCoW prioritization, scope management, feature cutting.
---

# Game Scoping & MLP Planning

Scope game ideas into buildable plans. Get to playable fast, iterate from there.

## Quick Reference

### MLP vs MVP

| | MVP (Software) | MLP (Games) |
|---|---|---|
| **Goal** | Validate market fit | Validate fun |
| **Success metric** | Users complete task | Players choose to keep playing |
| **Core question** | "Does it work?" | "Is it fun?" |
| **Minimum bar** | Functional | Enjoyable |
| **What to cut** | Non-essential features | Anything not serving the core loop |

**Key insight:** An MVP that works but isn't fun is a failed game. An MLP that's fun but limited is a successful foundation.

### Core Loop Identification

The core loop is what the player does **every 30-60 seconds**. Everything else is secondary.

**One-sentence test:** "The player [VERB]s [OBJECT] to [REWARD], which lets them [REINVEST]."

| Genre | Example Core Loop |
|-------|-------------------|
| Platformer | Jump through obstacles → reach checkpoint → unlock new area |
| Roguelike | Enter room → fight enemies → collect upgrades → go deeper |
| Puzzle | Observe pattern → manipulate pieces → solve → get harder puzzle |
| Tower Defense | Analyze wave → place towers → survive → earn currency → upgrade |
| Farming Sim | Plant crops → tend/wait → harvest → sell → buy better seeds |
| Card Game | Draw cards → play combinations → resolve effects → draw again |

### Core Loop Validation Checklist

- [ ] Can be stated in one sentence
- [ ] Involves player agency (not watching)
- [ ] Has a clear reinvestment path (reward feeds back into action)
- [ ] Is inherently repeatable without getting stale in first 10 minutes
- [ ] Can be prototyped with programmer art
- [ ] Is fun with zero content (no levels, no story, no progression)

## MLP Scoping Process

### The 3-Feature Rule

Your MLP gets **three features** beyond the core loop. Choose wisely.

**Process:**
1. Define the core loop (non-negotiable, not counted as a feature)
2. List every feature you want
3. For each feature, ask: "Does this make the core loop more fun?"
4. Rank by impact on core loop fun
5. Take the top 3

**Why 3?** More than 3 features for an MLP means you're building content, not validating fun. If your core loop needs more than 3 supporting features to be fun, your core loop is too weak.

### Feature Impact Assessment

| Impact Level | Description | Example (Roguelike) |
|---|---|---|
| **Core** | Loop doesn't work without it | Combat system |
| **Amplifier** | Makes core loop significantly more fun | Upgrade selection between rooms |
| **Enhancer** | Adds variety/polish | Different enemy types |
| **Content** | More of the same | Additional levels |
| **Cosmetic** | Visual/audio polish | Particle effects |

MLP includes: Core + up to 3 Amplifiers. Everything else waits.

## Tracer Bullet Methodology

### 5-Layer Vertical Slice

A tracer bullet proves your game works end-to-end through all layers:

```
┌─────────────────────────────────────┐
│  Layer 1: INPUT                     │
│  Player presses button / clicks     │
├─────────────────────────────────────┤
│  Layer 2: CORE MECHANIC             │
│  Game responds (character jumps,    │
│  card plays, piece moves)           │
├─────────────────────────────────────┤
│  Layer 3: GAME STATE                │
│  World updates (health, position,   │
│  score, inventory)                  │
├─────────────────────────────────────┤
│  Layer 4: FEEDBACK                  │
│  Player sees/hears result (screen   │
│  shake, sound, animation)           │
├─────────────────────────────────────┤
│  Layer 5: OUTPUT / CONSEQUENCE      │
│  Game state creates new situation   │
│  (new challenge, reward, game over) │
└─────────────────────────────────────┘
```

**Rule:** Your first build should touch all 5 layers for ONE action. Don't build Layer 1 for all actions before starting Layer 2.

### Tracer Bullet Examples

| Genre | Tracer Bullet (First Build Target) |
|-------|-----------------------------------|
| Platformer | Player runs and jumps on one platform, falls and respawns |
| Roguelike | Player enters one room, fights one enemy, picks up one item |
| Puzzle | Player manipulates one puzzle element, solves one puzzle |
| Tower Defense | Player places one tower, one enemy walks the path |
| Card Game | Player draws a hand, plays one card, sees its effect |

### What a Tracer Bullet is NOT

- Not a polished demo (programmer art is fine)
- Not feature-complete (one path through the game)
- Not balanced (numbers can be wrong)
- Not content-rich (one level, one enemy type, one item)

## MoSCoW Prioritization for Games

Adapted from standard MoSCoW with game-specific criteria.

### Must Have (MLP-blocking)
- Core loop mechanics
- One complete path from start to "one more round"
- Minimum feedback (player knows what happened)
- Win/loss or progress/regress state

### Should Have (First update after MLP)
- 2-3 content variations (enemy types, level layouts)
- Basic progression (something carries over between sessions)
- Audio feedback for core actions
- Pause/resume

### Could Have (Polish phase)
- Settings menu
- Multiple difficulty levels
- Achievements/unlocks
- Detailed tutorial

### Won't Have (Not this project phase)
- Multiplayer (unless it IS the core loop)
- Level editor
- Mod support
- Localization

## Scope Management

### The 30% Rule

Whatever scope you think the MLP needs, cut 30%. Then you're close to right.

**Why:** First-time scoping for games is always optimistic because:
- "Simple" mechanics have hidden complexity (collision, edge cases, feel)
- Fun requires iteration time you didn't budget for
- Integration between systems takes longer than building them separately
- Playtest feedback will change your priorities

### Ruthless Cutting Heuristics

Ask these questions about every feature. If any answer is "yes," cut it.

| Question | If Yes → Cut |
|----------|-------------|
| Can the core loop function without this? | Cut |
| Is this adding content rather than mechanics? | Defer |
| Does this require a new system/architecture? | Cut from MLP |
| Am I adding this because other games have it? | Cut |
| Would a player miss this in a 5-minute playtest? | If no → Cut |
| Does this feature serve MY game's core loop? | If no → Cut |

### Scope Creep Signals

Watch for these during planning:

- "While we're at it, we could also..." → Stop. Separate issue.
- "This would only take a day" → It won't. Defer it.
- "Players expect this in [genre]" → Maybe. After MLP.
- Feature list growing between planning sessions → Freeze and re-evaluate.
- Excitement about a feature unrelated to core loop → Parking lot it.
- "We need this for the trailer/demo" → Marketing scope ≠ MLP scope.

<details><summary>Genre-Specific Scoping Tips: Platformer</summary>

**MLP must have:** Run, jump, land on platforms, one hazard type, one level.

**Common over-scope:** Wall jump, double jump, dash, multiple worlds. Pick ONE movement verb beyond run+jump for MLP.

**Tracer bullet:** Character moves left/right, jumps, lands on a platform, falls into a pit, respawns.

**Hidden complexity:** Jump feel (coyote time, jump buffering, variable height) can consume as much time as building 5 levels. Budget for it.

</details>

<details><summary>Genre-Specific Scoping Tips: Roguelike</summary>

**MLP must have:** One floor, one enemy type, one item/upgrade, permadeath + restart.

**Common over-scope:** Meta-progression, 10+ enemy types, complex inventory, procedural generation before fun is proven. Handcraft your first 3 rooms.

**Tracer bullet:** Enter room, fight enemy, pick up item, die, restart with nothing.

**Hidden complexity:** Procedural generation that feels good (not random) is a project unto itself. Use handcrafted rooms for MLP.

</details>

<details><summary>Genre-Specific Scoping Tips: Puzzle Game</summary>

**MLP must have:** One puzzle mechanic, 5-10 handcrafted puzzles, clear win state per puzzle.

**Common over-scope:** Procedural puzzle generation, hint system, multiple mechanics in MLP.

**Tracer bullet:** Player sees puzzle, manipulates elements, puzzle solves, next puzzle loads.

**Hidden complexity:** Difficulty curves in puzzles require extensive playtesting. Your "easy" puzzle won't be easy for everyone.

</details>

<details><summary>Genre-Specific Scoping Tips: Tower Defense</summary>

**MLP must have:** One enemy path, one tower type, waves, win/lose condition.

**Common over-scope:** Tech trees, multiple maps, hero units, special abilities.

**Tracer bullet:** Enemy walks path, player places tower, tower shoots enemy, enemy dies or reaches end.

**Hidden complexity:** Balancing tower cost vs enemy health vs wave difficulty is iterative. Don't try to get numbers right in planning.

</details>

## Post-MLP Iteration Phases

| Phase | Focus | Duration Target |
|-------|-------|-----------------|
| **MLP** | Core loop + 3 features | Build as fast as possible |
| **Fun Polish** | Juice, game feel, feedback | Until core loop feels good |
| **Content Alpha** | Variety (enemies, levels, items) | Until 15-30 min play session |
| **Systems** | Progression, meta-game, saves | Until players want to return |
| **Content Beta** | Full content pipeline | Until target play length |
| **Polish** | UI, audio, accessibility | Until shippable |

**Rule:** Don't advance to the next phase until the current phase's goal is met. Especially don't skip Fun Polish.

## Checklists

### Before Scoping

- [ ] Core loop defined in one sentence
- [ ] Core loop validated with checklist above
- [ ] Genre identified (affects scope expectations)
- [ ] Target play session length defined (5 min? 30 min? 2 hours?)
- [ ] Platform/input constraints known (keyboard? controller? touch?)
- [ ] Solo dev or team? (drastically affects achievable scope)
- [ ] Economy complexity level identified (none / single resource / dual currency / full economy) `(see game-economy-design)`

### Scope Review

- [ ] MLP has ≤3 features beyond core loop
- [ ] 30% rule applied (original scope reduced)
- [ ] Every feature passes the cutting heuristics test
- [ ] Tracer bullet target defined (first thing to build)
- [ ] No features that require "new systems" to support
- [ ] No content-heavy items in MLP (those come later)
- [ ] Scope fits target timeline (be honest)
- [ ] Playtest plan: who will test, when, what you're testing for `(see game-playtesting → Playtest Planning Checklist)`
- [ ] MLP scenario walkthrough written `(see game-scenario-walkthrough)`

## See Also

- **game-design-frameworks** — MDA, core loop theory, player motivation (the "why" behind scoping decisions)
- **game-antipatterns** — Common planning mistakes to avoid during scoping
- **game-economy-design** — Plan resource systems and balance before building
- **game-playtesting** — Structure your playtest plan and iteration methodology
- **game-scenario-walkthrough** — Narrate the player experience before implementation
