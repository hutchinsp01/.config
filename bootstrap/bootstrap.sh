#!/bin/bash
# Setup script for setting up a new macos machine

echo "Starting setup"

# Macos Settings
echo "Setting up Macos"
source macos.sh

# Install Oh My Zsh
echo "Installing Oh My Zsh"
curl -fsSL 'https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh' | sh
echo "ZDOTDIR=$HOME/.config/zsh" >> $HOME/.zshenv

# Install Xcode Command Line Tools
echo "Installing Xcode Command Line Tools"
xcode-select --install

# Run Homebrew script
echo "Installing Homebrew"
source brew.sh

