---
name: game-design-frameworks
description: Game design analysis frameworks and thinking tools. Use when brainstorming game ideas, analyzing game mechanics, designing player experiences, evaluating engagement loops, or planning game narrative. Covers MDA framework, core loop design, player motivation, systems thinking, narrative integration, progression systems.
---

# Game Design Frameworks

Thinking tools for analyzing and designing game experiences.

## Quick Reference

### Framework Selection Guide

| When you need to... | Use this framework |
|---|---|
| Analyze why a mechanic is/isn't fun | MDA Framework |
| Design what the player does repeatedly | Core Loop Design |
| Understand what motivates players | Player Motivation (SDT) |
| Balance challenge vs skill | Difficulty & Challenge Design |
| Design interconnected systems | Systems Thinking |
| Integrate story with gameplay | Narrative Integration |
| Make actions feel good | Game Feel & Juice |
| Teach the player how to play | Onboarding Patterns |
| Design long-term engagement | Progression Systems |
| Design resource economy | Game Economy Design |
| Plan content scope and level pacing | Content & Level Planning |
| Discover and combine mechanics | Game Mechanics Palette |
| Visualize the player experience | Game Scenario Walkthrough |

### One-Liner Summaries

| Framework | Key Insight |
|-----------|-------------|
| MDA | Design mechanics, but players experience aesthetics |
| Core Loops | If the 30-second loop isn't fun, nothing else matters |
| SDT | Autonomy + competence + relatedness = intrinsic motivation |
| Flow | Too easy = boredom, too hard = frustration, just right = flow |
| Systems Thinking | Interesting games emerge from system interactions |
| Narrative | Story and mechanics should reinforce, not contradict |

## MDA Framework

**Mechanics → Dynamics → Aesthetics**

Designers build mechanics. Players experience aesthetics. Dynamics are what emerge in between.

| Layer | Definition | Example (Chess) |
|-------|-----------|-----------------|
| **Mechanics** | Rules, systems, algorithms | Pieces move in defined patterns |
| **Dynamics** | Behaviors that emerge from play | Opening strategies, sacrifices, tempo |
| **Aesthetics** | Emotional responses in the player | Challenge, discovery, competition |

### The 8 Aesthetics

| Aesthetic | Description | Games Known For It |
|-----------|-------------|-------------------|
| **Sensation** | Sensory pleasure | Journey, Flower |
| **Fantasy** | Make-believe, roleplay | Elder Scrolls, D&D |
| **Narrative** | Drama, story unfolding | Last of Us, Disco Elysium |
| **Challenge** | Obstacle course, mastery | Dark Souls, Celeste |
| **Fellowship** | Social cooperation | It Takes Two, MMOs |
| **Discovery** | Exploration, finding secrets | Outer Wilds, Metroidvanias |
| **Expression** | Self-expression, creativity | Minecraft, Dreams |
| **Submission** | Relaxation, pastime | Animal Crossing, idle games |

### Using MDA for Planning

1. **Pick 1-2 target aesthetics** — your game can't excel at all 8
2. **Design mechanics that produce dynamics leading to those aesthetics**
3. **Test by asking:** "Does this mechanic create moments of [target aesthetic]?"

**Common mistake:** Designing mechanics that feel logical but don't produce the target aesthetic. A "challenge" game needs mechanics that create near-misses and skill growth, not just difficulty.

## Core Loop Design

### Action → Reward → Reinvestment

```
    ┌──────────┐
    │  ACTION  │ ← Player does something
    └────┬─────┘
         │
    ┌────▼─────┐
    │  REWARD  │ ← Game responds positively
    └────┬─────┘
         │
    ┌────▼──────────┐
    │ REINVESTMENT   │ ← Reward enables/motivates next action
    └────┬──────────┘
         │
         └──→ Back to ACTION
```

### Evaluating Loop Strength

| Quality | Strong Loop | Weak Loop |
|---------|------------|-----------|
| Agency | Player chooses actions meaningfully | Optimal path is obvious |
| Feedback | Immediate, clear, satisfying | Delayed, ambiguous |
| Variation | Same loop, different situations | Repetitive sameness |
| Growth | Player skill improves over time | No skill progression |
| Investment | Rewards open new possibilities | Rewards are cosmetic only |

### Nested Loops

Games have loops at multiple timescales:

| Loop Level | Timescale | Example (Hades) |
|------------|-----------|-----------------|
| **Micro** | 1-5 seconds | Dodge, attack, use ability |
| **Core** | 30-60 seconds | Clear room, choose reward, enter next room |
| **Meta** | 5-30 minutes | Complete a run, unlock permanent upgrades |
| **Macro** | Hours+ | Unlock story, build relationships, master weapons |

**Rule:** Get the micro and core loops right first. Meta and macro loops can't save a boring core.

## Player Motivation

### Self-Determination Theory (SDT)

Three innate psychological needs that drive intrinsic motivation:

| Need | Definition | Game Design Application |
|------|-----------|----------------------|
| **Competence** | Feeling effective and mastering challenges | Clear skill progression, appropriate difficulty, meaningful feedback |
| **Autonomy** | Feeling in control of your choices | Multiple valid strategies, player-driven pacing, meaningful choices |
| **Relatedness** | Feeling connected to others | Co-op, competition, shared experiences, NPCs that feel real |

### Intrinsic vs Extrinsic Motivation

| Type | Driven By | Game Example | Durability |
|------|-----------|-------------|------------|
| **Intrinsic** | Activity is inherently enjoyable | Playing because combat feels great | Long-lasting |
| **Extrinsic** | External reward for activity | Playing to fill a progress bar | Fades when reward stops |

### The Overjustification Effect

Adding extrinsic rewards to an intrinsically fun activity can **reduce** motivation.

**Warning signs in game design:**
- Players grind unfun content for rewards instead of enjoying gameplay
- Removing daily login rewards causes player drop-off (they weren't playing for fun)
- Players optimize the fun out of your game to maximize reward efficiency

**Guideline:** Extrinsic rewards should amplify intrinsic fun, not replace it. If players wouldn't do the activity without the reward, the activity needs redesign.

## Difficulty & Challenge → see game-difficulty-design

Flow state, difficulty curves, challenge types, accessibility, recovery mechanics, and boss design are covered in the dedicated difficulty skill. Key concepts:

- **Flow channel** — challenge must match skill; too easy = boredom, too hard = frustration
- **Difficulty curve patterns** — linear, sawtooth, exponential, player-driven, sine wave
- **Challenge types** — kinesthetic, strategic, puzzle, knowledge, social
- **Accessibility** — removing barriers to reach challenge, not eliminating challenge

## Systems Thinking

### Feedback Loops in Games

| Type | Effect | Example |
|------|--------|---------|
| **Positive (reinforcing)** | Rich get richer, snowball effect | Winning team gets more resources → wins more |
| **Negative (balancing)** | Rubber-banding, catch-up mechanics | Losing player gets better items → catches up |

**Design guideline:** Positive feedback loops create decisive, dramatic moments. Negative feedback loops create tension and comebacks. Most games need both.

<details><summary>When to Use Each Loop Type</summary>

**Use positive feedback loops when:**
- You want games/matches to end decisively (not drag on)
- Snowballing creates exciting momentum (racing games, MOBAs)
- Rewarding skilled play is a core aesthetic

**Use negative feedback loops when:**
- Comebacks should be possible (party games, casual multiplayer)
- You want close matches that go down to the wire
- New players need protection from experienced players

**Balancing the two:**
- Most competitive games use positive loops within a round but negative loops between rounds
- Mario Kart: blue shells (negative) keep races close; boost pads (positive) reward good driving
- If your game feels "predetermined after 2 minutes," you need more negative feedback
- If your game "always drags to a stalemate," you need more positive feedback

</details>

### Planning for Emergence

Emergence = simple rules creating complex behavior players didn't expect.

**How to design for emergence:**
1. Create systems that interact (fire + wind, physics + inventory)
2. Give players tools, not solutions
3. Don't hard-code outcomes — let systems resolve naturally
4. Playtest and observe what players discover

**Warning:** Emergence is unpredictable. Budget testing time for discovering (and deciding whether to keep) unintended interactions.

<details><summary>Systems Interaction Planning</summary>

**Approach:** Map systems as nodes, interactions as edges.

```
[Combat] ←→ [Physics]
   ↕            ↕
[Inventory] ←→ [Environment]
```

For each edge, ask:
- What happens when these systems interact?
- Can the player exploit this interaction?
- Is the exploitation fun or game-breaking?
- Does this interaction create interesting choices?

**Rule of thumb:** 3-4 interconnected systems create enough emergence for an MLP. More systems = exponentially more interactions to test.

**Interaction complexity math:**
- 2 systems = 1 interaction to test
- 3 systems = 3 interactions
- 4 systems = 6 interactions
- 5 systems = 10 interactions
- Each interaction can produce multiple emergent behaviors

**The "interesting or exploitable?" decision:**

| System Interaction | Interesting? | Exploitable? | Keep? |
|---|---|---|---|
| Fire + wind = fire spreads | Yes (tactical) | Mildly | Yes — emergent tactics |
| Healing + damage = invincibility | No (bypasses game) | Severely | No — patch it |
| Physics + inventory = item launching | Yes (creative) | Mildly | Yes — embrace it (BotW) |
| Economy + combat = buy-to-win | No (skips gameplay) | Severely | No — cap or rebalance |

**Emergence budget:** For each system interaction you keep, plan 1-2 extra testing sessions to discover unintended combinations. The combinatorial explosion of 4+ systems means some interactions WILL surprise you.

**Do this / not that:**
- DO: Fire spreads to wooden objects → players use torches tactically (simple rules, rich outcomes)
- DON'T: 8 elemental types that each interact differently → 28 interaction pairs to balance
- DO: Physics objects can be stacked → players build creative solutions
- DON'T: Custom scripting for each physics interaction → brittle, untestable

</details>

## Narrative Integration

### 4 Integration Levels

| Level | Description | Example | Scope Cost |
|-------|-------------|---------|-----------|
| **Separated** | Story and gameplay don't interact | Cutscene → gameplay → cutscene | Low |
| **Contextual** | Story gives meaning to gameplay | "You're fighting to save your sister" | Low |
| **Integrated** | Gameplay mechanics serve the story | Losing health = character getting weaker narratively | Medium |
| **Emergent** | Gameplay creates unique stories | Dwarf Fortress, RimWorld, Hades | High |

**For MLP:** Aim for Contextual at minimum. Integrated if your game is narrative-driven. Emergent only if systems support it naturally.

<details><summary>Choosing Integration Level</summary>

**How to decide based on game type and team size:**

| Game Type | Recommended Level | Why |
|---|---|---|
| Puzzle, rhythm, arcade | Separated or Contextual | Story isn't the draw — keep scope low |
| Action, platformer | Contextual | Context motivates without adding scope |
| RPG, adventure | Integrated | Story IS the product — invest here |
| Sandbox, sim | Emergent (if systems support it) | Player-created stories are the point |

**Team size considerations:**
- Solo dev → Separated or Contextual. Integrated narrative requires writing + implementation + testing = significant solo effort
- Small team with a writer → Integrated is achievable
- Emergent narrative comes from systems design, not writing — requires systems-first development

**Branching narrative as scope multiplier:**
- Each meaningful branch doubles content (dialogue, consequences, testing)
- 3 branches with 2 choices each = 8 possible paths to write and test
- For MLP: linear narrative with contextual integration. Branch ONLY if branching IS the core mechanic (visual novels, choice-driven RPGs)

**Environmental storytelling as low-cost alternative:**
- Tell stories through the environment (scattered notes, visual details, item placement)
- No dialogue trees, no voice acting, no branching paths
- Players who want story find it; players who don't can ignore it
- Examples: Dark Souls item descriptions, Gone Home environmental details, BioShock audio logs

</details>

### Ludonarrative Dissonance Test

**Ask:** "Does what the player DOES match what the story SAYS?"

| Dissonance | Mechanic | Narrative | Problem |
|-----------|----------|-----------|---------|
| Ludonarrative | Kill hundreds of enemies | "I'm not a violent person" | Actions contradict character |
| Tonal | Goofy physics | Serious story | Mood clashes |
| Pacing | Urgent main quest | 100 side quests available | Urgency undercut by freedom |

**Guideline:** If you can't resolve dissonance, lean into it (comedy) or restructure the narrative to match the mechanics.

## Game Feel & Juice

### MLP Juice Checklist

Minimum feedback to make core actions feel good:

- [ ] **Screen shake** on impactful actions (hit, explosion, landing)
- [ ] **Hit pause** (1-3 frames freeze on contact)
- [ ] **Sound effect** for every player action
- [ ] **Visual feedback** for state changes (damage flash, pickup glow)
- [ ] **Particle effects** on key moments (death, collection, ability use)

### The Juice-Is-Not-A-Substitute Rule

Juice makes a fun game feel amazing. Juice does NOT make an unfun game fun.

**Test:** Is your game fun with all juice/polish removed? If no, fix the mechanics first.

**Priority order:**
1. Fun mechanics (no juice needed to validate)
2. Functional feedback (player understands what happened)
3. Juice (makes good mechanics feel great)

## Onboarding Patterns

| Pattern | Description | Best For |
|---------|-------------|----------|
| **Learn-by-doing** | Drop player in, introduce mechanics naturally | Action games, platformers |
| **Gated complexity** | Lock advanced mechanics until basics mastered | RPGs, strategy games |
| **Guided tutorial** | Explicit instructions with practice | Complex systems, sims |

<details><summary>Onboarding Design Guidelines</summary>

**Learn-by-doing (preferred for MLP):**
- First room/level teaches ONE mechanic
- Safe environment to experiment
- Fail state is gentle (quick restart, not game over)
- No text walls — show, don't tell

**Common mistakes:**
- Teaching every mechanic in the tutorial before fun starts
- Unskippable tutorials for returning players
- Text-heavy explanations of things players could discover
- Tutorial that's not representative of actual gameplay

</details>

## Progression Systems

| Type | Mechanism | Risk | Scope Cost |
|------|-----------|------|-----------|
| **Skill-based** | Player gets better at the game | Can hit ceiling without external help | Free |
| **Character-based** | Stats/abilities increase over time | Can mask boring core loop | Medium |
| **Content-based** | New levels, areas, enemies unlock | Expensive to produce, consumed quickly | High |
| **Narrative-based** | Story unfolds with progress | Can feel like carrot-on-stick | Medium |
| **Social-based** | Rankings, sharing, competition | Requires player base | Low-Medium |

**For MLP:** Skill-based progression is free (no content cost) and validates core loop strength. If your game isn't fun without character/content progression, the core loop needs work. Resource-based progression requires balance planning `(see game-economy-design → Progression Curves)`.

<details><summary>Progression Design Guidelines</summary>

**Horizontal vs vertical progression:**

| Type | What Changes | When to Use |
|------|-------------|-------------|
| **Vertical** | Player gets stronger (more HP, more damage) | When power fantasy is the aesthetic |
| **Horizontal** | Player gets different options (new abilities, tools) | When variety and expression are the aesthetic |

- Vertical is simpler to implement but has a ceiling — eventually numbers become meaningless
- Horizontal is harder to balance but scales better — new options don't obsolete old ones
- Best approach for most games: primarily horizontal with light vertical (new sword types, not just +1 sword)

**Progression as scope:**
- Skill-based = zero content cost (player improves, game doesn't need new content)
- Character-based = medium cost (need upgrade trees, balance passes)
- Content-based = high cost (every new level/area/enemy requires production)
- Plan progression type based on your production capacity, not just design preference

**Meta-progression planning:**
- Meta-progression = persistent unlocks across runs/sessions (Hades mirror, roguelike unlocks)
- Unlocks should expand options, not just increase power (variety > stats)
- Collection mechanics (unlock all characters, find all items) provide long-term goals cheaply
- Prestige systems (reset for permanent bonus) extend endgame but require careful economy balance `(see game-economy-design → Genre-Specific Economy Patterns)`

**Layering progression:**
- Start with skill-based (core loop mastery)
- Add character-based (new tools, not just bigger numbers)
- Layer content-based (new contexts for core loop)
- Weave narrative (motivation to continue)

**Red flags:**
- Players need progression to tolerate gameplay → fix the gameplay
- Progression makes the game easier instead of different → adjust curve
- All progression is numeric (+5 damage) → add qualitative variety
- Progression masks a boring core loop — the most dangerous anti-pattern. If you remove all progression and the game isn't fun for 5 minutes, no amount of unlocks will save it

</details>

## See Also

- **game-scoping** — Apply these frameworks to scope decisions `(see game-scoping → MLP Scoping Process)`
- **game-antipatterns** — Common mistakes when applying these frameworks incorrectly `(see game-antipatterns → Kitchen Sink Design)`
- **game-economy-design** — Resource systems, taps & sinks, progression curves `(see game-economy-design → Taps & Sinks Framework)`
- **game-playtesting** — Validate design decisions with real players `(see game-playtesting → The 3-Question Framework)`
- **game-scenario-walkthrough** — Narrate the player experience to test framework application `(see game-scenario-walkthrough → The 5-Beat Structure)`
- **game-difficulty-design** — Flow state, difficulty curves, challenge types, accessibility, boss design `(see game-difficulty-design → Flow State & Difficulty)`
- **game-content-planning** — Level design, pacing, content scope estimation, procedural vs handcrafted `(see game-content-planning → Pacing Through Content)`
- **game-mechanics-palette** — Browse and combine mechanics from a curated catalog `(see game-mechanics-palette → Mechanics Palette)`
