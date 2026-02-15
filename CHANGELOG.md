# Changelog

All notable changes to game-spice will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.4.0] - 2026-02-14

### Interactive Commands

- **`/game:walkthrough`** — Walk through your game moment-by-moment before writing a line of code. Generates a 5-beat scenario that reveals gaps in input mapping, feedback loops, and pacing so you can fix design problems on paper instead of in a debugger.
- **`/game:balance-check`** — Audit your economy and difficulty design on demand. Catches resource leaks, broken progression curves, and difficulty spikes early — before playtesters hit them.

### Automated Code Review

- **Game-aware reviewer** — During `/line:serve`, your code is now checked against game-specific architecture patterns. Detects engine/framework automatically (Godot, Unity, Unreal, Bevy, and more) and flags issues like physics in render loops, missing delta-time, god-class update functions, and per-frame allocations.

### Implementation Guidance

- **Coding patterns during `/line:cook`** — Get prescriptive, copy-ready patterns for game loops, state machines, input handling, frame budgeting, entity architecture, and delta-time management right when you're writing code.

### Expanded Knowledge Base

- **Mechanics Palette** — Browse 54 mechanics across 10 categories (movement, combat, building, puzzles, and more) with mashup patterns drawn from real games. Great for brainstorming sessions.
- **Difficulty & Challenge Design** — Flow-state targeting, difficulty curve templates, accessibility/assist modes, recovery mechanics, and boss design guidance.
- **Content & Level Planning** — World structure decisions, content scope estimation, pacing frameworks, procedural-vs-handcrafted trade-offs, and content reuse strategies.
- **Plan & Architecture Audits** — Score your GDD completeness, validate core loops, audit economy balance, assess difficulty curves, and check playtest readiness — all from your plan files. Architecture audits cover game loops, state machines, entity systems, and performance with engine-specific guidance for Godot, Unity, Unreal, Bevy, Python, and TypeScript.
- **Playtesting toolkit** — RITE method, structured session templates, validated questionnaires (GEQ, PENS, SUS), sample-size guidelines, and a data-driven decision workflow.

### Changed

- Plugin prefix is now `/game:*` (renamed from `game-spice` to `game`)

## [0.2.0] - 2026-02-12

### New Knowledge

- **Economy & Balance Planning** — Plan resource systems that create meaningful choices. Includes a complexity ladder (zero economy → full multi-currency), taps & sinks framework, progression curve planning, loot design, and an MLP economy checklist so you ship the minimum viable economy first.
- **Playtesting & Iteration** — Close the gap between your design and what players actually experience. Playtest type selector, the 3-question framework (understand → engage → retain), observation methodology, minimum viable playtest, and pivot-vs-persevere decision criteria.
- **Scenario Walkthrough** — Narrate the player's first five minutes before writing a line of code. A 5-beat structure (first contact → learning the verb → core loop → rising stakes → session end) with input/feedback mapping that turns abstract ideas into concrete, testable descriptions.

## [0.1.1] - 2026-02-11

### Housekeeping

- Release automation, CHANGELOG, LICENSE (MIT), and `.gitignore`

## [0.1.0] - 2026-02-11

### Launch

- **MLP Scoping** — Cut scope ruthlessly and build what matters. The 3-feature rule, MoSCoW prioritization, tracer bullet methodology for vertical slices, and genre-specific scoping tips keep your first playable small and focused.
- **Core Loop & Design Frameworks** — Thinking tools for analyzing game experiences. MDA framework, core loop strength evaluation, nested loops (micro → macro), player motivation science, systems thinking for emergence, game feel checklist, and onboarding patterns.
- **Planning Anti-Patterns** — An early warning system for the mistakes that kill games before they ship. Top 10 anti-pattern catalog, "Should I Add This Feature?" decision table, over-scope scoring, and pre/post-planning audit checklists.
- Available on the Line Cook spice rack marketplace.

[Unreleased]: https://github.com/smileynet/game-spice/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/smileynet/game-spice/compare/v0.2.0...v0.4.0
[0.2.0]: https://github.com/smileynet/game-spice/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/smileynet/game-spice/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/smileynet/game-spice/releases/tag/v0.1.0
