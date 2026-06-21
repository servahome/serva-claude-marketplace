#!/bin/bash

PLUGIN_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PASS=0
FAIL=0
SKIP=0

check() {
  local label="$1"
  local status="$2"
  local detail="$3"
  if [ "$status" = "ok" ]; then
    echo "  ✓ $label"
    PASS=$((PASS + 1))
  elif [ "$status" = "skip" ]; then
    echo "  - $label — $detail"
    SKIP=$((SKIP + 1))
  else
    echo "  ✗ $label — $detail"
    FAIL=$((FAIL + 1))
  fi
}

echo ""
echo "Editor (duti)"
echo "─────────────────────────"
if ! command -v duti &>/dev/null; then
  check "duti installed" skip "duti not found — run /mac-setup:editor first"
elif ! command -v code-insiders &>/dev/null; then
  check "VS Code Insiders installed" skip "code-insiders not in PATH"
else
  BUNDLE="com.microsoft.VSCodeInsiders"
  for ext in js ts jsx tsx json py rb sh md yaml yml toml rs go java swift kt c cpp h; do
    uti=$(mdls -name kMDItemContentTypeTree /dev/null 2>/dev/null | head -1 || true)
    current=$(duti -x "$ext" 2>/dev/null | awk 'NR==2')
    if [ "$current" = "$BUNDLE" ]; then
      check ".$ext → VS Code Insiders" ok ""
    else
      check ".$ext → VS Code Insiders" fail "currently: ${current:-unset}"
    fi
  done
fi

echo ""
echo "Terminal (Ghostty)"
echo "─────────────────────────"
GHOSTTY_CONFIG="$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
PLUGIN_GHOSTTY="$PLUGIN_ROOT/configs/ghostty.conf"
if [ ! -e "$GHOSTTY_CONFIG" ]; then
  check "Ghostty config exists" fail "not found"
elif [ -L "$GHOSTTY_CONFIG" ]; then
  target=$(readlink "$GHOSTTY_CONFIG")
  if [ "$target" = "$PLUGIN_GHOSTTY" ]; then
    check "Ghostty config symlinked" ok ""
  else
    check "Ghostty config symlinked" fail "points to: $target (expected: $PLUGIN_GHOSTTY)"
  fi
else
  if diff -q "$GHOSTTY_CONFIG" "$PLUGIN_GHOSTTY" &>/dev/null; then
    check "Ghostty config matches" ok "(copied, not symlinked)"
  else
    check "Ghostty config matches" fail "file differs from plugin config — run /mac-setup:terminal"
  fi
fi

echo ""
echo "Shell"
echo "─────────────────────────"
if [ -d "$HOME/.oh-my-zsh" ]; then
  check "oh-my-zsh installed" ok ""
else
  check "oh-my-zsh installed" fail "~/.oh-my-zsh not found"
fi

if brew list powerlevel10k &>/dev/null 2>&1; then
  check "powerlevel10k installed" ok ""
else
  check "powerlevel10k installed" fail "not installed via brew"
fi

if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  check "zsh-autosuggestions" ok ""
else
  check "zsh-autosuggestions" fail "not found in \$ZSH_CUSTOM/plugins"
fi

if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  check "zsh-syntax-highlighting" ok ""
else
  check "zsh-syntax-highlighting" fail "not found in \$ZSH_CUSTOM/plugins"
fi

ZSHRC_TEMPLATE="$PLUGIN_ROOT/configs/zshrc.template"
if diff -q "$HOME/.zshrc" "$ZSHRC_TEMPLATE" &>/dev/null 2>&1; then
  check "~/.zshrc matches template" ok ""
else
  check "~/.zshrc matches template" fail "differs from plugin template — manual edits or drift"
fi

echo ""
echo "Claude Code"
echo "─────────────────────────"
CLAUDE_SETTINGS="$HOME/.claude/settings.json"
if [ ! -f "$CLAUDE_SETTINGS" ]; then
  check "settings.json exists" fail "~/.claude/settings.json not found"
else
  check "settings.json exists" ok ""
  for key in model effortLevel verbose; do
    val=$(jq -r ".$key // empty" "$CLAUDE_SETTINGS" 2>/dev/null)
    if [ -n "$val" ]; then
      check "$key is set ($val)" ok ""
    else
      check "$key is set" fail "key missing or null"
    fi
  done
fi

echo ""
echo "macOS Theme"
echo "─────────────────────────"
dark=$(defaults read NSGlobalDomain AppleInterfaceStyle 2>/dev/null || echo "Light")
if [ "$dark" = "Dark" ]; then
  check "Dark mode" ok ""
else
  check "Dark mode" fail "currently: $dark"
fi

dock_orient=$(defaults read com.apple.dock orientation 2>/dev/null || echo "bottom")
if [ "$dock_orient" = "left" ]; then
  check "Dock position: left" ok ""
else
  check "Dock position: left" fail "currently: $dock_orient"
fi

autohide=$(defaults read com.apple.dock autohide 2>/dev/null || echo "0")
if [ "$autohide" = "1" ]; then
  check "Dock auto-hide" ok ""
else
  check "Dock auto-hide" fail "currently off"
fi

echo ""
echo "Homebrew Packages"
echo "─────────────────────────"
BREWFILE="$PLUGIN_ROOT/configs/Brewfile"
if ! command -v brew &>/dev/null; then
  check "Homebrew installed" skip "brew not found"
else
  if brew bundle check --file="$BREWFILE" &>/dev/null 2>&1; then
    check "All Brewfile packages installed" ok ""
  else
    missing=$(brew bundle check --file="$BREWFILE" 2>&1 | grep "^The following dependencies are not installed" -A 999 | tail -n +2 | tr '\n' ' ')
    check "All Brewfile packages installed" fail "missing: ${missing:-some packages} — run /mac-setup:brew"
  fi
fi

echo ""
echo "Fonts"
echo "─────────────────────────"
for font in "JetBrains Mono" "JetBrainsMono Nerd Font"; do
  if system_profiler SPFontsDataType 2>/dev/null | grep -q "$font"; then
    check "Font: $font" ok ""
  elif ls ~/Library/Fonts/ 2>/dev/null | grep -qi "$(echo "$font" | tr ' ' '-')"; then
    check "Font: $font" ok ""
  else
    check "Font: $font" fail "not found — run /mac-setup:fonts"
  fi
done

echo ""
echo "Git Config"
echo "─────────────────────────"
git_user=$(git config --global user.name 2>/dev/null || echo "")
git_email=$(git config --global user.email 2>/dev/null || echo "")
if [ -n "$git_user" ]; then
  check "git user.name ($git_user)" ok ""
else
  check "git user.name" fail "not set — run /mac-setup:git-config"
fi
if [ -n "$git_email" ]; then
  check "git user.email ($git_email)" ok ""
else
  check "git user.email" fail "not set — run /mac-setup:git-config"
fi

echo ""
echo "─────────────────────────"
echo "Summary: $PASS passed, $FAIL drifted, $SKIP skipped"
if [ "$FAIL" -gt 0 ]; then
  echo "Run /mac-setup to fix drifted categories."
  exit 1
fi
exit 0
