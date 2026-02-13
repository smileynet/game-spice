---
name: game-mechanics-palette
description: Curated catalog of game mechanics organized for discovery and creative combination. Use when brainstorming game ideas, exploring what mechanics to include, combining mechanics from different genres, evaluating mechanic compatibility, or building a game concept from scratch. Covers movement, combat, building, collection, cards, management, social, puzzle, temporal, and progression mechanics with mashup patterns and guided exploration prompts.
---

# Game Mechanics Palette

A vocabulary of game mechanics organized by what the player **does** — for browsing, evaluating, and creatively combining during brainstorming.

## Quick Reference — Mechanics at a Glance

| Category | Core Verbs | Representative Mechanics |
|----------|-----------|--------------------------|
| **Movement** | Move, jump, traverse | Platforming, flight, teleportation, wall-running, grappling |
| **Combat** | Attack, defend, evade | Melee combo, ranged/projectile, parry/counter, stealth takedown, AoE |
| **Building & Crafting** | Place, construct, shape | Construction, crafting recipes, terraforming, tower placement, automation |
| **Collection & Resource** | Gather, harvest, extract | Looting, fishing, mining, farming, foraging |
| **Cards & Deckbuilding** | Draw, play, build | Draw/play cycles, deck construction, hand management |
| **Management** | Allocate, optimize, direct | City/base building, unit control, scheduling |
| **Social & Negotiation** | Trade, persuade, ally | Trading, diplomacy, recruitment, relationship building |
| **Puzzle & Logic** | Solve, match, deduce | Pattern matching, spatial reasoning, physics manipulation, sequencing |
| **Temporal** | Time, react, sync | Turn-based, real-time with pause, time rewind, rhythm/timing |
| **Progression & Meta** | Unlock, upgrade, evolve | Skill trees, equipment, mutations, roguelike meta-progression |

## Mechanics Palette

### Movement

<details><summary>Platforming, flight, teleportation, wall-running, grappling, swimming</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Platforming** | Jump between surfaces with gravity and momentum | `platformer` `action` | `physics` | Low |
| **Flight** | Free 3D or 2D aerial movement, often fuel-limited | `flight-sim` `action-adventure` | `physics` | Medium |
| **Teleportation** | Instant repositioning — point-to-point or line-of-sight | `FPS` `puzzle` `action` | `spatial` | Low |
| **Wall-running** | Temporary traversal along vertical surfaces | `action` `platformer` | `physics` | Medium |
| **Grappling** | Swing or pull toward anchor points — extends reach | `action-adventure` `platformer` | `physics` | Medium |
| **Swimming** | Underwater movement with oxygen/buoyancy constraints | `action-adventure` `survival` | `physics` `resource` | Medium |

**Design notes:** Movement mechanics define how the game *feels* second-to-second. The best movement mechanics create skill expression — the gap between a beginner and expert using the same system. Consider: does your movement mechanic have a skill ceiling?

</details>

### Combat

<details><summary>Melee combo, ranged/projectile, parry/counter, stealth takedown, AoE, summon/companion</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Melee combo** | Chained close-range attacks with timing windows | `action` `fighting` `character-action` | `physics` `timing` | Medium |
| **Ranged/projectile** | Aim and fire at targets from distance | `FPS` `TPS` `shoot-em-up` | `physics` `spatial` | Low |
| **Parry/counter** | Timed defensive response that punishes attackers | `action` `fighting` `soulslike` | `timing` | Medium |
| **Stealth takedown** | Eliminate unaware enemies for bonus effect | `stealth` `immersive-sim` | `spatial` `AI` | High |
| **AoE (area of effect)** | Attacks that hit multiple targets in a zone | `RPG` `RTS` `MOBA` | `spatial` | Low |
| **Summon/companion** | Deploy AI allies that fight alongside the player | `RPG` `strategy` `action` | `AI` `economy` | High |

**Design notes:** Combat mechanics are frequently the core loop. Decide early: is combat about *precision* (timing, aim) or *decisions* (ability selection, positioning)? This choice cascades into every other system.

</details>

### Building & Crafting

<details><summary>Construction, crafting recipes, terraforming, tower placement, automation</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Construction** | Place structures in the world with snapping or free-form | `sandbox` `city-builder` `survival` | `spatial` `economy` | Medium |
| **Crafting recipes** | Combine ingredients into new items via known formulas | `survival` `RPG` `adventure` | `economy` `inventory` | Medium |
| **Terraforming** | Reshape terrain — dig, raise, flatten, sculpt | `sandbox` `god-game` | `spatial` `physics` | High |
| **Tower/turret placement** | Position defensive structures along enemy paths | `tower-defense` `RTS` | `spatial` `economy` | Low |
| **Automation** | Build systems that produce, transport, or process without player input | `factory` `idle` `sandbox` | `economy` `logic` | High |

**Design notes:** Building mechanics create ownership — players value what they've made. Consider destruction too: if nothing can threaten what players build, building loses tension. If everything is easily destroyed, building feels pointless.

</details>

### Collection & Resource

<details><summary>Looting, fishing, mining, farming, foraging, bartering</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Looting** | Collect items/currency from defeated enemies or containers | `RPG` `action` `roguelike` | `economy` `random` | Low |
| **Fishing** | Timing or reflex minigame to catch aquatic resources | `RPG` `life-sim` `adventure` | `timing` `economy` | Low |
| **Mining** | Extract resources from the environment, often with tool progression | `survival` `sandbox` `RPG` | `economy` `spatial` | Low |
| **Farming** | Plant, tend, and harvest crops over time cycles | `life-sim` `survival` `RPG` | `economy` `timing` | Medium |
| **Foraging** | Discover and gather scattered environmental resources | `survival` `adventure` `open-world` | `spatial` `economy` | Low |
| **Bartering** | Exchange resources with NPCs at fixed or variable rates | `RPG` `sim` `adventure` | `economy` | Low |

**Design notes:** Collection mechanics feed other systems — they're taps in your economy. The act of collecting should be satisfying on its own (good game feel), not just a chore to fuel crafting `(see game-economy-design → Taps & Sinks Framework)`.

</details>

### Cards & Deckbuilding

<details><summary>Draw/play cycles, deck construction, hand management, card combos, drafting</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Draw/play cycle** | Draw cards each turn, play within resource limits | `card-game` `deckbuilder` | `economy` `random` | Low |
| **Deck construction** | Build a persistent deck from a card pool between encounters | `deckbuilder` `roguelike` `TCG` | `economy` `strategy` | Medium |
| **Hand management** | Decide what to play, hold, or discard from limited hand | `card-game` `board-game` | `strategy` | Low |
| **Card combos** | Cards that amplify each other when played in sequence or combination | `deckbuilder` `TCG` | `strategy` `economy` | Medium |
| **Drafting** | Choose cards from shared pools, denying opponents options | `TCG` `board-game` `auto-battler` | `strategy` `social` | Medium |

**Design notes:** Card mechanics excel at creating meaningful choices with constrained randomness. The deck IS the progression system — every card added or removed is a permanent strategic decision. Consider: does adding a card always make the deck better, or is deck thinning part of the strategy?

</details>

### Management

<details><summary>City/base building, unit control, scheduling, worker placement, supply chains</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **City/base building** | Construct and expand a settlement, balancing needs and growth | `city-builder` `RTS` `survival` | `economy` `spatial` | High |
| **Unit control** | Direct multiple agents with distinct roles and abilities | `RTS` `tactics` `auto-battler` | `AI` `spatial` `strategy` | High |
| **Scheduling/time management** | Allocate limited time across competing activities | `life-sim` `management` `visual-novel` | `economy` `strategy` | Medium |
| **Worker placement** | Assign limited workers to action slots for returns | `board-game` `strategy` | `economy` `strategy` | Medium |
| **Supply chains** | Connect production nodes — output of one feeds input of another | `factory` `city-builder` `tycoon` | `economy` `logic` | High |

**Design notes:** Management mechanics create satisfying optimization problems. The key tension: efficiency vs resilience. A perfectly optimized system is fragile; a resilient system wastes resources. Let players choose where on that spectrum to sit.

</details>

### Social & Negotiation

<details><summary>Trading, diplomacy, recruitment, relationship building, bluffing</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Trading** | Exchange resources or items with other players at negotiated rates | `strategy` `MMO` `board-game` | `economy` `social` | Medium |
| **Diplomacy** | Form alliances, declare rivalries, negotiate treaties | `grand-strategy` `4X` `board-game` | `social` `AI` | High |
| **Recruitment** | Convince NPCs or units to join the player's cause | `RPG` `tactics` `strategy` | `economy` `social` | Medium |
| **Relationship building** | Deepen bonds with characters through choices and gifts | `life-sim` `RPG` `visual-novel` | `social` `narrative` | Medium |
| **Bluffing** | Mislead opponents about your intentions, hand, or resources | `card-game` `board-game` `social-deduction` | `social` `strategy` | Low |

**Design notes:** Social mechanics are hardest to implement with AI (NPCs that feel like real negotiators) but easiest in multiplayer (other humans provide the depth). For single-player, relationship building is the most MLP-viable — it needs good writing more than complex AI.

</details>

### Puzzle & Logic

<details><summary>Pattern matching, spatial reasoning, physics manipulation, sequencing, deduction</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Pattern matching** | Recognize and replicate or align visual/audio patterns | `puzzle` `rhythm` `match-3` | `logic` | Low |
| **Spatial reasoning** | Rotate, fit, or arrange objects in 2D/3D space | `puzzle` `Tetris-like` `sokoban` | `spatial` `logic` | Low |
| **Physics manipulation** | Use simulated physics to solve environmental challenges | `puzzle` `sandbox` `platformer` | `physics` | Medium |
| **Sequencing** | Arrange actions or elements in correct order | `puzzle` `adventure` `programming` | `logic` | Low |
| **Deduction** | Eliminate possibilities through clues and logic | `mystery` `board-game` `adventure` | `logic` `narrative` | Medium |

**Design notes:** Puzzle mechanics have a consumption problem — once solved, they lose value. Solutions: procedural generation (new puzzles each time), mastery optimization (solve faster/better), or integrate puzzles into other systems so the puzzle-solving is a means, not the end.

</details>

### Temporal

<details><summary>Turn-based, real-time with pause, time rewind, rhythm/timing, simultaneous turns</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Turn-based** | Players and AI alternate discrete actions — no time pressure | `RPG` `tactics` `strategy` `board-game` | `strategy` | Low |
| **Real-time with pause** | Continuous action with ability to pause and issue orders | `CRPG` `RTS` `sim` | `strategy` `timing` | Medium |
| **Time rewind** | Undo actions or reverse time to retry segments | `puzzle` `action` `platformer` | `timing` `logic` | High |
| **Rhythm/timing** | Actions synced to music beat or precise timing windows | `rhythm` `action` `RPG` | `timing` | Medium |
| **Simultaneous turns** | All players plan moves simultaneously, then resolve together | `board-game` `tactics` `strategy` | `strategy` `social` | Medium |

**Design notes:** Temporal mechanics define the pacing and stress level of your game. Turn-based = strategic thinking, real-time = execution skill, rhythm = pattern mastery. Hybrid approaches (real-time with pause, simultaneous turns) try to get both — at the cost of UI complexity.

</details>

### Progression & Meta

<details><summary>Skill trees, equipment, mutations, roguelike meta-progression, prestige, unlockables</summary>

| Mechanic | Description | Genre Origins | System Type | Complexity |
|----------|-------------|---------------|-------------|------------|
| **Skill trees** | Branching ability unlocks that define player builds | `RPG` `action-RPG` `MOBA` | `economy` `strategy` | Medium |
| **Equipment/loadout** | Swap gear that changes stats or abilities before encounters | `RPG` `looter-shooter` `tactics` | `economy` `strategy` | Medium |
| **Mutations/modifiers** | Random or chosen modifiers that alter mechanics each run | `roguelike` `roguelite` `action` | `random` `strategy` | Medium |
| **Roguelike meta-progression** | Persistent unlocks across failed runs — expand the possibility space | `roguelike` `roguelite` | `economy` `strategy` | Medium |
| **Prestige/rebirth** | Reset progress for permanent bonuses — compress the growth loop | `idle` `incremental` `RPG` | `economy` | Medium |
| **Unlockables** | New characters, modes, or content gated behind achievements | `action` `platformer` `fighting` | `economy` | Low |

**Design notes:** Progression mechanics are how your game stays interesting over hours, not minutes. The best progression expands *options* (horizontal) rather than just *numbers* (vertical) `(see game-design-frameworks → Progression Systems)`.

</details>

## Mashup Patterns

Named strategies for combining mechanics from different categories. Each creates a distinct design space.

| Pattern | How It Works | Example Games |
|---------|-------------|---------------|
| **Loop Nesting** | One genre's mechanics as core loop, another's as meta loop | Slay the Spire (roguelike meta + deckbuilder core), FTL (roguelike meta + management core) |
| **Verb + Context Shift** | Familiar mechanic in an unfamiliar setting or genre context | Battle Chef Brigade (cooking + combat), Pyre (basketball + visual novel) |
| **Opposing Forces** | Two mechanics that create natural tension by pulling in opposite directions | Fortnite (building + destruction), MGSV (stealth + loud combat), Subnautica (exploration + survival pressure) |
| **Scale Shift** | Micro-level mechanic applied at macro scale, or vice versa | Into the Breach (puzzle thinking at tactics scale), Katamari (collection at physics-world scale) |
| **System Merger** | Two independent systems that share a scarce resource, forcing trade-offs | Inscryption (deckbuilding + escape room share attention), Hades (combat + relationship building share runs) |

<details><summary>Mashup Pattern Deep Dive</summary>

### Loop Nesting

The most common mashup — layer a meta-progression structure around a different genre's core gameplay.

**Formula:** [Meta structure] wraps [Core gameplay]
- Roguelike meta + deckbuilding core = Slay the Spire
- Roguelike meta + tactics core = Into the Breach
- Idle meta + RPG core = many idle RPGs
- Campaign meta + puzzle core = Puzzle Quest

**Why it works:** The meta layer provides long-term motivation and variety. The core provides moment-to-moment engagement. Each solves the other's weakness.

**Pitfall:** If the meta layer rewards grinding over skill in the core, players optimize the fun out. Ensure meta-progression expands options, doesn't trivialize the core.

### Verb + Context Shift

Take a well-understood mechanic and drop it into a genre where it doesn't "belong."

**Formula:** [Known mechanic] in [Unexpected context]
- Cooking (crafting) in combat scenarios = Battle Chef Brigade
- Basketball (sports) in narrative RPG = Pyre
- Typing (skill) in horror/action = Typing of the Dead

**Why it works:** Players already know the mechanic, so onboarding is cheap. The new context makes familiar actions feel fresh and creates unexpected dynamics.

**Pitfall:** The shifted mechanic must actually serve the new context. If it feels bolted on rather than integrated, the novelty wears off quickly.

### Opposing Forces

Pair mechanics that inherently conflict — players must constantly balance between them.

**Formula:** [Mechanic A] pulls against [Mechanic B]
- Building (create) vs destruction (threaten) = Fortnite, Minecraft with Creepers
- Stealth (patience) vs action (aggression) = Dishonored, MGSV
- Exploration (wander) vs survival pressure (return to safety) = Subnautica, Don't Starve

**Why it works:** Tension creates interesting decisions. Every moment spent on one mechanic has an opportunity cost in the other. Players develop personal styles based on which side they favor.

**Pitfall:** If one side dominates (stealth is always better than combat, or vice versa), the tension collapses. Balance so both approaches are viable.

### Scale Shift

Apply a mechanic at a different scale than its genre of origin.

**Formula:** [Micro mechanic] at [Macro scale] or [Macro mechanic] at [Micro scale]
- Puzzle solving (micro) at tactics scale (macro) = Into the Breach
- Collection (micro) at world-physics scale (macro) = Katamari Damacy
- City management (macro) at personal/survival scale (micro) = This War of Mine

**Why it works:** The scale change creates novel decision-making. Familiar mechanics feel new when the consequences operate at a different level.

**Pitfall:** The shifted scale must still produce readable feedback. If a micro mechanic scales up but the player can't perceive the consequences (too many units, too slow to see results), the novelty collapses into confusion.

### System Merger

Two systems that could each be their own game share a limited resource (time, currency, attention).

**Formula:** [System A] and [System B] compete for [Shared resource]
- Deckbuilding + escape room share player attention = Inscryption
- Combat + relationship building share run time = Hades
- Farming + dungeon crawling share seasonal time = Stardew Valley (with combat caves)

**Why it works:** The shared resource forces trade-offs that neither system creates alone. Players must decide how much of the scarce resource to invest in each system, creating a meta-strategy layer.

**Pitfall:** If one system is clearly more rewarding than the other, players will ignore the weaker system. Both must provide meaningful returns on investment.

</details>

## Guided Exploration Prompts

Use these prompts to walk through mechanic discovery and combination during brainstorming. Each step builds on the previous.

### 1. Core Verb Discovery

> **"What does the player DO most often? Pick a single verb."**

Start from the action, not the genre. "Jump," "shoot," "build," "match," "trade" — the core verb determines which mechanic categories to browse first. If the user can't pick one verb, they may need to brainstorm the fantasy first (what does the player *feel like*?) and work backward to the verb.

### 2. Palette Browsing

> **"Here are the mechanics in [category]. Which resonate with your vision? Pick 1-3."**

Open the relevant `<details>` category from the palette above. Don't present all categories — start with the one matching the core verb, then offer one adjacent category for variety. Look at genre origins and system types to find mechanics that share infrastructure.

### 3. Cross-Genre Raid

> **"What's a mechanic from a completely different genre that could add surprise?"**

Pick a category that has zero overlap with the current selections. Present 2-3 mechanics from that category and ask: "What if your [core verb] game also had [unexpected mechanic]?" Use the mashup patterns to frame the combination. This is where the most creative ideas emerge.

### 4. Tension Check

> **"Do these mechanics create interesting friction, or do they fight each other?"**

Evaluate the selected mechanics as a set:
- **Good tension:** Mechanics pull in different directions, creating choices (explore vs. survive, build vs. defend)
- **Bad friction:** Mechanics need contradictory player skills or moods (twitch reflexes AND slow deliberation in the same moment)
- **No tension:** Mechanics all reinforce the same thing without trade-offs (power fantasy with no cost)

### 5. Loop Integration

> **"How do these mechanics feed into each other? Can you trace a core loop?"**

Map the mechanics into a loop: Action → Reward → Reinvestment → Action. If a mechanic doesn't connect to the loop, it's a side system — fine for a full game, but cut it for MLP `(see game-design-frameworks → Core Loop Design)`.

### 6. Aesthetic Alignment

> **"Which MDA aesthetics does this combination serve?"**

Check the selected mechanics against the 8 MDA aesthetics `(see game-design-frameworks → MDA Framework)`. A strong combination serves 1-2 aesthetics clearly. If the mechanics point in 4+ aesthetic directions, the game lacks focus — narrow down.

## See Also

- **game-design-frameworks** — MDA for evaluating mechanic combinations, core loop design for integration testing `(see game-design-frameworks → MDA Framework)`
- **game-scoping** — Turn mechanic selections into an MLP scope `(see game-scoping → MLP Scoping Process)`
- **game-antipatterns** — Kitchen Sink warning: too many mechanics without integration `(see game-antipatterns → Kitchen Sink Design)`
- **game-economy-design** — Resource mechanics need economy planning `(see game-economy-design → Taps & Sinks Framework)`
- **game-difficulty-design** — Challenge type selection follows from mechanic choices `(see game-difficulty-design → Challenge Types)`
