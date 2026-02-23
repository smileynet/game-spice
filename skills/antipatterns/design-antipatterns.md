# Design Anti-Patterns

## Design in Isolation

**What it looks like:** Extensive design documents and systems planned on paper without any prototype or playtesting. Months of planning before first playable build.

**Why it happens:** Planning feels safe. Building and testing risks discovering the idea isn't fun. Design documents create the illusion of progress.

**The damage:** By the time a playable build exists, the designer is emotionally invested in systems that may not be fun. Sunk cost makes cutting harder.

**The fix:**
1. Timebox planning to days, not weeks
2. Build a playable prototype within the first week
3. Playtest with someone who isn't you
4. Let prototype results drive design iteration

**Rule:** No design decision survives first contact with a playtester. Plan less, test more `(see playtesting/methodology.md → Minimum Viable Playtest (MVPt))`. A scenario walkthrough is a lightweight step between pure paper planning and building `(see scenario-walkthrough → The 5-Beat Structure)`.

## Juice Addiction

**What it looks like:** Core mechanics are mediocre, but heavy screen shake, particles, and sound effects make it feel impactful. Developer points to juice as evidence the game "feels great."

**Why it happens:** Juice provides immediate, visceral improvement. It's satisfying to add and easy to demo. It masks underlying problems with the game loop.

**The damage:** Players enjoy the first 5 minutes (juice is novel) then drop off (loop isn't engaging). Developer is confused because "it feels so good though."

**The fix:**
1. Build core loop with minimal juice
2. Playtest with zero polish — is it still fun?
3. If yes: add juice to amplify
4. If no: fix the loop, not the juice

**Test:** Remove all screen shake, particles, and sound. Play for 10 minutes. Still fun? Loop is solid. Boring? Juice was hiding a problem.

## Kitchen Sink Design

**What it looks like:** The game is "an open-world survival crafting RPG with tower defense elements and a card game battle system." It has 12 interlocking systems and needs all of them to "work."

**Why it happens:** Every genre element sounds exciting. The designer wants the best parts of 5 different games. Combining genres feels innovative.

**The damage:** No single system gets enough depth. The game is a 3/10 at everything instead of a 9/10 at one thing. Integration between systems creates exponential complexity.

**The fix:**
1. Pick your primary genre/mechanic
2. Add at most ONE secondary mechanic that amplifies the primary
3. Ask: "What is my game about in ONE sentence?"
4. Cut everything that doesn't serve that sentence

**Test:** "My game is [genre] where [core loop]." If you need commas, "and"s, or "with"s to describe your game, it's too broad.

## GDD Tome

**What it looks like:** A 50+ page Game Design Document written before any code exists. Covers every system, every enemy, every level in detail. Treated as sacred scripture.

**Why it happens:** Thoroughness feels responsible. "We should plan everything upfront." Common in teams transitioning from non-game software.

**The damage:** Document becomes outdated immediately once building starts. Time spent maintaining the doc instead of iterating on the game. Changes feel like "failures" because they deviate from the plan.

**The fix:**
- MLP scope: max 2-3 pages
- Living document that evolves with playtesting
- Focus on "what to build next" not "everything we'll ever build"
- Use issues/beads for tracking, not monolithic docs
