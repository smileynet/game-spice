---
name: game-content-planning
description: Level design and content scope planning. Use when planning level design, content production scope, pacing, procedural generation decisions, environment design, tutorial levels, world structure, or estimating content costs. Covers world structure, content-to-mechanic planning, pacing, procedural vs handcrafted, content reuse, content sequencing.
---

# Content & Level Planning

Plan content scope before building. Content is the most expensive part of most games — every hour of content costs many hours to produce.

## Quick Reference

### World Structure Decision

| Structure | Player Freedom | Scope Cost | Best For |
|---|---|---|---|
| **Linear** | Low — one path forward | Low | Platformer, puzzle, narrative |
| **Hub-and-spoke** | Medium — choose order within hub | Medium | Zelda-style, RPG, metroidvania-lite |
| **Open world** | High — go anywhere | Very High | Sandbox, exploration, RPG |
| **Metroidvania** | Medium — gated by abilities | High | Exploration, ability-based progression |
| **Procedural** | Variable | High (to do well) | Roguelike, survival, infinite runners |

**Decision rule:** Choose the lowest-freedom structure that serves your core loop. More freedom = more content to fill the space = more scope.

### Content Scope Estimation

| Content Type | Rough Production Ratio | Notes |
|---|---|---|
| Handcrafted level | 10-40 hours per 5 min of play | Includes design, art, testing, iteration |
| Enemy type | 2-5 days each | Design, art, animation, AI, balance |
| Boss encounter | 1-3 weeks each | High-impact but expensive |
| Cutscene/dialogue | 2-8 hours per minute | Writing, implementation, testing |
| Procedural system | Weeks-months upfront | Amortizes over infinite content |

**Key principle:** Content production does not scale linearly. Level 1 takes 2 days. Level 20 takes 2 days. But you need 20x the motivation to build level 20 as level 1. Plan for production fatigue.

### Content Architecture Principle

> Poor tooling makes equivalent content cost 10x more. Invest in content tools proportionally to how much content you'll build — but not before you know WHAT you're building.

## Content-to-Mechanic Planning

<details><summary>Meaningful Mechanic Application</summary>

Every mechanic in your game needs sufficient meaningful application — not a ratio, a quality test.

**The quality test:** Does this mechanic have enough chances to create memorable moments? If not, it doesn't justify its existence.

**Decision framework:**

| Mechanic Usage | Assessment | Action |
|---|---|---|
| Used in >50% of content | Core mechanic | Keep — this IS the game |
| Used in 20-50% of content | Supporting mechanic | Keep if it adds meaningful variety |
| Used in <20% of content | Niche mechanic | Cut unless it creates peak moments |
| Used once | Gimmick | Cut — not worth the dev cost |

**MLP content target:** Minimum needed to prove core loop is fun. Usually 1-3 levels or zones.

**Critical rule:** If core loop isn't fun with minimum content, more content won't save it. Fix the loop first, then build content around the proven loop `(see game-antipatterns → Premature Content)`.

</details>

## Pacing Through Content

<details><summary>Kishōtenketsu (Nintendo Pacing)</summary>

Nintendo's 4-step level design philosophy:

| Step | Japanese | Purpose | Example (Mario) |
|------|----------|---------|----------------|
| **Ki** | Introduction | Present the mechanic safely | See moving platform, jump on it |
| **Shō** | Development | Explore the mechanic | Multiple platforms, varying gaps |
| **Ten** | Twist | Surprise or combine mechanics | Platform over hazard, timed jump |
| **Ketsu** | Conclusion | Test mastery, reward | Fast sequence combining all of the above |

**Each section is a self-contained showcase (~3-5 minutes).** A full level might contain 2-3 kishōtenketsu sequences.

**Why this works:** Players learn by doing, in escalating complexity, with a satisfying test at the end. No tutorials needed.

</details>

<details><summary>Beat-Based Pacing</summary>

**Valve's beat types (Left 4 Dead, Half-Life):**

| Beat Type | Purpose | Intensity |
|-----------|---------|-----------|
| **Explore** | Discover space, find resources, absorb story | Low |
| **Combat** | Engage enemies, test skills | High |
| **Choreography** | Scripted events, spectacle, story moments | Medium |
| **Puzzle** | Slow down, think, solve | Medium-Low |

**The pacing principle:** Troughs are as important as peaks. After a high-intensity combat section, players need a low-intensity exploration section to recover and process.

**Action/rest/reward pattern:**

```
Intensity
  ↑
  │     ╱╲        ╱╲
  │    ╱  ╲      ╱  ╲
  │   ╱    ╲    ╱    ╲
  │  ╱      ╲  ╱      ╲
  │ ╱    R   ╲╱    R   ╲
  └───────────────────────→ Time
     Peak  Rest  Peak  Rest
```

- Every intensity peak should be followed by a rest period
- Rest periods are opportunities for exploration, story, resource management
- Reward moments mark the transition from rest to the next peak
- Peaks should gradually increase in intensity across a session

</details>

## Environment-as-Teacher

<details><summary>Level Design as Tutorial</summary>

The best tutorials don't feel like tutorials. The environment teaches through play.

**First level design principles:**
- Teaches ONE mechanic in a safe environment
- Show, don't tell — players learn by doing
- Failure is low-cost (quick restart, nearby checkpoint)
- No text instructions unless absolutely necessary

**Level ordering presents mechanics in order of complexity:**
1. Level 1: Core mechanic only (jump)
2. Level 2: Core + one twist (jump + moving platform)
3. Level 3: Previous mechanics + new element (jump + moving platform + hazard)
4. Each level assumes mastery of all previous levels

**Case study — Inside (Playdead):**
- First 8 minutes teach all basic mechanics
- No text, no UI prompts, no tutorial screens
- Each puzzle room introduces exactly one concept
- Player never breaks immersion to learn
- `(see game-design-frameworks → Onboarding Patterns)`

**Cost consideration:** Environmental teaching requires level design skill and iteration time. Budget 2-3x more time for early levels that serve as tutorials.

</details>

## Procedural vs Handcrafted

<details><summary>The Procedural Generation Decision</summary>

| Factor | Handcrafted | Procedural | Hybrid |
|--------|------------|------------|--------|
| **Quality per unit** | High (designed) | Variable (algorithmic) | Medium-High |
| **Content volume** | Limited by dev time | Unlimited | Large |
| **Upfront cost** | Low per level | High (system design) | High |
| **Iteration cost** | High per level | Low (tweak parameters) | Medium |
| **Player experience** | Curated, intentional | Fresh, surprising | Best of both |
| **Pacing control** | Full control | Limited | Moderate |

**Procedural generation is NOT a scope-reduction tool.** It often increases total scope:
- Designing the generation system takes weeks-months
- Testing requires validating thousands of possible outputs
- Bad seeds/layouts need detection and prevention
- Players notice and resent obviously random content

**When procedural IS appropriate:**
- Replayability is core to the experience (roguelikes)
- Content volume would be impossible to handcraft (infinite runners)
- Variety itself is the value proposition (Minecraft worlds)

**When to handcraft instead:**
- Pacing and difficulty control matter (narrative games)
- Each piece of content needs to be memorable (puzzle games)
- Total content count is manageable (<20 levels)

**Hybrid approach:** Procedural rough draft → hand-curate results. Generate a hundred levels, pick the best 20, polish by hand. Spelunky uses authored "chunks" that get procedurally assembled.

**Decision questions:**
1. Will procgen speed up dev time? (Usually no — it shifts time from content creation to system engineering)
2. Will it add something players actively want? (Replayability, surprise, variety)
3. Can you test it thoroughly? (Every possible output needs to be at least playable)
4. If adding procgen as a buzzword — don't.

</details>

## Content Reuse Strategies

<details><summary>Making Less Feel Like More</summary>

The most polished games reuse content intelligently. Players don't notice reuse if the experience feels different.

**Palette swap / Variant enemies:**
- Same model or base, different abilities or behavior
- Spyro: same enemy archetype across worlds with themed skins and one new trick
- 3 base enemy types x 3 behavior variants = 9 perceived enemies

**Remixed encounters:**
- Same assets, different combinations and contexts
- God of War Valkyries: same move pool, each Valkyrie uses a unique subset
- A room with 2 fast enemies feels completely different from 1 fast + 1 ranged

**Modular level building:**
- Design reusable building blocks (rooms, corridors, arenas)
- Rotate, reskin, mirror, and remix modules
- Players recognize spaces subconsciously (comfort) but don't feel repetition if context changes

**Environmental reskinning:**
- Same layout structure, different theme (forest → cave → temple)
- New visuals + new enemy variants in familiar structure
- Players feel progression through visual novelty

**The quality principle:** 10 well-designed levels > 50 mediocre levels. A memorable level teaches a mechanic, tests mastery, and delivers a moment. A filler level just exists.

</details>

## Content Anti-Patterns

<details><summary>Common Content Planning Mistakes</summary>

**Filler content:**
- Content that pads game length without adding quality
- "Collect 100 feathers" quests, identical fetch quests, copy-paste environments
- Players can feel filler — it damages trust in the game
- Test: would the game be worse if this content were removed? If "about the same," it's filler

**Content gates blocking fun:**
- Don't gate the core experience behind unfun side content
- If players must grind boring content to reach the fun part, they'll quit before getting there
- The best content should be on the critical path, not hidden behind optional walls

**"Content is scope" underestimation:**
- Costs don't scale linearly — production fatigue, quality variance, testing burden
- Player falloff: statistically, most players won't see late-game content (only ~20% finish most games)
- Front-load your best content — don't save the best for last where few will see it

**Content treadmill:**
- Unsustainable cycle of producing content to retain players
- Relevant mainly for live-service, but indie devs fall into it too
- Plan for mechanics that don't require constant new content to remain engaging

**Over-relying on content to compensate for weak mechanics:**
- "Players will love the game once they reach world 3"
- If world 1 isn't fun, world 3 won't save it
- Content adds variety but cannot substitute for a fun core loop
- `(see game-antipatterns → Core Loop Neglect)`

**Premature content production:**
- Building levels before the core loop is proven fun
- Content built around mechanics that later change → wasted work
- Validate fun first, then produce content
- `(see game-antipatterns → Premature Content)`

</details>

## Content Sequencing in Development

<details><summary>When to Build What</summary>

**The content development sequence:**

1. **Validate core loop** — one room/level, programmer art, is it fun?
2. **Minimal content for playtesting** — 2-3 levels proving the loop works across contexts
3. **Tool investment decision** — hack content first, then build tools for what you actually need
4. **Content batching** — build and test in batches (5 levels), not all at once
5. **Polish pass** — iterate on existing content before making more

**Why batching matters:**
- Building 5 levels → playtesting → building 5 more catches problems early
- Building 30 levels → playtesting finds a systematic problem → 30 levels need fixing
- Batch size should match your playtest cadence `(see game-playtesting → Iteration Cadence)`

**Tool investment timing:**
- First 3-5 levels: build by hand, learn what you actually need
- Levels 5-10: identify repetitive tasks, build tools for those specific tasks
- Levels 10+: tools should handle the repetitive parts, designers focus on creative parts
- Never build tools before you know what content you're making

**Sustainable content design:**
- Plan for mechanics that stay fun through repetition (core loop strength)
- Reuse systems: content should leverage existing mechanics in new combinations
- Avoid designing content that requires constant production to retain players
- A game that needs new content every month to stay fun has a core loop problem

</details>

## See Also

- **game-scoping** — Feature cutting applies to content decisions `(see game-scoping → Ruthless Cutting Heuristics)`
- **game-difficulty-design** — Difficulty pacing through content, boss design as content milestones `(see game-difficulty-design → Boss Design as Difficulty Punctuation)`
- **game-scenario-walkthrough** — Narrate content before building it `(see game-scenario-walkthrough → The 5-Beat Structure)`
- **game-economy-design** — Content as economy scope `(see game-economy-design → Economy Validation)`
- **game-antipatterns** — Premature Content anti-pattern `(see game-antipatterns → Premature Content)`
- **game-design-frameworks** — Onboarding patterns for tutorial level design `(see game-design-frameworks → Onboarding Patterns)`
