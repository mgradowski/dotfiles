function tmux_sessionizer
    set selected (find ~/projects -mindepth 1 -maxdepth 1 -type d | awk 'BEGIN { print "'$HOME'/dotfiles" } { print $0 }' | fzf)

    if test -z $selected
        exit 0
    end

    set selected_name (basename "$selected" | tr . _)
    set tmux_running (pgrep tmux)

    if test -z $TMUX  && test -z $tmux_running
        tmux new-session -s $selected_name -c $selected
        exit 0
    end

    if ! tmux has-session -t=$selected_name 2> /dev/null
        tmux new-session -ds $selected_name -c $selected
    end

    tmux switch-client -t $selected_name
end

