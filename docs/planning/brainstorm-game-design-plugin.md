# Brainstorm: Game Design Planning Plugin

> Exploration document from `/line:brainstorm` phase.

**Created:** 2026-02-11
**Status:** Ready for Planning

---

## Problem Statement

### What pain point are we solving?

When using line-cook's mise planning workflow (`/line:brainstorm` → `/line:scope` → `/line:finalize`) for game projects, the planning guidance is generic software engineering advice. It lacks game-specific frameworks for evaluating ideas, scoping mechanics, designing core loops, planning narratives, and avoiding the planning antipatterns unique to game development (scope creep around "one more feature," designing systems in isolation, etc.).

Game ideas tend to balloon during planning because everything sounds fun. Without structured guidance grounded in game design best practices, plans either stay too vague ("make a fun RPG") or explode in scope ("200-hour open world with crafting, multiplayer, and procedural generation").

### Who experiences this pain?

Game developers (particularly solo/indie) using Claude Code + line-cook to plan new game projects. The user moves between multiple game ideas (action/arcade, idle/incremental, narrative, strategy, simulation) and needs consistent, framework-driven planning guidance across all of them.

### What happens if we don't solve it?

- Game plans remain vague or over-scoped
- Line-cook's brainstorm/scope phases produce generic software plans that miss game-specific concerns (player experience, engagement loops, difficulty curves)
- Scope creep goes unchecked because there's no framework for "what's essential to the core experience"
- Tracer bullet features get defined around technical milestones rather than playable vertical slices
- Planning sessions reinvent the wheel each time instead of applying proven frameworks

---

## User Perspective

### Primary User

Solo/indie game developer using Claude Code with line-cook and beads for project management. Works across multiple game genres and ideas.

### User Context

- Uses `/line:mise` to plan new game ideas
- Familiar with game design concepts but benefits from structured frameworks
- Wants to go from "I have a game idea" to "I have a scoped MLP with concrete tracer bullet features"
- Does NOT want code-level planning — wants mechanics, story, UX, and player experience planning
- Works with Godot (has godot-meta plugin) but this plugin is engine-agnostic

### Success Criteria (User's View)

1. When running `/line:brainstorm` on a game idea, Claude applies game-specific frameworks (MDA, core loop analysis, player motivation) to explore the idea deeply
2. When running `/line:scope`, the work breakdown reflects game design structure (core loop → supporting mechanics → polish) rather than generic technical decomposition
3. The resulting MLP plan focuses on a playable vertical slice that validates the core experience
4. Common game planning antipatterns are flagged before they become embedded in the plan
5. The guidance works across genres: action, idle, narrative, strategy, simulation, etc.

---

## Technical Exploration

### Existing Patterns in Codebase

| Pattern | Location | Relevance |
|---------|----------|-----------|
| Skills-only plugin structure | `godot-meta/claude-code-plugin/skills/` | Direct template — SKILL.md format with frontmatter |
| Line-cook skills (local) | `line-cook/.claude/skills/project-minimalism/` | Shows skill writing style: decision tables, progressive disclosure, details blocks |
| Plugin manifest | `godot-meta/claude-code-plugin/.claude-plugin/plugin.json` | JSON structure with name, version, keywords |
| Brainstorm template | `line-cook/docs/templates/brainstorm.md` | Planning output format this plugin augments |
| Scope command | `line-cook/commands/scope.md` | The command that will consume these skills during game planning |

### External Approaches Researched

| Approach | Source | Trade-offs |
|----------|--------|------------|
| MDA Framework (Mechanics, Dynamics, Aesthetics) | Hunicke/LeBlanc/Zubek (GDC 2001-2004) | Excellent analytical lens; can be too abstract for early planning |
| MLP (Minimum Lovable Product) | Product management practice | Better than MVP for games — players need delight, not just function |
| Tracer Bullet Development | Pragmatic Programmer | Perfect for games — build playable vertical slice, not throwaway prototype |
| MoSCoW Prioritization | Project management | Clear framework for ruthless feature cutting |
| Core Loop Design | Industry standard | The heartbeat of any game — action → reward → reinvestment |
| Systems Thinking / Feedback Loops | Machinations.io, game design academia | Essential for understanding how mechanics interact |
| Flow Theory (Csikszentmihalyi) | Psychology → Game Design | Maps directly to difficulty curve and engagement design |
| GDD Best Practices | Industry evolution | Modern approach: lightweight, living docs over heavy tomes |

### Constraints from Architecture

- **Skills-only plugin**: No new commands or agents. Skills are loaded on-demand by existing line-cook commands.
- **Plugin distribution**: Must follow `.claude-plugin/` structure with `plugin.json` manifest and `skills/<name>/SKILL.md` files.
- **Context budget**: Each skill should target ~800-1200 tokens when loaded. Progressive disclosure (decision tables → details blocks → references) keeps context lean.
- **Genre-agnostic**: Must work across action, idle, narrative, strategy, simulation, and hybrid genres.

---

## Technical Approaches Considered

### Option A: Monolithic Skill

**Description:** Single `game-design/SKILL.md` with all guidance in one file.

**Pros:**
- Simplest to implement and maintain
- Always loads complete context

**Cons:**
- Too large for context budget (~800-1200 token target per skill)
- Loads irrelevant guidance (narrative design when scoping an idle game)
- Harder to evolve individual sections

**Effort:** Low

### Option B: Three Focused Skills (Recommended)

**Description:** Three skills aligned to the planning workflow:
1. **game-scoping** — MLP methodology, tracer bullets, scope management, prioritization
2. **game-design-frameworks** — MDA, core loops, systems thinking, engagement, difficulty, narrative
3. **game-antipatterns** — Common planning mistakes, decision tables for what to avoid

**Pros:**
- Each skill fits context budget
- Aligns with planning phases (scoping loads during `/line:scope`, frameworks during `/line:brainstorm`)
- Antipatterns skill serves as a checklist/review layer
- Easy to extend with genre-specific sub-skills later

**Cons:**
- Slightly more files to maintain
- Some cross-references between skills needed

**Effort:** Medium

### Option C: Genre-Specific Skills

**Description:** Separate skills per genre (idle-game-design, action-game-design, narrative-game-design, etc.) plus a core skill.

**Pros:**
- Most tailored guidance per genre
- Loads only relevant genre context

**Cons:**
- Significant duplication across genres (core loop design applies to all)
- Many files to maintain
- Genre boundaries are fuzzy (idle + narrative hybrid?)
- Premature optimization — speculative generality

**Effort:** High

---

## Risks and Unknowns

### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Skills too large for context budget | M | M | Progressive disclosure: decision tables first, details blocks for depth |
| Skills not loaded during planning commands | L | H | Test that line-cook commands pick up plugin skills correctly |
| Guidance too abstract to be actionable | M | H | Include concrete examples, decision tables, and checklists |

### Dependency Risks

- Depends on line-cook plugin being installed and active
- Skill loading mechanism must be compatible with current Claude Code plugin system
- No external dependencies (pure markdown knowledge base)

### Scope Risks

- Risk of trying to be a "complete game design textbook" — must stay focused on **planning and scoping**, not implementation
- Genre coverage could expand indefinitely — initial version should be genre-agnostic with genre-specific tips, not genre-specific skills
- The line between "planning" and "design" is fuzzy — need clear boundary: this plugin helps you decide WHAT to build and in WHAT ORDER, not HOW to build it

### Open Questions

- [x] Plugin name / namespace → Game-oriented extension to line-cook
- [x] Skills vs. commands → Skills only
- [x] Genre scope → Genre-agnostic with broad coverage
- [ ] How does line-cook discover/load plugin skills during brainstorm/scope? Need to verify the loading mechanism.

---

## Recommended Direction

### Chosen Approach

**Option B: Three Focused Skills** — `game-scoping`, `game-design-frameworks`, and `game-antipatterns`, packaged as a Claude plugin that extends line-cook's planning workflow.

### Rationale

This approach balances comprehensiveness with context efficiency. Three skills align naturally to three concerns: *what to build* (scoping), *how to think about it* (frameworks), and *what to avoid* (antipatterns). Each skill stays within context budget while providing actionable, framework-driven guidance. The plugin follows established patterns from godot-meta (skills-only plugin with `.claude-plugin/` structure).

### Suggested Scope

| Scope | Recommendation |
|-------|----------------|
| MLP | Three skills (game-scoping, game-design-frameworks, game-antipatterns) + plugin manifest. Genre-agnostic. Focused on planning phase only. |
| Full Feature | Add genre-specific supplementary docs within each skill folder. Add worked examples (e.g., "scoping an idle game" walkthrough). |
| Epic | Full genre-specific skill modules. Game design review agent. Custom commands that extend mise workflow. |

### Deferred Items

- Genre-specific skill modules (idle, action, narrative, strategy)
- Game design review agent (checks plans for antipatterns automatically)
- Custom commands (e.g., `/game:core-loop-analysis`)
- Worked example walkthroughs
- Integration with godot-meta plugin

---

## Next Steps

- [ ] Proceed to `/line:scope` to create structured work breakdown
- [ ] Define skill content outlines for each of the three skills
- [ ] Verify plugin skill loading mechanism with line-cook
