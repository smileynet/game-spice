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
### Added
- Game Economy & Balance skill — resource system planning, taps & sinks framework, progression curves, loot design, economy anti-patterns
- Playtesting & Iteration skill — playtest type selection, 3-question framework, observation methodology, minimum viable playtest, pivot vs persevere decisions
- MLP Scenario Walkthrough skill — 5-beat walkthrough template, input/feedback mapping, visual snapshot prompts, walkthrough anti-patterns
- Cross-references between all six skills for progressive disclosure

### Changed
- Updated game-scoping with economy checklist item and playtest/walkthrough references in Scope Review
- Updated game-design-frameworks with Framework Selection Guide rows for economy and walkthrough skills
- Updated game-antipatterns with playtesting and walkthrough references in Design in Isolation section
- Bumped plugin version to 0.2.0 with expanded description and keywords

## [0.1.1] - 2026-02-11
### Added
- Release automation script (`dev/release.py`) and GitHub Actions workflow
- CHANGELOG, LICENSE (MIT), and .gitignore
- Beads issue tracking

## [0.1.0] - 2026-02-11

### Added
- MLP scoping skill for minimum lovable product prioritization
- Core loop framework skill for game system design patterns
- Planning anti-patterns skill for common game design pitfalls
- Marketplace distribution via Line Cook spice rack

[Unreleased]: https://github.com/smileynet/game-spice/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/smileynet/game-spice/compare/v0.2.0...v0.4.0
[0.2.0]: https://github.com/smileynet/game-spice/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/smileynet/game-spice/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/smileynet/game-spice/releases/tag/v0.1.0
