#!/bin/bash
set -e

if ! command -v brew &>/dev/null; then
  echo "  Homebrew not found. Install it first: https://brew.sh"
  exit 1
fi

echo "  Installing JetBrains Mono..."
brew install --cask font-jetbrains-mono 2>/dev/null || echo "  font-jetbrains-mono already installed."

echo "  Installing JetBrains Mono Nerd Font (terminal icons)..."
brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || echo "  font-jetbrains-mono-nerd-font already installed."

echo "  Fonts installed."
echo "  Restart Ghostty, VS Code Insiders, and any other open apps to pick up the new fonts."
