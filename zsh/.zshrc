export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

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
 vi-mode
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

source $CONFIG/zsh/fzf-git/fzf_git_commits.sh
source $CONFIG/zsh/fzf-git/fzf_git_branches.sh
source $CONFIG/zsh/fzf-git/fzf_git_files.sh

source $CONFIG/zsh/scripts/vi-mode.sh
source $CONFIG/zsh/scripts/fg-bg.sh
source $CONFIG/zsh/scripts/fuzzy-gitops.sh

source $ZSH/oh-my-zsh.sh
source $CONFIG/zsh/.zsh_aliases

# History
setopt append_history        # Append to history, rather than overwriting
setopt inc_append_history    # Append immediately rather than only at exit
setopt extended_history      # Store some metadata as well
setopt hist_no_store         # Don't store history and fc commands
setopt no_bang_hist          # Don't use ! for history expansion
setopt hist_ignore_dups      # Don't add to history if it's the same as previous event.
setopt hist_ignore_all_dups  # Remove older event if new event is duplicate.
setopt hist_save_no_dups     # Older commands that duplicate newer ones are omitted.
HISTSIZE=11000               # Max. entries to keep in memory
SAVEHIST=10000               # Max. entries to save to file
export HISTORY_IGNORE="(ls|wf|fg)"

eval "$(mise activate --status zsh)"
eval "$(starship init zsh)"

