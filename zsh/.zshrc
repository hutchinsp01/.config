# zmodload zsh/zprof

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
#     atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
#     atpull"%atclone" src"init.zsh"
# 
# zinit light atuinsh/atuinn
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::aws
zinit snippet OMZP::git
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx

autoload -U compinit && compinit

zinit cdreplay -q

DISABLE_UNTRACKED_FILES_DIRTY="true"

eval $(/opt/homebrew/bin/brew shellenv)

export H=$HOME
export PROJECT_HOME=$HOME/dev
export UPTICK=$HOME/dev
export CONFIG="$HOME/.config"
export ZSH_SCRIPTS="$CONFIG/zsh/scripts"
export GITOPS_APPS_DIRECTORY=$UPTICK/uptick-cluster/apps
export EDITOR="nvim"
export STARSHIP_CONFIG="$CONFIG/starship/config.toml"

source $CONFIG/zsh/fzf-git/fzf_git_commits.sh
source $CONFIG/zsh/fzf-git/fzf_git_branches.sh
source $CONFIG/zsh/fzf-git/fzf_git_files.sh

source $CONFIG/zsh/scripts/fg-bg.sh
source $CONFIG/zsh/scripts/fuzzy-gitops.sh

source $CONFIG/zsh/.zsh_aliases

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
export HISTORY_IGNORE="(ls|wf|fg)"
export HISTFILE="$CONFIG/zsh/.zsh_history"

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

# Keybindings
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

eval "$(mise activate --status zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(atuin init zsh --disable-up-arrow)"

# zprof
