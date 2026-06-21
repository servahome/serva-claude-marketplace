#!/bin/bash
set -e

GHOSTTY_CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
GHOSTTY_CONFIG="$GHOSTTY_CONFIG_DIR/config.ghostty"
PLUGIN_CONFIG="$(dirname "$0")/../configs/ghostty.conf"

mkdir -p "$GHOSTTY_CONFIG_DIR"

if [ -f "$GHOSTTY_CONFIG" ]; then
  cp "$GHOSTTY_CONFIG" "$GHOSTTY_CONFIG.bak"
  echo "  Backed up existing config to config.ghostty.bak"
fi

cp "$PLUGIN_CONFIG" "$GHOSTTY_CONFIG"
echo "  Ghostty config applied (Monokai Remastered theme)"
echo "  Restart Ghostty for changes to take effect."
