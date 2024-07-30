export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

plugins=(
 git
 git-extras
 kubectl
 kubectx
 brew
 python
 pyenv
 direnv
 terraform
 aws
 node
 docker
 docker-compose
 mise
 zsh-autosuggestions
)

DISABLE_UNTRACKED_FILES_DIRTY="true"

eval $(/opt/homebrew/bin/brew shellenv)

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

export H=$HOME
export PROJECT_HOME=$HOME/dev
export UPTICK=$HOME/dev
export CONFIG="$HOME/.config"
export GITOPS_APPS_DIRECTORY=$UPTICK/uptick-cluster/apps
export EDITOR="nvim"
export STARSHIP_CONFIG="$CONFIG/starship/config.toml"

source $ZSH/oh-my-zsh.sh
source $CONFIG/zsh/.zsh_aliases

source $CONFIG/bash/fzf-git/fzf_git_commits.sh
source $CONFIG/bash/fzf-git/fzf_git_branches.sh
source $CONFIG/bash/fzf-git/fzf_git_files.sh

eval "$(mise activate --status zsh)"
eval "$(starship init zsh)" 

