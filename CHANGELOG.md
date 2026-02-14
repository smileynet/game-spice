# Changelog

All notable changes to game-spice will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added — Audit Skills (0.3.0)
- Game Plan Audit skill — plan completeness scorecard, core loop validation tests, GDD quality audit, MLP scope complexity scoring, economy/balance design audit, difficulty curve assessment, playtest readiness audit, data strategy audit
- Game Architecture Audit skill — game loop patterns (fixed update + variable render), state management audit (FSM patterns), entity architecture audit, input handling audit, performance smells, frame budget reference, game-specific technical debt timing
- Playtest questionnaire frameworks — validated instruments (GEQ, PENS, GUESS-18, SUS, FFWWDD) and targeted mini-questionnaires for core loop, onboarding, difficulty, economy, UI/UX
- Telemetry and data analysis methods — essential telemetry events, analytics tiers for indies, quantitative/qualitative analysis methods, prioritization matrix, evidence chain template
- Godot-specific architecture patterns — scene tree organization, "call down signal up", process vs physics_process, autoload patterns, GDScript vs C# decision, performance patterns
- Rust/Bevy-specific architecture patterns — ECS best practices, plugin architecture, resource vs component, system ordering, Bevy antipatterns, performance techniques
- Unity/C# architecture patterns — MonoBehaviour lifecycle, component architecture, ScriptableObjects, communication patterns, Assembly Definitions, performance patterns
- Unreal Engine architecture patterns — Actor/Component model, Gameplay Framework, Blueprint vs C++ decision, Gameplay Tags, UObject lifecycle, GAS, performance patterns
- Python game architecture patterns — Pygame/Arcade/Pyglet framework comparison, scene stack, sprite groups, Python-specific performance constraints, GIL considerations
- TypeScript browser game architecture patterns — Phaser/PixiJS/Excalibur framework comparison, browser constraints, typed event systems, asset loading, object pooling
- Expanded game-playtesting skill with RITE method, session structure (4-phase), FFWWDD framework, sample size guidelines, data-driven decision workflow

### Added — Content Skills
- Game Mechanics Palette skill — curated catalog of 54 mechanics organized by verb/action category (movement, combat, building, collection, cards, management, social, puzzle, temporal, progression), mashup patterns with real-game examples, and guided exploration prompts for creative combination during brainstorming
- Difficulty & Challenge Design skill — flow state, difficulty curves, challenge types, accessibility/assist modes, recovery mechanics, boss design, fake difficulty taxonomy
- Content & Level Planning skill — world structure decisions, content scope estimation, pacing (kishōtenketsu, beat-based), environment-as-teacher, procedural vs handcrafted, content reuse, content sequencing
- Tutorial — complete roguelike dungeon crawler planning walkthrough (`docs/tutorial.md`)

### Changed
- Updated README with audit phase documentation, skill table rows, diagram, and FAQ
- Bumped plugin version to 0.3.0 with audit keywords
- Added cross-references from game-antipatterns to game-plan-audit
- Restructured README with Quick Start, What It Looks Like, When to Use, skills table, FAQ, and Learn More sections
- Updated install.sh to list all 11 skills
- Expanded game-economy-design with genre-specific patterns (roguelike, idle, TD, RPG, survival), balance heuristics, design-phase validation, and economy scaling guidance
- Refactored game-design-frameworks: extracted difficulty section to new skill, deepened systems thinking (interaction decisions, emergence budget), narrative integration (scope costs, environmental storytelling), and progression systems (horizontal vs vertical, meta-progression)
- Cross-references now span all eleven skills with bidirectional links where relevant

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

[Unreleased]: https://github.com/smileynet/game-spice/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/smileynet/game-spice/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/smileynet/game-spice/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/smileynet/game-spice/releases/tag/v0.1.0
