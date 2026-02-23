# Architecture: Game Audit Skills

> Technical patterns, constraints, and conventions discovered during planning.

## Layers

- **Plugin manifest layer**: `.claude-plugin/plugin.json` — updated with audit keywords
- **Skills layer**: `skills/<name>/SKILL.md` — main skill files loaded by audit commands
- **Sub-files layer**: `skills/<name>/<topic>.md` — on-demand depth loaded via cross-reference or engine detection

## Patterns

- **Progressive disclosure via sub-files**: Main SKILL.md contains engine-agnostic core audit criteria. Sub-files contain engine-specific patterns (godot.md, rust.md) or deep-dive topics (questionnaires.md, telemetry.md). Referenced with `(see skill-name/file.md → Section)`.
- **Audit activation**: Skills activate via keywords in YAML description matching audit command context (e.g., "plan-audit", "architecture-audit", "game code architecture").
- **Scorecard pattern**: Quick Reference section contains a health scorecard table for rapid assessment. Detailed guidance in subsequent sections and collapsible blocks.
- **Cross-skill references**: Audit skills reference planning skills for context (e.g., plan-audit references scoping's MLP criteria).

## Constraints

- Main SKILL.md targets ~250-300 lines (within context budget)
- Sub-files target ~100-150 lines each
- Must work with Line Cook's `/plan-audit` and `/architecture-audit` command patterns
- Engine-specific content must be optional — core audit works without any engine sub-file
- Pure markdown — no external dependencies

## Conventions

- Sub-file naming: lowercase, descriptive topic (godot.md not godot-patterns.md)
- Cross-references between main and sub-files use `(see skill/file.md → Section)` format
- Collapsible details blocks for sections that aren't always relevant
- Decision tables for "when to use which" guidance
- Checklists for verification at end of each main SKILL.md
