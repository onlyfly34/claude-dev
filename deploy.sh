#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Deploying Claude Code config..."

# Settings
mkdir -p "$CLAUDE_DIR"
cp "$REPO_DIR/.claude/settings.json" "$CLAUDE_DIR/settings.json"
echo "  ✓ settings.json"

# Skills
for skill_file in "$REPO_DIR"/claude-skills/**/*.md; do
  name="$(basename "$skill_file" .md)"
  mkdir -p "$CLAUDE_DIR/skills/$name"
  cp "$skill_file" "$CLAUDE_DIR/skills/$name/SKILL.md"
  echo "  ✓ skill: $name"
done

echo "Done. Restart Claude Code to apply changes."
