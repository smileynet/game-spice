# Tutorial: Planning a Roguelike Dungeon Crawler

This tutorial walks through planning a complete game using Line Cook with game-spice. You'll go from a vague idea ("roguelike dungeon crawler") to a concrete, scoped MLP plan with beads ready for implementation.

Game-spice adds game-specific knowledge, commands, and agents to Line Cook. This tutorial focuses on the planning phase — every question and framework shown below comes from game-spice skills activating automatically during `/mise`. For commands (`/game:walkthrough`, `/game:status`) and the game-reviewer agent, see the [README](../README.md).

## Before You Begin

**Prerequisites:**
- Claude Code installed
- [Line Cook](https://github.com/smileynet/line-cook) plugin installed
- game-spice plugin installed (see [Quick Start](../README.md#quick-start))
- A git repo with [beads](https://github.com/smileynet/beads) initialized (`bd init`) for issue tracking

**New to Line Cook?** The [Line Cook tutorial](https://github.com/smileynet/line-cook/blob/main/docs/tutorial-claude-code.md) covers the full workflow. This tutorial focuses on the planning phase (`/mise`) and what game-spice adds to it.

---

## Part 1: Brainstorming

Start with `/line:brainstorm`. You have an idea — "roguelike dungeon crawler" — and game-spice will help you interrogate it.

```
You: /line:brainstorm

Claude: Let's brainstorm. What's the game idea?

You: A roguelike dungeon crawler.
```

### Targeting an aesthetic

The first thing game-spice surfaces is the MDA framework from **design-frameworks**. Instead of jumping to features, it asks *what feeling* you're designing for:

```
Claude: Before we go further — what should playing this        ← design-frameworks
game feel like? MDA gives us 8 aesthetics:

  Sensation    — game as sensory pleasure
  Fantasy      — game as make-believe
  Narrative    — game as drama
  Challenge    — game as obstacle course
  Fellowship   — game as social framework
  Discovery    — game as uncharted territory
  Expression   — game as self-discovery
  Submission   — game as pastime

Pick 1-2 primary aesthetics. These will guide every
scope decision later.

You: Challenge and Discovery.

Claude: Good pairing. Challenge drives the combat and
permadeath tension. Discovery drives exploration and
the "what's in the next room?" pull. When we scope
later, every feature should serve one of these two.
```

**Why this matters:** Without this question, you'd likely start listing features. With it, you have a filter: does this feature serve Challenge or Discovery? If not, it's out.

### Defining the core loop

Next, **scoping** activates to pin down the core loop — what the player does every 30-60 seconds:

```
Claude: Now let's nail the core loop. Can you describe it      ← scoping
in one sentence?

Format: "Player [verbs] to [goal], earning [reward]
that enables [reinvestment]."

You: Player explores rooms to find loot, earning gear
     that enables deeper dungeon runs.

Claude: That's clean. Let's validate:
  ✓ One sentence
  ✓ Player agency (explores, finds)
  ✓ Reinvestment path (gear → deeper runs)
  ✓ Repeatable
  ✓ Can prototype with programmer art
  ✓ Fun with zero content (rooms + loot + danger)

All checks pass. This loop is your MLP foundation —
everything we scope later must serve it.
```

### Browsing the mechanics palette

With the loop defined, **mechanics-palette** helps explore *how* the core verbs will feel:

```
Claude: Your core verbs are "explore" and "fight." Let's       ← mechanics-palette
browse mechanics that could bring those to life.

Movement style — how does the player navigate?
  • Grid-based (classic roguelike, tactical)
  • Free movement (action-oriented)
  • Auto-runner (stripped down, mobile-friendly)
  • Teleport/blink (high-mobility, puzzle potential)

Grid-based is the traditional roguelike choice. It
makes positioning tactical and keeps the turn-based
flow clean.

You: Grid-based, turn-based.

Claude: Good. For combat, the palette offers:
  • Melee — positional, risk/reward of closing distance
  • Ranged — aim/trajectory, ammo management
  • Spells/abilities — cooldowns, resource costs
  • Auto-battle — strategic setup, passive execution
  • Stealth — avoidance as alternative to fighting

Which 1-2 resonate? Remember — MLP gets one
combat style. Variety comes post-MLP.

You: Melee with some ranged.

Claude: For MLP, I'd suggest melee-primary with ranged
as a single amplifier feature (not a full separate
system). One weapon type, one ranged option. Let's
check a mashup pattern:

  "Opposing Forces" — melee risk vs ranged safety
  creates moment-to-moment tactical decisions:
  close in for damage or stay back and plink?

This creates natural tension without needing complex
AI or many weapon types.
```

### Economy complexity

**economy-design** steps in to right-size the resource system:

```
Claude: How complex should the economy be?                     ← economy-design

  ┌─────────────────┬─────────────────────────────────┐
  │ None            │ Pure action, no currency         │
  │ Single resource │ Gold only — simple, clear        │
  │ Dual currency   │ Gold + XP — spend vs grow        │
  │ Full economy    │ Multiple interacting resources   │
  └─────────────────┴─────────────────────────────────┘

  For a roguelike MLP: dual currency is the sweet spot.
  Gold for between-room spending (health potions, keys).
  XP or "souls" for permanent meta-progression
  (unlocks that persist across runs).

You: Dual currency — gold within a run, souls across runs.

Claude: Perfect. MLP economy checklist:
  ✓ At most 2 currencies
  ✓ Each has at least 1 tap (source) and 1 sink (drain)
  ✓ Player makes spend-or-save decisions
  ✓ No currency is irrelevant for core loop
  ✓ No exchange rate math — keep it intuitive

  Gold: tap = enemy drops, sink = shop items
  Souls: tap = boss kills, sink = permanent unlocks
```

### Brainstorm output

At the end of brainstorming, Claude produces a brainstorm document summarizing decisions:

```
Claude: Here's your brainstorm summary:

  ## Roguelike Dungeon Crawler — Brainstorm

  **Aesthetics:** Challenge, Discovery
  **Core loop:** Explore rooms → fight enemies → collect
  loot → gear up → go deeper
  **Movement:** Grid-based, turn-based
  **Combat:** Melee-primary, single ranged option
  **Economy:** Dual currency (gold per-run, souls meta)
  **Open questions:**
  - How many rooms per floor? (scope decision)
  - Permadeath or partial persistence? (scope decision)
  - Art style? (deferred — doesn't affect MLP mechanics)

  Ready for /line:scope when you are.
```

**Skills that activated:** design-frameworks, scoping, mechanics-palette, economy-design

---

## Part 2: Scoping the MLP

Run `/line:scope` to turn the brainstorm into a concrete, buildable plan. This is where game-spice earns its keep — scoping is where most game projects go wrong.

```
You: /line:scope
```

### The 3-feature rule

**scoping** immediately constrains the plan:

```
Claude: Time to scope your MLP. Rule: your core loop +         ← scoping
three features, maximum. More than 3 means you're
building content, not validating fun.

Your core loop (not counted as a feature):
  Grid movement + turn-based melee combat + room traversal

Now list every feature you wish you could include.
Don't filter — just brainstorm.

You: Ranged weapons, upgrade shops, boss fights,
     procedural levels, 5 enemy types, character classes,
     a meta-progression system, and a leaderboard.

Claude: That's 8 features. Let's score each by impact
on the core loop:

  Feature               Impact        Serves
  ─────────────────────────────────────────────────
  Ranged weapons        Amplifier     Challenge ✓
  Upgrade shops         Amplifier     Challenge ✓
  Boss fights           Amplifier     Challenge ✓ Discovery ✓
  Procedural levels     Amplifier     Discovery ✓
  5 enemy types         Content       Challenge (weak)
  Character classes     Enhancer      Expression (not target)
  Meta-progression      Enhancer      Submission (not target)
  Leaderboard           Cosmetic      Challenge (weak)

  Top 3 amplifiers: ranged weapons, upgrade shops,
  boss fights.

  Procedural levels scored high but requires a NEW
  SYSTEM — that's a red flag for MLP. Defer it.
  Start with 3 handcrafted floors instead.

  ✂ CUT from MLP: procedural levels, 5 enemy types,
  character classes, meta-progression, leaderboard.
  → Parked in "post-MLP" backlog.
```

### Tracer bullet

Next, the 5-layer vertical slice — the smallest thing you can build that proves the game works end-to-end:

```
Claude: Your tracer bullet — the first thing you build:        ← scoping

  ┌─────────────────────────────────────┐
  │ Layer 1: INPUT                      │
  │ Arrow keys move on grid, Space to   │
  │ attack adjacent tile                │
  ├─────────────────────────────────────┤
  │ Layer 2: CORE MECHANIC              │
  │ Player moves, attacks. Enemy takes  │
  │ damage. Turn passes.                │
  ├─────────────────────────────────────┤
  │ Layer 3: GAME STATE                 │
  │ HP, position, enemy HP, room layout │
  │ update. Fog of war reveals tiles.   │
  ├─────────────────────────────────────┤
  │ Layer 4: FEEDBACK                   │
  │ Hit flash, damage number, screen    │
  │ shake on hit. Death animation.      │
  ├─────────────────────────────────────┤
  │ Layer 5: OUTPUT / CONSEQUENCE       │
  │ Enemy dies → drops gold. Room       │
  │ cleared → door to next room opens.  │
  │ Player dies → run ends.             │
  └─────────────────────────────────────┘

  This is ONE room, ONE enemy type, NO shop, NO boss.
  If this isn't fun, nothing else will save it. Build
  this first and playtest before adding features.
```

### Economy design

**economy-design** adds specifics to the dual-currency decision from brainstorming:

```
Claude: Let's map the economy flow:                            ← economy-design

  Gold (per-run):
    Taps: enemy drops (primary), room discovery bonus
    Sinks: shop purchases (health potion, weapon upgrade)
    Decision: heal now or save for a bigger upgrade?

  Souls (meta):
    Taps: boss kills only (scarce, meaningful)
    Sinks: permanent unlocks (new starting weapons,
           extra starting HP)
    Decision: which permanent upgrade matters most?

  Key constraint: gold vanishes on death (roguelike
  convention). Souls persist. This creates the tension
  between "spend gold to survive this run" and "reach
  the boss to earn souls for the next run."
```

### Difficulty design

**difficulty-design** shapes the challenge curve:

```
Claude: For difficulty approach — which fits?                   ← difficulty-design

  • Fixed curve (designer-controlled)
  • Player-driven (choose your own difficulty)
  • DDA (auto-adjusting)
  • Assist mode (accessibility toggles)

You: Fixed curve. It's a roguelike — part of the deal.

Claude: Good. For a 3-floor MLP with a boss:

  Floor 1: Low pressure. 1 enemy type, simple layout.
  Teaches movement and combat. (Sawtooth valley)

  Floor 2: Rising. 2 enemy types, tighter rooms,
  more enemies per room. Forces resource decisions.
  (Sawtooth peak)

  Floor 3 + Boss: Peak difficulty. Combines
  everything learned. Boss tests mastery of all
  mechanics introduced. (Climax)

  Recovery mechanic: run restart. Die → lose gold →
  keep souls → try again. Classic roguelike.
  No checkpoints, no rewind. Death must feel
  consequential but not punishing (because runs
  are short — target 10-15 minutes).
```

### Content planning

**content-planning** right-sizes the content scope:

```
Claude: Content for MLP — resist the urge to build lots:       ← content-planning

  World structure: Linear (floor 1 → 2 → 3 → boss)
  No hub, no branching. Linear is fastest to build
  and gives clear pacing control.

  Room count: 3 handcrafted rooms per floor = 9 rooms
  + 1 boss room = 10 rooms total.

  Why handcrafted? Procedural generation is a SYSTEM,
  not content. It takes longer to build than 10 rooms.
  Handcrafted rooms are cheaper and let you control
  the player's first experience precisely.

  Enemy types: 2 total. One melee (approaches player),
  one ranged (stays back, fires projectiles).
  That's enough for interesting tactical decisions
  on a grid.

  Content anti-pattern check:
  ✓ No "build a level editor first"
  ✓ No "we need at least 20 rooms"
  ✓ No "content will make it fun" (mechanics first)
```

### Scenario walkthrough

**scenario-walkthrough** narrates what a player actually *experiences*:

```
Claude: Let's walk through the 5 beats of a play session:      ← scenario-walkthrough

  BEAT 1 — FIRST CONTACT (first 10 seconds)
  Player launches the game. Title screen: "Dungeon of
  [Name]". Press any key. Dungeon floor 1 appears.
  Character stands in a lit room. Fog of war hides the
  rest. No tutorial popup — the room IS the tutorial.

  BEAT 2 — LEARNING THE VERB (first 1-2 minutes)
  Player presses arrow keys. Character moves on the
  grid. They bump into a wall — nothing happens. They
  see an enemy one tile away. They press Space —
  sword swing animation, damage number floats up.
  Enemy hits back. "Oh, I take damage too." They kill
  the enemy. Gold drops. They walk over it — collected.

  BEAT 3 — CORE LOOP IN MOTION (minutes 2-5)
  Second room. Two enemies. Player uses positioning —
  fights them one at a time by controlling the doorway.
  "I can use the grid tactically." Finds a health
  potion. Decision: use now (nearly full HP) or save?
  Third room has a ranged enemy that forces approach.
  Room cleared → stairs to floor 2.

  BEAT 4 — RISING STAKES (minutes 5-10)
  Floor 2 is harder. Three enemies in a room. Player
  takes real damage. Uses health potion. Finds the
  shop — gold → weapon upgrade or more potions?
  Chooses weapon. Next rooms feel faster. Then a bad
  room — gets swarmed, dies.

  BEAT 5 — SESSION END (death screen)
  "Run over. Gold lost. 0 souls earned (didn't reach
  boss)." Options: Try Again. The pull: "I know the
  layout now. I'll buy potions earlier. I can get
  further." Player hits Try Again.

  Input/feedback check for core action (attack):
  ┌──────────────┬────────┬──────────────┬────────────┬──────────────┐
  │ Intent       │ Input  │ Visual       │ Audio      │ State Change │
  │ "Attack"     │ Space  │ Sword swing, │ Slash +    │ Enemy HP -1, │
  │              │        │ hit flash    │ thud       │ turn passes  │
  └──────────────┴────────┴──────────────┴────────────┴──────────────┘
  All columns filled — design is concrete enough to build.
```

### Playtest planning

**playtesting** defines when and how to validate:

```
Claude: Playtest plan for MLP:                                 ← playtesting

  First playtest target: after tracer bullet (1 room,
  1 enemy, movement + combat). Tester: yourself.

  The 3-question framework:
  1. Did they understand what to do? (without being told)
  2. Did they keep going? (or put the controller down)
  3. Would they come back? (or was once enough)

  For tracer bullet, only question 1 matters. If the
  player doesn't understand "move with arrows, attack
  with space" within 30 seconds, the input design has
  a problem.

  After MLP (all 3 floors + boss):
  Tester: one friend who plays roguelikes.
  Watch them play. Don't explain anything.
  Note where they die, where they pause, where they
  look confused. That's your priority fix list.
```

### Scope output

Claude produces the structured scope document:

```
Claude: Here's your MLP scope:

  ## Roguelike Dungeon Crawler — MLP Scope

  **Core loop:** Grid explore → fight → loot → gear up → deeper
  **Aesthetics:** Challenge, Discovery
  **Features (3):** Ranged weapon, upgrade shop, boss fight

  **Content:**
  - 3 floors, 3 rooms each + 1 boss room (10 total)
  - 2 enemy types (melee, ranged)
  - 1 shop per floor
  - 1 boss (floor 3)

  **Economy:**
  - Gold (per-run): enemy drops → shop purchases
  - Souls (meta): boss kills → permanent unlocks

  **Difficulty:** Fixed sawtooth curve, run-restart recovery
  **Tracer bullet:** 1 room, 1 enemy, movement + combat
  **First playtest:** Self-test after tracer bullet
  **Deferred:** Procedural gen, classes, meta-progression,
  leaderboard, 5+ enemy types
```

**Skills that activated:** scoping, economy-design, difficulty-design, content-planning, scenario-walkthrough, playtesting

---

## Part 3: Review and Finalize

### Anti-pattern audit

Before finalizing, **antipatterns** runs the over-scope rubric:

```
Claude: Let's audit your plan against the over-scope           ← antipatterns
rubric:

  More than 3 features beyond core loop?      No   +0
  Feature described as "simple" w/o prototype? No   +0
  More than 2 enemy/item/level types?          No   +0
  Multiplayer included?                        No   +0
  Requires procedural generation?              No   +0
  Dev time > 4 weeks solo?                     No   +0
  Progression system AND content?              No   +0
  Design doc more than 3 pages?                No   +0
  Can't describe in one sentence?              No   +0
  ─────────────────────────────────────────────────
  Total: 0 — Scope looks reasonable. ✓

  Post-Planning Audit:
  ✓ MLP has 3 features beyond core loop
  ✓ No feature requires a new system
  ✓ No premature content (3 floors, 2 enemy types)
  ✓ 30% buffer applied to timeline
  ✓ Every feature passes "Should I Add This Feature?"
  ✓ Over-scope score ≤ 2
  ✓ Plan fits in ≤ 3 pages
  ✓ Tracer bullet defined
  ✓ Playtest plan exists
  ✓ Parking lot created for deferred ideas

  Plan passes audit. Ready to finalize.
```

### Finalize

Run `/line:finalize` to convert the plan into beads for implementation:

```
You: /line:finalize

Claude: Converting scope to beads...

  Created:
  ├── [epic] Roguelike Dungeon Crawler MLP
  │   ├── [feature] Core movement and grid system
  │   ├── [feature] Turn-based melee combat
  │   ├── [feature] Room traversal and floor progression
  │   ├── [feature] Ranged weapon system
  │   ├── [feature] Upgrade shop
  │   ├── [feature] Boss encounter
  │   ├── [task] Gold economy (taps and sinks)
  │   ├── [task] Souls meta-currency
  │   ├── [task] Enemy AI — melee type
  │   ├── [task] Enemy AI — ranged type
  │   ├── [task] 10 handcrafted rooms
  │   └── [task] Playtest: tracer bullet self-test

  Dependencies set:
  - All features depend on core movement
  - Boss encounter depends on combat + room traversal
  - Shop depends on gold economy
  - Rooms depend on grid system
  - Playtest depends on core movement + combat

  Tracer bullet path (build in this order):
  1. Core movement + grid → 2. Melee combat →
  3. One room → 4. One enemy → PLAYTEST

  Run /line:prep to start implementation.
```

---

## Part 4: With vs Without

What does planning look like *without* game-spice?

### Without game-spice

Line Cook still works — it asks good *software* planning questions:

```
Claude: What's the project?
You: A roguelike dungeon crawler.
Claude: What are the main features?
You: Movement, combat, levels, enemies, items...
Claude: Let's break those into tasks and estimate effort.
```

This produces a functional plan, but it misses game-specific concerns: no MDA aesthetic targeting, no core loop validation, no economy flow analysis, no difficulty curves, no scenario walkthrough, no anti-pattern audit.

### With game-spice

The same conversation produces:
- An aesthetic target that filters all scope decisions
- A validated core loop that proves the game has a foundation
- Mechanics chosen from a curated palette, not brainstormed from scratch
- An economy with explicit taps, sinks, and player decisions
- A difficulty curve with recovery mechanics
- Content right-sized by production cost awareness
- A narrated play session proving the design is concrete
- A playtest plan with specific questions
- An anti-pattern audit confirming the scope is realistic

The plan doesn't just list what to build — it explains *why* each piece exists and *how* they fit together.

---

## What's Next

Your MLP is planned and beads are created. From here:

1. **Start building** — Run `/line:prep` to begin the implementation cycle
2. **Follow the tracer bullet** — Build the 1-room, 1-enemy prototype first
3. **Playtest early** — Self-test after the tracer bullet, before adding features
4. **Iterate** — The plan will change. That's fine. Update beads as you learn.

For the implementation workflow, see the [Line Cook tutorial](https://github.com/smileynet/line-cook/blob/main/docs/tutorial-claude-code.md).
