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
cp README.md "${PLUGIN_DIR}/"

echo "Plugin installed to ${PLUGIN_DIR}"
echo ""
echo "Skills installed:"
echo "  - game-scoping: MLP scoping and tracer bullet planning"
echo "  - game-design-frameworks: MDA, core loops, player motivation"
echo "  - game-mechanics-palette: Mechanics catalog for browsing and mashups"
echo "  - game-economy-design: Resource systems, currencies, balance"
echo "  - game-difficulty-design: Difficulty curves, flow state, accessibility"
echo "  - game-content-planning: Level design, world structure, pacing"
echo "  - game-playtesting: Playtest methodology, iteration cadence"
echo "  - game-scenario-walkthrough: 5-beat experience narration"
echo "  - game-antipatterns: Common planning mistakes and audits"
echo ""
echo "These skills activate automatically during game planning sessions."
