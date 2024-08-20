#!/bin/bash
# Install Homebrew

# Check for Homebrew, install if we don't have it

function install_brew() {
    if [ -e /opt/homebrew/bin/brew ]; then
        echo "Homebrew is already installed."
    else
        echo "Installing Homebrew."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval $(/opt/homebrew/bin/brew shellenv)
        /opt/homebrew/bin/brew update
        /opt/homebrew/bin/brew upgrade
    fi
}

install_brew

# Install applications
brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" kitty
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" iterm2
brew install --cask --appdir="/Applications" postman
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" spotify
brew install --cask --appdir="/Applications" 1password

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Install Taps
brew tap FelixKratz/formulae

# Install formulas
brew install fzf
brew install git
brew install neovim
brew install tokyo-cabinet
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install sketchybar

# Nvim formulas
brew install ripgrep
brew install fd
brew install make
brew install gcc
brew install cmake
