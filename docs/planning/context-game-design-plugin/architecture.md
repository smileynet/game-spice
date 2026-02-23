# Architecture: Game Design Planning Plugin

> Technical patterns, constraints, and conventions discovered during planning.

## Layers

- **Plugin manifest layer**: `.claude-plugin/plugin.json` — declares plugin identity and metadata
- **Skills layer**: `skills/<name>/SKILL.md` — markdown knowledge bases loaded on-demand by Claude
- No command, agent, hook, or script layers needed

## Patterns

- **Progressive disclosure**: Decision tables and one-liners at top, `<details>` blocks for depth, external references for full docs. Matches line-cook's `project-minimalism` skill pattern.
- **Frontmatter + structured markdown**: Each SKILL.md has YAML frontmatter (`name`, `description`) followed by sections with Quick Reference, Topics, Anti-Patterns, Checklists.
- **Genre-agnostic with genre tips**: Core guidance applies broadly. Genre-specific nuances in collapsible details blocks or tables, not separate files.

## Constraints

- Each skill targets ~800-1200 tokens loaded context
- Must work with Claude Code plugin system (`.claude-plugin/` directory structure)
- Skills load into existing line-cook commands — no custom command invocation needed
- Pure markdown — no external dependencies, scripts, or runtime requirements

## Conventions

- Skill names: kebab-case (`scoping`, `design-frameworks`, `antipatterns`)
- File structure follows godot-meta plugin pattern
- Decision tables for quick reference (Situation | Prefer | Avoid)
- Checklists for verification steps
- Examples grounded in real game design scenarios, not abstract theory
