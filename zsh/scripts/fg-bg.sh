# fg-bg toggle via c-z
function fg-bg {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER=fg
        zle accept-line
    else
        zle push-input
    fi
}

zle -N fg-bg
bindkey '^Z' fg-bg
