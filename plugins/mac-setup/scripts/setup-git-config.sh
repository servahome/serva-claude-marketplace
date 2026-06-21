#!/bin/bash
set -e

TEMPLATE="$(cd "$(dirname "$0")/.." && pwd)/configs/gitconfig.template"

current_name=$(git config --global user.name 2>/dev/null || echo "")
current_email=$(git config --global user.email 2>/dev/null || echo "")

if [ -n "$current_name" ]; then
  GIT_NAME="$current_name"
else
  printf "  Git user name: "
  read -r GIT_NAME
fi

if [ -n "$current_email" ]; then
  GIT_EMAIL="$current_email"
else
  printf "  Git email: "
  read -r GIT_EMAIL
fi

DEST="$HOME/.gitconfig"

if [ -f "$DEST" ] && ! [ -s "$DEST" ]; then
  : # empty file, safe to overwrite
elif [ -f "$DEST" ]; then
  cp "$DEST" "$DEST.bak"
  echo "  Backed up existing .gitconfig to .gitconfig.bak"
fi

sed \
  -e "s/PLACEHOLDER_NAME/$GIT_NAME/" \
  -e "s/PLACEHOLDER_EMAIL/$GIT_EMAIL/" \
  "$TEMPLATE" > "$DEST"

echo "  Git config applied:"
echo "    user.name  = $GIT_NAME"
echo "    user.email = $GIT_EMAIL"
echo "    core.editor = code-insiders --wait"
echo "    merge/diff tool: VS Code Insiders"
echo "    aliases: st, co, br, lg, undo, unstage, last"
