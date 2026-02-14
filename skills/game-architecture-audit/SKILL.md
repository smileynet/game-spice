---
name: game-architecture-audit
description: Game-specific code architecture auditing. Use when auditing game code architecture, reviewing game loop patterns, evaluating game state management, assessing frame budget, checking entity architecture, input handling, or running architecture-audit on a game project. Covers game loop timing, state machines, ECS patterns, performance smells, technical debt timing.
---

# Game Architecture Audit

Audit game code architecture for correctness, performance, and maintainability. Catches game-specific patterns that generic code audits miss.

## Quick Reference

### Game Architecture Health Scorecard

| Category | Healthy | Warning | Critical |
|----------|---------|---------|----------|
| **Game Loop** | Fixed update + variable render | Variable delta time | Physics in render loop |
| **State Management** | FSM or state pattern | Boolean flags (≤3) | Boolean combinatorial explosion |
| **Input Handling** | Action mapping layer | Direct key checks with remapping | Hardcoded key checks in gameplay |
| **Entity Architecture** | Components/ECS appropriate to scale | Mild inheritance (≤3 deep) | Deep inheritance or god objects |
| **Resource Management** | Object pooling for hot paths | Occasional allocation in loops | `new`/`malloc` every frame |
| **Frame Budget** | Measured, within target | Unmeasured but seems fine | Visible frame drops, no profiling |
| **Scene Organization** | Subsystem separation, clear ownership | Some coupling between subsystems | Monolithic scene, spaghetti refs |
| **Build/Deploy** | Automated, reproducible | Manual but documented | "Works on my machine" |

## Game Loop Patterns

**The correct answer for most games: Fixed Update with Variable Rendering.**

Decouples physics from rendering. Physics runs at a fixed rate using an accumulator. Rendering interpolates between states with alpha. Deterministic, framerate-independent, network-syncable.

### Four Patterns Compared

| Pattern | When Correct | Critical Flaw |
|---------|-------------|---------------|
| Fixed timestep, no sync | Never (game speed = hardware speed) | Unplayable on fast/slow machines |
| Fixed with sleep | Mobile/battery-sensitive | Frame drops = game slowdown |
| Variable delta time | Very simple games, no physics | **Physics becomes framerate-dependent** (springs explode, tunneling) |
| **Fixed update + variable render** | Most games | Complexity of interpolation (worth it) |

### Architecture Smells

| Smell | What's Wrong | Fix |
|-------|-------------|-----|
| **Physics in render loop** | Physics in `_process`/`Update`/render callback | Move to `_physics_process`/`FixedUpdate` |
| **No delta time** | Hardcoded `position += 5` | Multiply by delta: `position += speed * delta` |
| **God update function** | Single `update()` >100 lines | Extract subsystems with single responsibilities |
| **Missing state guards** | Game logic runs during pause/menu | Check game state before processing |
| **Spiral of Death** | Uncapped accumulator, physics falls behind | Cap max accumulated time (e.g., 0.25s) |

<details><summary>State Management Audit</summary>

### The Boolean Flag Problem

`is_jumping, is_ducking, is_firing` creates combinatorial explosion. Every new action doubles possible states, most combinations are invalid (`is_jumping AND is_ducking AND is_dead`).

### State Patterns (Progressive Complexity)

| Pattern | When to Use | Key Insight |
|---------|-------------|-------------|
| **FSM (enum + switch)** | Distinct behaviors, small state count (≤8) | Replaces boolean flags entirely |
| **Pushdown Automata** | "Do this, then return to previous" (firing while running, pause) | Stack of states, pop to restore |
| **Hierarchical FSM** | Shared transitions (all ground states can jump) | Superstates handle common logic |
| **Concurrent FSMs** | Orthogonal concerns (armed/unarmed × standing/jumping) | Separate machines per axis |

### State Management Smells

| Smell | Symptom | Fix |
|-------|---------|-----|
| **Boolean flags** | `if is_jumping and not is_ducking and is_alive` | Replace with FSM enum |
| **Missing transitions** | States change without validation | Explicit transition table |
| **Global mutable state** | Singletons modified from everywhere | Encapsulate state ownership |
| **State desync** | Same state tracked in multiple places | Single source of truth |

</details>

<details><summary>Entity Architecture Audit</summary>

| Pattern | When Appropriate | Primary Risk |
|---------|-----------------|-------------|
| **ECS** | High entity counts, perf-critical simulation (Bevy, EnTT) | Higher initial complexity |
| **Component-based** | Scene-graph engines (Godot, Unity) | Component coupling over time |
| **Inheritance hierarchy** | <10 entity types, no runtime flexibility needed | Fragile base class, diamond problem |
| **Data-driven** | Designer-authored entities, moddable games | Harder to debug |

### Entity Architecture Smells

| Smell | Symptom | Fix |
|-------|---------|-----|
| **Deep inheritance (>3 levels)** | "Where does this method come from?" unanswerable | Flatten to composition |
| **God entity/node** | >10 responsibilities on one entity | Extract components/sub-nodes |
| **Component coupling** | Components directly reference each other | Use signals/events for communication |
| **Monolithic scene** | >500 lines in one scene/file | Extract sub-scenes/sub-components |

</details>

<details><summary>Input Handling Audit</summary>

### Three-Layer Architecture

| Layer | Responsibility | Example |
|-------|---------------|---------|
| **Raw Input** | Hardware signals, no game logic | Keyboard events, gamepad axis values |
| **Mapping** | Translates to named actions, supports remapping | "jump" = Space / A button / swipe up |
| **Action** | Game systems consume actions, buffering + priority | Jump system reads "jump" action, applies buffer window |

### Input Handling Smells

| Smell | Why It's Bad | Fix |
|-------|-------------|-----|
| **Raw key checks in gameplay** | No remapping, no gamepad, no accessibility, no replay | Use action mapping layer |
| **No input buffering** | Dropped inputs, poor game feel | Buffer inputs for 0.1-0.2s |
| **Platform-specific hardcoding** | Accessibility barrier, can't port | Abstract through mapping layer |
| **Input during wrong state** | Player acts during cutscene/pause | Filter by game state |

</details>

<details><summary>Performance Smells</summary>

| Smell | Detection | Impact |
|-------|-----------|--------|
| **Allocation in hot path** | `new`/`malloc` in update loop | GC spikes, frame drops |
| **O(n²) collision** | Nested entity loops without spatial partitioning | Exponential scaling with entity count |
| **String comparison in loop** | Type checks by string in update | Slow, error-prone |
| **Unbounded entity count** | No pooling or despawn limits | Memory growth, eventual crash |
| **AoS data layout** | Arrays of Structures in tight loops | Cache misses, poor vectorization |

### Frame Budget Reference

| Target | Budget per Frame | Typical Split |
|--------|-----------------|--------------|
| 30 FPS | 33ms | 10ms logic, 10ms physics, 13ms render |
| 60 FPS | 16.6ms | 5ms logic, 5ms physics, 6.6ms render |

### Spatial Partitioning Options

| Structure | Best For |
|-----------|----------|
| **Uniform Grid** | Evenly distributed, similar-sized entities |
| **Quadtree/Octree** | Variable density, mixed entity sizes |
| **BSP / k-d Tree** | Static geometry, ray queries |
| **BVH** | Complex meshes, dynamic objects |

</details>

<details><summary>Game-Specific Technical Debt</summary>

Not all debt is bad. Some debt is correct to take early and pay later.

| Debt | Accept During | Pay Before |
|------|-------------|-----------|
| Magic numbers | Tracer bullet, MLP | Content production |
| No save architecture | Tracer bullet | Meta-progression implementation |
| Monolithic scenes | Tracer bullet | Second level/area |
| Missing event/signal system | MLP (<4 system interactions) | 4th system interaction |
| No asset pipeline | MLP | Content batching |
| Hardcoded resolution | MLP | First external playtest |
| No input remapping | MLP | Public release |
| Tightly coupled scene transitions | MLP | Scene reordering or branching paths |

**Rule:** Accept debt that speeds up validation. Pay debt before it blocks the next phase.

</details>

## Engine-Specific Patterns

Engine-agnostic principles above apply everywhere. For engine-specific guidance:

- `(see game-architecture-audit/godot.md for Godot/GDScript scene tree, signals, and process patterns)`
- `(see game-architecture-audit/rust.md for Rust/Bevy ECS, plugin architecture, and system ordering)`
- `(see game-architecture-audit/unity.md for Unity/C# MonoBehaviour lifecycle, ScriptableObjects, and component architecture)`
- `(see game-architecture-audit/unreal.md for Unreal/C++ Actor model, Gameplay Framework, and Blueprint vs C++ patterns)`
- `(see game-architecture-audit/python.md for Python/Pygame game loop management, sprite groups, and performance constraints)`
- `(see game-architecture-audit/typescript.md for TypeScript/Phaser browser game patterns, asset loading, and typed event systems)`

## Architecture Health Checklist

- [ ] Game loop uses fixed update for physics, variable for rendering
- [ ] No physics or movement code in render/draw callbacks
- [ ] State management uses FSM or state pattern (no boolean flag explosion)
- [ ] Input goes through a mapping/action layer (not raw key checks)
- [ ] No allocations in per-frame hot paths
- [ ] Entity architecture matches project scale (not over- or under-engineered)
- [ ] Scene/node organization has clear subsystem boundaries
- [ ] Technical debt is intentional and scheduled for payoff
- [ ] Frame budget is measured, not assumed

## See Also

- **game-plan-audit** — Plan-level audit (companion to code architecture audit) `(see game-plan-audit → Game Plan Completeness Scorecard)`
- **game-scoping** — MLP scope determines acceptable technical debt levels `(see game-scoping → Tracer Bullet Methodology)`
- **game-antipatterns** — Design anti-patterns that manifest as architecture problems `(see game-antipatterns → Core Loop Neglect)`
- **game-design-frameworks** — Systems thinking for architecture decisions `(see game-design-frameworks → Systems Thinking)`
- **game-playtesting** — Playtest methodology for validating architecture decisions `(see game-playtesting → Playtest Planning Checklist)`
