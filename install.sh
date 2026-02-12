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
echo "  - game-antipatterns: Common planning mistakes and audits"
echo ""
echo "These skills activate automatically during game planning sessions."
