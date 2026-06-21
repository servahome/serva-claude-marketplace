#!/bin/bash
set -e

PLUGIN_DIR="$(dirname "$0")/.."
ZSHRC_TEMPLATE="$PLUGIN_DIR/configs/zshrc.template"

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "  Installing oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "  oh-my-zsh already installed, skipping"
fi

# powerlevel10k
if ! brew list powerlevel10k &>/dev/null; then
  echo "  Installing powerlevel10k..."
  brew install powerlevel10k
else
  echo "  powerlevel10k already installed, skipping"
fi

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "  Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
else
  echo "  zsh-autosuggestions already installed, skipping"
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "  Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
else
  echo "  zsh-syntax-highlighting already installed, skipping"
fi

# Apply zshrc
if [ -f "$HOME/.zshrc" ]; then
  cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
  echo "  Backed up existing .zshrc to .zshrc.bak"
fi

cp "$ZSHRC_TEMPLATE" "$HOME/.zshrc"
echo "  .zshrc applied"
echo "  Run 'source ~/.zshrc' or restart terminal to apply changes."
