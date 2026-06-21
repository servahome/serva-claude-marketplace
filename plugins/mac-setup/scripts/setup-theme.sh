#!/bin/bash
set -e

echo "  Enabling dark mode..."
defaults write NSGlobalDomain AppleInterfaceStyle Dark

echo "  Configuring Dock..."
defaults write com.apple.dock orientation left
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock show-recents -bool false

echo "  Restarting Dock..."
killall Dock

echo "  Done. Dark mode is active. Log out and back in for all changes to fully apply."
