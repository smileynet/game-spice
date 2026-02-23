#!/bin/bash
# Installation script for game-spice Claude Code plugin (local dev convenience)

set -e

PLUGIN_NAME="game-spice"
PLUGIN_DIR="${HOME}/.claude/plugins/${PLUGIN_NAME}"

echo "Installing ${PLUGIN_NAME} plugin for Claude Code..."

# Create plugin directory
mkdir -p "${PLUGIN_DIR}"

# Copy plugin files
cp -r .claude-plugin "${PLUGIN_DIR}/"
cp -r skills "${PLUGIN_DIR}/"
cp -r commands "${PLUGIN_DIR}/"
cp -r agents "${PLUGIN_DIR}/"
cp -r templates "${PLUGIN_DIR}/"
cp README.md "${PLUGIN_DIR}/"

echo "Plugin installed to ${PLUGIN_DIR}"
echo ""
echo "Skills installed:"
echo "  - scoping: MLP scoping and tracer bullet planning"
echo "  - design-frameworks: MDA, core loops, player motivation"
echo "  - mechanics-palette: Mechanics catalog for browsing and mashups"
echo "  - economy-design: Resource systems, currencies, balance"
echo "  - difficulty-design: Difficulty curves, flow state, accessibility"
echo "  - content-planning: Level design, world structure, pacing"
echo "  - playtesting: Playtest methodology, iteration cadence"
echo "  - scenario-walkthrough: 5-beat experience narration"
echo "  - antipatterns: Common planning mistakes and audits"
echo "  - plan-audit: Plan completeness scoring and GDD quality checks"
echo "  - architecture-audit: Game loop, state machines, engine-specific patterns"
echo "  - implementation: Game loop setup, state management, coding guidance"
echo "  - ascii-wireframing: Box-drawing toolkit and wireframe patterns"
echo "  - simulation-guide: Wizard of Oz simulation facilitation rules"
echo ""
echo "Commands: /game:start, /game:brainstorm, /game:simulate, /game:build-plan,"
echo "          /game:status, /game:help, /game:walkthrough"
echo "Templates: GDD and tech-spec generation templates"
echo "Agents: game-reviewer (architecture review during /line:serve)"
echo ""
echo "Skills activate automatically during game planning and implementation sessions."
