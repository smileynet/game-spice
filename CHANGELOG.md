# Changelog

All notable changes to game-spice will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.5.1] - 2026-02-16
### Fixed

- install.sh now copies templates/ directory needed by runtime commands
- Release workflow install instructions corrected to match README (line-cook marketplace model)
- Added missing v0.3.0 changelog entry
- Fixed v0.4.0 comparison link to reference v0.3.0 instead of v0.2.0

## [0.5.0] - 2026-02-16

### Added

**Interactive Game Design Workflow** — A complete idea-to-implementation pipeline through structured conversation.

- **`/game:start`** — Start a new game design session or resume an existing one. Supports multiple concurrent sessions with resume flow.
- **`/game:brainstorm`** — Turn a game idea into a structured design through conversation, not questionnaires. Describe your game freely and the agent extracts genre, core loop, mechanics, and aesthetics from your natural language. Produces a design brief and tracks every decision with provenance (yours vs. suggested vs. inferred).
- **`/game:simulate`** — Prove your core loop works before writing code. Plays through your game moment-by-moment with ASCII wireframes, asks concrete design questions, and records decisions. Coverage-driven pacing walks through five beats (first contact → learning the verb → core loop → rising stakes → session end) so you know when the design is solid enough to build.
- **`/game:build-plan`** — Generate a Game Design Document and Technical Specification from your simulation session. The GDD covers design pillars, mechanics, wireframes, and content requirements — with an Assumptions to Validate section flagging AI-suggested decisions for playtesting. The tech spec provides architecture recommendations and a phased implementation plan with vertical-slice task breakdowns.
- **`/game:status`** — Inspect your current session at a glance. Shows phase, simulation progress, 5-beat coverage scores, recent decisions, and session flags — proving state persistence works across conversations.
- **`/game:decisions`** — Browse and search past design decisions with provenance visibility. Filter by category, phase, or origin to distinguish your own decisions from AI-suggested ones.
- **`/game:help`** — Command reference showing the full design workflow, quick start guide, and passive skill overview.
- Simulations now include ASCII wireframes with genre-specific starter patterns (platformer, top-down RPG, HUD, inventory, flow diagrams) and per-project symbol conventions.

## [0.4.0] - 2026-02-14

### Added

**Interactive Commands**

- **`/game:walkthrough`** — Walk through your game moment-by-moment before writing a line of code. Generates a 5-beat scenario that reveals gaps in input mapping, feedback loops, and pacing so you can fix design problems on paper instead of in a debugger.
- **`/game:balance-check`** — Audit your economy and difficulty design on demand. Catches resource leaks, broken progression curves, and difficulty spikes early — before playtesters hit them.

**Automated Code Review**

- **Game-aware reviewer** — During `/line:serve`, your code is now checked against game-specific architecture patterns. Detects engine/framework automatically (Godot, Unity, Unreal, Bevy, and more) and flags issues like physics in render loops, missing delta-time, god-class update functions, and per-frame allocations.

**Implementation Guidance**

- **Coding patterns during `/line:cook`** — Get prescriptive, copy-ready patterns for game loops, state machines, input handling, frame budgeting, entity architecture, and delta-time management right when you're writing code.

**Expanded Knowledge Base**

- **Architecture Audit** expanded with engine-specific guidance for Unity, Unreal, Python, and TypeScript (joining Godot and Bevy patterns from v0.3.0).
- **Playtesting Toolkit** expanded with RITE method, structured session templates, validated questionnaires (GEQ, PENS, SUS), sample-size guidelines, and a data-driven decision workflow.

### Changed

- Plugin prefix is now `/game:*` (renamed from `game-spice` to `game`)

## [0.3.0] - 2026-02-13

### Added

**New Knowledge**

- **Mechanics Palette** — 54 mechanics across 10 categories (movement, combat, building, puzzles, and more) with mashup patterns drawn from real games for brainstorming sessions.
- **Difficulty & Challenge Design** — Flow-state targeting, difficulty curve templates, accessibility/assist modes, recovery mechanics, and boss design guidance.
- **Content & Level Planning** — World structure decisions, content scope estimation, pacing frameworks, procedural-vs-handcrafted trade-offs, and content reuse strategies.
- **Plan Audit** — GDD completeness scoring, core loop validation, economy balance auditing, difficulty curve assessment, and playtest readiness checks.
- **Architecture Audit** — Game loop, state machine, entity architecture, and performance patterns with engine-specific guidance.

**Expanded Skills**

- Economy design deepened with genre-specific patterns and balance checklist
- Design frameworks expanded with systems thinking and game feel

## [0.2.0] - 2026-02-12

### Added

**New Knowledge**

- **Economy & Balance Planning** — Plan resource systems that create meaningful choices. Includes a complexity ladder (zero economy → full multi-currency), taps & sinks framework, progression curve planning, loot design, and an MLP economy checklist so you ship the minimum viable economy first.
- **Playtesting & Iteration** — Close the gap between your design and what players actually experience. Playtest type selector, the 3-question framework (understand → engage → retain), observation methodology, minimum viable playtest, and pivot-vs-persevere decision criteria.
- **Scenario Walkthrough** — Narrate the player's first five minutes before writing a line of code. A 5-beat structure (first contact → learning the verb → core loop → rising stakes → session end) with input/feedback mapping that turns abstract ideas into concrete, testable descriptions.

## [0.1.0] - 2026-02-11

### Added

- **MLP Scoping** — Cut scope ruthlessly and build what matters. The 3-feature rule, MoSCoW prioritization, tracer bullet methodology for vertical slices, and genre-specific scoping tips keep your first playable small and focused.
- **Core Loop & Design Frameworks** — Thinking tools for analyzing game experiences. MDA framework, core loop strength evaluation, nested loops (micro → macro), player motivation science, systems thinking for emergence, game feel checklist, and onboarding patterns.
- **Planning Anti-Patterns** — An early warning system for the mistakes that kill games before they ship. Top 10 anti-pattern catalog, "Should I Add This Feature?" decision table, over-scope scoring, and pre/post-planning audit checklists.
- Available on the Line Cook spice rack marketplace.

[Unreleased]: https://github.com/smileynet/game-spice/compare/v0.5.1...HEAD
[0.5.1]: https://github.com/smileynet/game-spice/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/smileynet/game-spice/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/smileynet/game-spice/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/smileynet/game-spice/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/smileynet/game-spice/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/smileynet/game-spice/releases/tag/v0.1.0
