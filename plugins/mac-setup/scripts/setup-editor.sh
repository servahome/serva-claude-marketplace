#!/bin/bash
set -e

BUNDLE="com.microsoft.VSCodeInsiders"
EXTS=(
  txt md rst log
  json yaml yml toml ini cfg conf
  sh bash zsh fish
  js ts jsx tsx
  py rb go rs swift
  html css scss sass
  xml svg
  dockerfile makefile
  gitignore env
)

if ! command -v duti &>/dev/null; then
  echo "Error: duti not found. Install with: brew install duti" >&2
  exit 1
fi

if ! osascript -e 'id of app "Visual Studio Code - Insiders"' &>/dev/null; then
  echo "Error: VS Code Insiders not found. Install from https://code.visualstudio.com/insiders/" >&2
  exit 1
fi

failed=0
for ext in "${EXTS[@]}"; do
  if ! duti -s "$BUNDLE" ".$ext" all 2>/dev/null; then
    echo "  skipped .$ext (system-protected)" >&2
    ((failed++)) || true
  else
    echo "  .$ext → VS Code Insiders"
  fi
done

echo "Done. $((${#EXTS[@]} - failed))/${#EXTS[@]} file types registered."
