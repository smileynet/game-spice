---
name: game-antipatterns
description: Common game planning mistakes and how to avoid them. Use when reviewing game plans, checking for scope creep in game projects, evaluating game feature lists, or auditing game design decisions. Covers scope creep, feature bloat, design traps, over-scoping, kitchen sink design.
---

# Game Planning Anti-Patterns

Common mistakes in game planning and how to avoid them.

## Quick Reference

### Top 10 Anti-Patterns

| # | Anti-Pattern | Symptom | Better Approach |
|---|---|---|---|
| 1 | Everything Sounds Fun | Feature list grows every session | 3-feature MLP rule, parking lot for ideas |
| 2 | Feature Creep | "Small" additions that compound | Each addition goes through cutting heuristics |
| 3 | Scope Creep | Requirements shift mid-build | Freeze scope after planning, track changes explicitly |
| 4 | Premature Content | Building levels before fun is proven | Prove core loop with 1 level, then expand |
| 5 | Design in Isolation | Mechanics designed without playtesting | Paper prototype → digital prototype → playtest loop |
| 6 | Juice Addiction | Polish before fun | Remove all juice — is it still fun? |
| 7 | Kitchen Sink Design | Game tries to do everything | Pick 1-2 target aesthetics, cut the rest |
| 8 | Core Loop Neglect | Building features around a weak loop | If core loop isn't fun in 5 min, fix it first |
| 9 | Second System Effect | Overdesigning based on past project | Scope to current project's needs, not past regrets |
| 10 | GDD Tome | 50+ page design document | Living doc, max 5 pages for MLP scope |

## Scope Anti-Patterns

### Everything Sounds Fun

**What it looks like:** Brainstorming produces 30 great ideas. Every feature sounds exciting. The plan includes all of them because "they're all important."

**Why it happens:** Creative enthusiasm. In brainstorming, ideas feel weightless — there's no sense of the implementation cost. Every feature sounds like "just a day or two."

**The damage:** Project never reaches playable state. Developer burns out building systems nobody tests. Features interact in unplanned ways.

**The fix:**
1. Brainstorm freely (ideas are cheap)
2. Apply the 3-feature MLP rule ruthlessly
3. Keep a "parking lot" document for deferred ideas
4. Revisit the parking lot only AFTER MLP is fun and playable

### Feature Creep vs Future Creep vs Scope Creep

These are different problems with different fixes:

| Type | Definition | Example | Fix |
|------|-----------|---------|-----|
| **Feature Creep** | Adding new features mid-build | "Let's also add a crafting system" | Feature freeze after planning |
| **Future Creep** | Building for hypothetical future | "We'll need multiplayer someday, so architect for it now" | Build for today, refactor when needed |
| **Scope Creep** | Existing features growing in scope | "The inventory was 10 slots, now it needs sorting, filtering, categories..." | Define acceptance criteria upfront |

**Feature Creep signals:**
- "While we're building combat, we should also..."
- "Other [genre] games all have..."
- "This would only take a day to add"
- New beads/issues created mid-sprint that aren't bugs

**Future Creep signals:**
- "We should design the architecture to support..."
- "If we ever want to add multiplayer..."
- "Let's make this configurable in case..."
- Abstraction layers for systems with one implementation

**Scope Creep signals:**
- Acceptance criteria changing after work begins
- "Oh, we also need [edge case] handled"
- Feature taking 3x estimated time
- "It's almost done, just need to add..."

### Premature Content

**What it looks like:** Building 20 levels, 15 enemy types, and a full story before confirming the core loop is fun.

**Why it happens:** Content creation feels productive. It's concrete and visible progress. It's also easier than the hard problem of "is this fun?"

**The damage:** Content is built around mechanics that change during iteration. Levels designed for a jump height that gets retuned. Enemy behaviors designed for a combat system that gets reworked. All that content needs rebuilding.

**The fix:**
1. Prove fun with 1 handcrafted level and 1-2 enemy types
2. Playtest the core loop extensively
3. Only after mechanics stabilize, begin content production
4. Build content tools before building content

**Test:** If you have more content than your playtesters have tested, you've built too much.

## Design Anti-Patterns

### Design in Isolation

**What it looks like:** Extensive design documents and systems planned on paper without any prototype or playtesting. Months of planning before first playable build.

**Why it happens:** Planning feels safe. Building and testing risks discovering the idea isn't fun. Design documents create the illusion of progress.

**The damage:** By the time a playable build exists, the designer is emotionally invested in systems that may not be fun. Sunk cost makes cutting harder.

**The fix:**
1. Timebox planning to days, not weeks
2. Build a playable prototype within the first week
3. Playtest with someone who isn't you
4. Let prototype results drive design iteration

**Rule:** No design decision survives first contact with a playtester. Plan less, test more `(see game-playtesting → Minimum Viable Playtest (MVPt))`. A scenario walkthrough is a lightweight step between pure paper planning and building `(see game-scenario-walkthrough → The 5-Beat Structure)`.

### Juice Addiction

**What it looks like:** Core mechanics are mediocre, but heavy screen shake, particles, and sound effects make it feel impactful. Developer points to juice as evidence the game "feels great."

**Why it happens:** Juice provides immediate, visceral improvement. It's satisfying to add and easy to demo. It masks underlying problems with the game loop.

**The damage:** Players enjoy the first 5 minutes (juice is novel) then drop off (loop isn't engaging). Developer is confused because "it feels so good though."

**The fix:**
1. Build core loop with minimal juice
2. Playtest with zero polish — is it still fun?
3. If yes: add juice to amplify
4. If no: fix the loop, not the juice

**Test:** Remove all screen shake, particles, and sound. Play for 10 minutes. Still fun? Loop is solid. Boring? Juice was hiding a problem.

### Kitchen Sink Design

**What it looks like:** The game is "an open-world survival crafting RPG with tower defense elements and a card game battle system." It has 12 interlocking systems and needs all of them to "work."

**Why it happens:** Every genre element sounds exciting. The designer wants the best parts of 5 different games. Combining genres feels innovative.

**The damage:** No single system gets enough depth. The game is a 3/10 at everything instead of a 9/10 at one thing. Integration between systems creates exponential complexity.

**The fix:**
1. Pick your primary genre/mechanic
2. Add at most ONE secondary mechanic that amplifies the primary
3. Ask: "What is my game about in ONE sentence?"
4. Cut everything that doesn't serve that sentence

**Test:** "My game is [genre] where [core loop]." If you need commas, "and"s, or "with"s to describe your game, it's too broad.

### GDD Tome

**What it looks like:** A 50+ page Game Design Document written before any code exists. Covers every system, every enemy, every level in detail. Treated as sacred scripture.

**Why it happens:** Thoroughness feels responsible. "We should plan everything upfront." Common in teams transitioning from non-game software.

**The damage:** Document becomes outdated immediately once building starts. Time spent maintaining the doc instead of iterating on the game. Changes feel like "failures" because they deviate from the plan.

**The fix:**
- MLP scope: max 2-3 pages
- Living document that evolves with playtesting
- Focus on "what to build next" not "everything we'll ever build"
- Use issues/beads for tracking, not monolithic docs

## Timing Anti-Patterns

### Core Loop Neglect

**What it looks like:** Months of work on menus, save systems, settings, progression, content — but the core gameplay loop was never validated as fun.

**Why it happens:** Infrastructure feels necessary. "We can't test properly without saves." "We need a menu system first." These are procrastination disguised as productivity.

**The damage:** When the core loop finally gets attention, it's not fun. Now there's a mountain of infrastructure built around a broken foundation.

**The fix:**
1. First playable build = core loop only (no menus, no saves, no progression)
2. Validate fun before building anything else
3. Infrastructure comes AFTER the loop is proven

**Priority order:** Core loop → game feel → content → progression → infrastructure → polish

### Second System Effect

**What it looks like:** Developer's second game project is massively over-scoped because "I know what I'm doing now" and "I learned from my mistakes."

**Why it happens:** Success (or lessons from failure) on a first project creates overconfidence. The developer adds all the features they wished their first game had.

**The damage:** Second project is 3-5x the scope of the first. Development takes years. Developer burns out or abandons it.

**The fix:**
- Scope your second project like it's your first
- Apply the 30% rule twice (cut 30%, then cut another 30%)
- Past experience means you'll build faster, not bigger

### Narrative/Mechanics Disconnect

**What it looks like:** The story wants the player to be urgent ("Save the world!") but mechanics reward slow, methodical exploration. Or the narrative says "you're weak" but mechanics make you powerful from the start.

**Why it happens:** Story and mechanics are designed by different people (or at different times) without integration.

**The damage:** Players feel cognitive dissonance. The game's message is incoherent. Neither the story nor the mechanics land with full impact.

**The fix:**
1. Define the core player fantasy before designing either narrative or mechanics
2. Apply the ludonarrative dissonance test from game-design-frameworks
3. When in conflict, mechanics win (players experience what they DO, not what they're TOLD)

## Decision Tables

### Should I Add This Feature?

Answer each question. If you get any "No" answers, strongly consider cutting.

| Question | Yes | No |
|----------|-----|-----|
| Does it directly serve the core loop? | Keep evaluating | Cut |
| Can the MLP be fun without it? | Defer to post-MLP | Keep evaluating |
| Can it be built in <1 day? | Keep evaluating | Cut from MLP |
| Have playtesters asked for it? | Keep evaluating | Cut |
| Does it require a new system? | Cut from MLP | Keep evaluating |
| Are you adding it because competitors have it? | Cut | Keep evaluating |

**If you reach the bottom with all "Keep evaluating":** The feature is a strong candidate. Add it to MLP only if you're under the 3-feature limit.

### Is My Plan Over-Scoped?

| Signal | Score |
|--------|-------|
| More than 3 features beyond core loop | +2 |
| Any feature described as "simple" without a prototype | +1 |
| Plan mentions more than 2 enemy/item/level types | +1 |
| Multiplayer is included (and isn't the core loop) | +3 |
| Plan requires procedural generation | +2 |
| Total estimated dev time > 4 weeks for solo dev | +2 |
| Plan includes a progression system AND content | +1 |
| Design document is more than 3 pages | +1 |
| You can't describe the game in one sentence | +2 |

| Total Score | Assessment |
|-------------|-----------|
| 0-2 | Scope looks reasonable |
| 3-5 | Over-scoped — cut 30% |
| 6-8 | Significantly over-scoped — cut 50% |
| 9+ | Start over with just the core loop |

## Checklists

### Pre-Planning Review

Run this BEFORE starting detailed planning:

- [ ] Core loop can be stated in one sentence
- [ ] Target aesthetic(s) identified (max 2)
- [ ] Genre precedents researched (what works, what doesn't)
- [ ] Platform constraints known
- [ ] Solo/team capacity honestly assessed
- [ ] Previous project lessons documented (but not over-applied)

### Post-Planning Audit

Run this AFTER planning is complete:

- [ ] MLP has ≤3 features beyond core loop
- [ ] No feature requires "a new system" to support it
- [ ] No premature content (max 1 level, 1-2 enemy types in MLP)
- [ ] 30% rule applied to timeline
- [ ] Every feature passes "Should I Add This Feature?" table
- [ ] Over-scope score is ≤2
- [ ] Plan fits in ≤3 pages
- [ ] First playable build target defined (tracer bullet)
- [ ] Playtest plan exists (who, when, what to test)
- [ ] Parking lot created for deferred ideas

## See Also

- **game-scoping** — MLP process, tracer bullets, and cutting heuristics referenced throughout `(see game-scoping → Scope Management)`
- **game-design-frameworks** — Frameworks for making better design decisions (MDA, SDT, flow) `(see game-design-frameworks → MDA Framework)`
- **game-economy-design** — Economy anti-patterns and balance planning `(see game-economy-design → Economy Anti-Patterns)`
- **game-playtesting** — The antidote to Design in Isolation `(see game-playtesting → Minimum Viable Playtest (MVPt))`
- **game-scenario-walkthrough** — Bridge between paper design and building `(see game-scenario-walkthrough → The 5-Beat Structure)`
- **game-difficulty-design** — Difficulty-specific anti-patterns (fake difficulty, number inflation, developer blind spot) `(see game-difficulty-design → Difficulty Anti-Patterns)`
- **game-content-planning** — Content-specific anti-patterns (filler, content treadmill, premature production) `(see game-content-planning → Content Anti-Patterns)`
