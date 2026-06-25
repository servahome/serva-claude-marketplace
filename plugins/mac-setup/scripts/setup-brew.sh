#!/bin/bash
set -e

BREWFILE="$(cd "$(dirname "$0")/.." && pwd)/configs/Brewfile"

if ! command -v brew &>/dev/null; then
  echo "  Homebrew not found. Install it first: https://brew.sh"
  exit 1
fi

echo "  Running brew bundle from plugin Brewfile..."
brew bundle --file="$BREWFILE"
echo "  All packages installed."
