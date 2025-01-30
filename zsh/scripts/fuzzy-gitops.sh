function cs {
    local selected_server
    selected_server=$(find $GITOPS_APPS_DIRECTORY -type d | xargs basename | fzf +m --height 50%)
    if [[ -n "$selected_server" ]]; then
        echo "$selected_server"
    fi
}
