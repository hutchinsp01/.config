# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hutchinsp01/.oh-my-zsh"

eval $(/opt/homebrew/bin/brew shellenv)

ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export EDITOR="nvim"

export PROJECT_HOME=~/projects
export UPTICK=$PROJECT_HOME/Uptick

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CONFIG="$HOME/.config"
export GITOPS_APPS_DIRECTORY=$UPTICK/uptick-cluster/apps


plugin=(
 pyenv
 git
)

source $CONFIG/zsh/.zsh_aliases

eval "$(mise activate --status zsh)"

# Git commands
source $CONFIG/bash/fzf-git/fzf_git_commits.sh
source $CONFIG/bash/fzf-git/fzf_git_branches.sh
source $CONFIG/bash/fzf-git/fzf_git_files.sh

