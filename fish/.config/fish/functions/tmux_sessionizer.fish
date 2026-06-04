set mru_file ~/.local/state/tmux_sessionizer/mru
mkdir -p (dirname $mru_file)

function tmux_sessionizer
    set selected (find -L ~/projects -mindepth 1 -maxdepth 1 -type d | \
        awk -v OFS='\t' 'BEGIN {
            print "1970-01-01 00:00:00", ENVIRON["HOME"] "/vimwiki"
            print "1970-01-01 00:00:00", ENVIRON["HOME"] "/dotfiles"
            print "1970-01-01 00:00:00", ENVIRON["HOME"]
        } {
            print "1970-01-01 00:00:00", $0
        }' | \
        cat $mru_file - | \
        awk -F'\t' -v dir="$TMUX_SESSIONIZER" '$2 != dir' | \
        sort -t'\t' -k1r | \
        awk -F'\t' '!seen[$2]++ { print $2 }' | \
        fzf --bind 'ctrl-b:up')

    if test -z $selected
        exit 0
    end

    _update_mru $selected

    set selected_name (basename "$selected" | tr . _)
    set tmux_running (pgrep tmux)

    if test -z $TMUX  && test -z $tmux_running
        tmux new-session -s $selected_name -c $selected -e TMUX_SESSIONIZER=$selected
        exit 0
    end

    if ! tmux has-session -t=$selected_name 2> /dev/null
        tmux new-session -ds $selected_name -c $selected -e TMUX_SESSIONIZER=$selected 
    end

    tmux switch-client -t $selected_name
end

function _update_mru
    set -l dir $argv[1]
    set -l ts (date '+%Y-%m-%d %H:%M:%S')
    touch $mru_file
    awk -F'\t' -v dir="$dir" '$2 != dir' $mru_file > $mru_file.tmp && mv $mru_file.tmp $mru_file
    printf '%s\t%s\n' "$ts" "$dir" >> $mru_file
end