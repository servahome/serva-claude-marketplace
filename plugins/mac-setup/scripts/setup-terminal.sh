#!/bin/bash
set -e

GHOSTTY_CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
GHOSTTY_CONFIG="$GHOSTTY_CONFIG_DIR/config.ghostty"
PLUGIN_CONFIG="$(cd "$(dirname "$0")/.." && pwd)/configs/ghostty.conf"

mkdir -p "$GHOSTTY_CONFIG_DIR"

if [ -L "$GHOSTTY_CONFIG" ]; then
  current_target=$(readlink "$GHOSTTY_CONFIG")
  if [ "$current_target" = "$PLUGIN_CONFIG" ]; then
    echo "  Ghostty config already symlinked to plugin. Nothing to do."
    exit 0
  fi
  echo "  Replacing existing symlink..."
  rm "$GHOSTTY_CONFIG"
elif [ -f "$GHOSTTY_CONFIG" ]; then
  mv "$GHOSTTY_CONFIG" "$GHOSTTY_CONFIG.bak"
  echo "  Backed up existing config to config.ghostty.bak"
fi

ln -sf "$PLUGIN_CONFIG" "$GHOSTTY_CONFIG"
echo "  Ghostty config symlinked:"
echo "    $GHOSTTY_CONFIG → $PLUGIN_CONFIG"
echo "  Restart Ghostty for changes to take effect."
echo "  Future git pulls to the plugin repo will update Ghostty config automatically."
