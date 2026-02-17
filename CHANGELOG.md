# Changelog

All notable changes to game-spice will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- install.sh now copies templates/ directory needed by runtime commands
- Release workflow install instructions corrected to match README (line-cook marketplace model)
- Added missing v0.3.0 changelog entry
- Fixed v0.4.0 comparison link to reference v0.3.0 instead of v0.2.0

## [0.5.0] - 2026-02-16

### Added

**Interactive Game Design Workflow** — A complete idea-to-implementation pipeline through structured conversation.

- **`/game:start`** — Start a new game design session or resume an existing one. Creates a persistent `.game-design/` directory with state tracking, decision logging, and session indexing. Supports multiple concurrent sessions with resume flow.
- **`/game:brainstorm`** — Turn a game idea into a structured design through conversation, not questionnaires. Describe your game freely and the agent extracts genre, core loop, mechanics, and aesthetics from your natural language. Produces concept.yaml, a design brief, and a decision log with full provenance tracking (user/suggested/inferred). References game-mechanics-palette, game-scoping, and game-design-frameworks for enrichment and validation.
- **`/game:simulate`** — Prove your core loop works before writing code. Wizard of Oz gameplay simulation presents ASCII wireframes and narrative descriptions of gameplay moments, asks concrete design questions, and records every decision with provenance tracking. Coverage-driven pacing walks through the 5-Beat Structure (First Contact, Learning the Verb, Core Loop in Motion, Rising Stakes, Session End) with quantitative confidence scoring to determine when simulation is thorough enough to proceed.
- **`/game:build-plan`** — Transform simulation data into production-ready documents. Reads all session data (concept, turns, wireframes, decisions, coverage) and generates a Game Design Document and Technical Specification. The GDD includes design pillars, mechanics with simulation turn references, all ASCII wireframes organized by screen, content requirements, and an Assumptions to Validate section that flags AI-suggested decisions for playtesting. The tech spec provides architecture recommendations, a 4-phase implementation plan (tracer bullet → core loop → content → polish) with vertical-slice task breakdowns, and a risk register. Runs the game-plan-audit quality review (completeness scorecard, core loop validation, GDD actionability) before finalizing.
- **`/game:status`** — Inspect your current session at a glance. Shows phase, simulation progress, 5-beat coverage scores, recent decisions, and session flags — proving state persistence works across conversations.
- **`/game:decisions`** — Browse and search past design decisions with provenance visibility. Lists all decisions from the active session's decisions.log with filtering by category, phase, or origin. Shows decision ID, date, category, origin, rationale, and provenance markers ([suggested], [inferred]) so designers can distinguish their own decisions from AI-proposed ones. Includes summary statistics with category/origin/phase breakdowns and a provenance advisory when >50% of decisions are AI-proposed.
- **`/game:help`** — Command reference showing the full design workflow, all 9 commands with descriptions, quick start guide, and passive skill overview.

**New Knowledge**

- **ASCII Wireframing Toolkit** — Starter patterns for low-fidelity game wireframes: box-drawing characters, common primitives, genre-specific examples (platformer, top-down RPG, HUD, inventory, flow diagrams), and the legend.yaml workflow for per-project symbol conventions.
- **Simulation Facilitation Guide** — Rules for running Wizard of Oz gameplay simulations: facilitator stance (sidekick not director), turn structure, coverage-driven pacing via 5-Beat Structure, decision recording with provenance tracking, anti-patterns, and scope control.

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

- **Mechanics Palette** — Browse 54 mechanics across 10 categories (movement, combat, building, puzzles, and more) with mashup patterns drawn from real games. Great for brainstorming sessions.
- **Difficulty & Challenge Design** — Flow-state targeting, difficulty curve templates, accessibility/assist modes, recovery mechanics, and boss design guidance.
- **Content & Level Planning** — World structure decisions, content scope estimation, pacing frameworks, procedural-vs-handcrafted trade-offs, and content reuse strategies.
- **Plan & Architecture Audits** — Score your GDD completeness, validate core loops, audit economy balance, assess difficulty curves, and check playtest readiness — all from your plan files. Architecture audits cover game loops, state machines, entity systems, and performance with engine-specific guidance for Godot, Unity, Unreal, Bevy, Python, and TypeScript.
- **Playtesting Toolkit** — RITE method, structured session templates, validated questionnaires (GEQ, PENS, SUS), sample-size guidelines, and a data-driven decision workflow.

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

### Changed

- README restructured with example conversation, tutorial, and ASCII diagrams
- Cross-reference annotations standardized across all skill See Also sections

## [0.2.0] - 2026-02-12

### Added

**New Knowledge**

- **Economy & Balance Planning** — Plan resource systems that create meaningful choices. Includes a complexity ladder (zero economy → full multi-currency), taps & sinks framework, progression curve planning, loot design, and an MLP economy checklist so you ship the minimum viable economy first.
- **Playtesting & Iteration** — Close the gap between your design and what players actually experience. Playtest type selector, the 3-question framework (understand → engage → retain), observation methodology, minimum viable playtest, and pivot-vs-persevere decision criteria.
- **Scenario Walkthrough** — Narrate the player's first five minutes before writing a line of code. A 5-beat structure (first contact → learning the verb → core loop → rising stakes → session end) with input/feedback mapping that turns abstract ideas into concrete, testable descriptions.

## [0.1.1] - 2026-02-11

### Changed

- Release automation, CHANGELOG, LICENSE (MIT), and `.gitignore`

## [0.1.0] - 2026-02-11

### Added

- **MLP Scoping** — Cut scope ruthlessly and build what matters. The 3-feature rule, MoSCoW prioritization, tracer bullet methodology for vertical slices, and genre-specific scoping tips keep your first playable small and focused.
- **Core Loop & Design Frameworks** — Thinking tools for analyzing game experiences. MDA framework, core loop strength evaluation, nested loops (micro → macro), player motivation science, systems thinking for emergence, game feel checklist, and onboarding patterns.
- **Planning Anti-Patterns** — An early warning system for the mistakes that kill games before they ship. Top 10 anti-pattern catalog, "Should I Add This Feature?" decision table, over-scope scoring, and pre/post-planning audit checklists.
- Available on the Line Cook spice rack marketplace.

[Unreleased]: https://github.com/smileynet/game-spice/compare/v0.5.0...HEAD
[0.5.0]: https://github.com/smileynet/game-spice/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/smileynet/game-spice/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/smileynet/game-spice/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/smileynet/game-spice/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/smileynet/game-spice/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/smileynet/game-spice/releases/tag/v0.1.0
