#!/bin/bash
set -e

SETTINGS_FILE="$HOME/.claude/settings.json"
mkdir -p "$HOME/.claude"

DEFAULTS='{
  "model": "claude-sonnet-4-6",
  "preferredNotifChannel": "terminal",
  "editor": "code-insiders",
  "shellIntegration": true
}'

if [ -f "$SETTINGS_FILE" ]; then
  echo "  Merging with existing settings.json..."
  merged=$(jq -s '.[0] * .[1]' "$SETTINGS_FILE" <(echo "$DEFAULTS"))
  echo "$merged" > "$SETTINGS_FILE"
else
  echo "$DEFAULTS" > "$SETTINGS_FILE"
fi

echo "  Claude Code settings applied:"
jq '.' "$SETTINGS_FILE"
