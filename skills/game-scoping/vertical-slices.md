# Vertical Slice Decomposition for Games

## What Is a Vertical Slice?

A vertical slice is a thin, end-to-end implementation that touches every layer of your game for one specific player action. Where a horizontal slice builds an entire system (all physics, all rendering, all UI), a vertical slice builds one complete path through the game that a player can actually experience.

**Relationship to tracer bullets:** A tracer bullet is your *first* vertical slice — the one that proves the architecture works. Subsequent vertical slices widen the game by adding new paths through the same 5 layers `(see game-scoping/tracer-bullets.md for the 5-Layer Vertical Slice model)`.

**Relationship to MLP:** Your MLP is the thinnest horizontal cut across the story map — the minimum set of vertical slices needed to validate that the core loop is fun.

## Best Practices

### DO: Start with the core loop as your Walking Skeleton

Your first vertical slice should be the core loop itself — the thing the player does every 30-60 seconds. Everything else hangs on this skeleton.

### DO: Slice by player outcome, not by system layer

**Good slice:** "Player defeats one enemy and gets a reward"
**Bad slice:** "Implement the combat system"

The good slice forces you to build input, mechanics, state, feedback, and consequence together. The bad slice lets you build combat for 3 weeks without knowing if it's fun.

### DO: Defer polish with intentional stubs

Programmer art, placeholder sounds, and hardcoded values are fine in a vertical slice. The goal is to prove the *experience* works, not to ship the *assets*. A white rectangle that jumps and lands on a grey rectangle tells you more about fun than a detailed sprite sheet with no gameplay.

### DO: Slice along gameplay variations

After the core loop works, add variations *through* it:
- One enemy type → a second enemy type with different behavior
- One level → a second level with a new obstacle
- One card → a second card with a different effect

Each variation is a new vertical slice that reuses your existing layers.

### DO: Slice along progression stages

Progression systems are vertical slices too:
- Core loop (slice 1) → meta-game currency (slice 2) → upgrade shop (slice 3)
- Each slice adds a new complete experience, not just a new backend system

### DO: Validate fun at every slice

Every vertical slice should be playtestable. If you complete a slice and can't hand it to someone to play, you've built a horizontal slice in disguise.

### DO: Use the Hamburger Method

Each slice is a hamburger: UI (bun) + mechanic (patty) + state (condiments). You build one complete hamburger at a time, not all buns first, then all patties.

## Antipatterns

### THE LAYER CAKE — "Let's build the whole physics engine first"

**What it looks like:** Spending weeks on a single system layer before any other layer exists. "We need a solid foundation" becomes a reason to defer anything player-facing.

**Why it's tempting:** Feels like solid, rigorous engineering. You can measure progress in code written. No messy creative questions to answer.

**The trap:** Weeks of invisible progress. No fun validation. When you finally connect the layers, you discover the physics engine you built doesn't serve the game feel you need — but now you're invested in it.

**The fix:** Build the thinnest possible version of each layer simultaneously. Prove the path works, then deepen individual layers.

### THE DEMO REEL — Vertical slice that's all UI with mocked gameplay

**What it looks like:** A pretty menu, animated transitions, and a gameplay screen where everything is hardcoded or scripted. It *looks* like a game in a screenshot.

**Why it's tempting:** Stakeholders love it. Screenshots look great. UI work is satisfying and visible.

**The trap:** The mock hides whether the real mechanics are fun. When you replace mocks with actual gameplay, the experience changes completely. You optimized for the wrong thing.

**The fix:** The slice must include real game state changes driven by real player input. Ugly but real beats pretty but fake.

### THE FEATURE BUFFET — 10 thin slices before any one is fun

**What it looks like:** "We have movement, combat, inventory, crafting, dialogue, and trading!" — but each is a bare skeleton that isn't satisfying to use.

**Why it's tempting:** Breadth feels like progress. You can list more features on your plan. Each day adds something "new."

**The trap:** Nothing is deep enough to evaluate for fun. Players can't tell if combat is engaging when it has one attack with no feedback. You end up with 10 systems to maintain and zero fun to show for it.

**The fix:** Follow the 3-Feature MLP rule. Make the core loop slice genuinely fun before adding more slices `(see game-scoping → The 3-Feature Rule)`.

### THE PERFECTIONIST SLICE — Each slice polished before the next

**What it looks like:** The jump feels perfect. The landing particles are beautiful. The one platform is textured. ...And that's all you have after a month.

**Why it's tempting:** "Do it right the first time." Polish is rewarding work with visible results. It feels professional.

**The trap:** You're polishing mechanics that will change after playtesting. That perfect jump feel? It'll need retuning when you add double-jump. Those particles? They'll need new ones for the new surfaces.

**The fix:** Each slice gets "good enough" feel, then you move on. Save the polish pass for after the MLP is fun `(see game-scoping → Post-MLP Iteration Phases)`.

### THE INVISIBLE SLICE — "Implement save system" (no player-facing result)

**What it looks like:** A "vertical slice" that's actually infrastructure: save/load, networking layer, asset pipeline, analytics.

**Why it's tempting:** You genuinely need this infrastructure. It's real work that takes real time.

**The trap:** It's not a vertical slice — it's a horizontal layer. A slice must be player-experienceable. A save system with nothing to save isn't a slice.

**The fix:** Embed infrastructure in a real feature. Don't build "save system" — build "player completes a run and their high score persists." The save system emerges from a real slice.

## Decomposition Techniques

### The 5-Beat Slice

Every vertical slice should touch all 5 beats:

1. **One input** — player presses/clicks/taps something
2. **One mechanic** — game responds with a rule
3. **One state change** — world updates
4. **One feedback** — player sees/hears the result
5. **One consequence** — new situation emerges

If your planned slice doesn't have all 5, it's not a vertical slice.

### SPIDR for Games

Borrowed from agile story splitting, adapted for games:

| Technique | Game Application | Example |
|-----------|-----------------|---------|
| **Spike** | Prototype one risky unknown | "Can we make grappling feel good?" |
| **Paths** | Split by player choice/route | "Melee path" vs "Ranged path" |
| **Interfaces** | Split by input method | "Keyboard controls" then "Controller support" |
| **Data** | Split by content variation | "Skeleton enemy" then "Ghost enemy" |
| **Rules** | Split by mechanic complexity | "Basic attack" then "Combo system" |

### Genre-Specific Slice Patterns

Different genres have natural slice boundaries `(see game-scoping/genre-tips.md)`:

- **Platformer:** Slice by movement verb (run → jump → wall-slide → dash)
- **Roguelike:** Slice by room encounter type (combat → shop → event → boss)
- **Puzzle:** Slice by mechanic (rotate → swap → gravity → portals)
- **Tower Defense:** Slice by tower type (shooter → slower → area → support)
- **Card Game:** Slice by card effect type (damage → draw → buff → combo)

## Context Matters

### When horizontal work IS appropriate

Not everything can be a vertical slice. Infrastructure work is valid when:
- You literally cannot build any slice without it (engine setup, build pipeline)
- The horizontal work takes less than a day
- You're unblocking multiple future slices, not deferring them

Even then, keep it minimal. Build the thinnest infrastructure that lets you get to your first slice.

### Solo dev vs team

Solo devs can tolerate slightly thicker slices because context-switching cost is lower — you hold the whole game in your head. But don't use this as an excuse to build Layer Cakes. The principle still holds: end-to-end beats depth-first.

### Jam games vs production

Game jams reward fewer, thicker slices. You have 48 hours — you get 1-2 vertical slices at most. Make the first one the core loop and make it fun. The second slice is polish on that same loop, not a new feature.

### Early access and iterative release

If you're planning early access, each release milestone should be a set of vertical slices that form a complete (if thin) experience. Don't release "the combat update" (horizontal) — release "the dungeon update" (vertical: new rooms + new enemies + new loot + new boss).
