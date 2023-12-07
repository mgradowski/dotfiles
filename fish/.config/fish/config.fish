# common configs
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# macOS-specific configs
if test (uname) = 'Darwin'
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH=/opt/context/tex/texmf-osx-64/bin:"$PATH"

    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_BUNDLE_FILE=$HOME/.Brewfile/Brewfile
end

function cd
    if test -z "$TMUX_SESSIONIZER" && test -z "$argv"
        builtin cd
    else if test -z "$TMUX_SESSIONIZER"
        builtin cd "$argv"
    else if test -z "$argv"
        builtin cd (tmux display -p "#{pane_start_path}")
    else
        builtin cd "$argv"
    end
end

alias nv 'nvim .'
alias va 'source (find . | grep -F bin/activate.fish | head -n1)'
alias da 'deactivate'
alias vinit 'python3 -m venv .venv'
alias reload_fish_config 'source "$__fish_config_dir/config.fish"'
alias duu 'du -ah . | sort -h'
if type -q clear && type -q neofetch
    alias cn 'clear;neofetch'
end
if type -q neofetch
    function fish_greeting
        neofetch
    end
else
    set -U fish_greeting
end

if status --is-interactive
    SHELL=fish keychain --quiet --eval --agents ssh | source
    fish_user_key_bindings
end

if type -q direnv
    direnv hook fish | source
end

if type -q poetry
    function venv_hook --on-event fish_prompt
        # Search for a Poetry pyproject.toml in $PWD and all parents.
        set -l search_dir (pwd)
        while test "$search_dir" != "/"
            if grep -qs "tool.poetry" "$search_dir/pyproject.toml" || test -d "$search_dir/.venv"
                break
            end
            set search_dir (dirname "$search_dir")
        end

        # Deactivate if left a python project subtree.
        if test "$search_dir" = "/"
            type -q deactivate && echo "venv: deactivating $VIRTUAL_ENV" && deactivate
            return
        end

        set -l is_poetry
        if grep -qs "tool.poetry" "$search_dir/pyproject.toml"
            set is_poetry 1
        end

        # Poetry is really stubborn when asked about an environment, while
        # we're inside another environment...
        set -l venv_path
        if test -n "$is_poetry"
            set -l VIRTUAL_ENV
            set venv_path (poetry env info --path)
        else
            set venv_path "$search_dir/.venv"
        end;

        # Found a Poetry project but no venv created yet.
        if test -z "$venv_path"
            poetry show > /dev/null
            set venv_path (poetry env info --path)
        end

        # Still inside a previously activated environment.
        if test "$venv_path" = "$VIRTUAL_ENV"
            return
        end

        type -q deactivate && echo "venv: deactivating $VIRTUAL_ENV" && deactivate
        source "$venv_path/bin/activate.fish"
        echo "venv: activating $venv_path"
    end
end

