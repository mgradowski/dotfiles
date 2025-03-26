# common configs
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

if type -q wormhole
    alias ws 'wormhole snd'
    alias wr 'wormhole receive'
end

if status --is-interactive
    SHELL=fish keychain --quiet --eval --agents ssh | source
    fish_user_key_bindings
end

if type -q direnv
    direnv hook fish | source
end

function pause_venv_hook
    mkdir -p ~/.local/state/venv_hook
    touch ~/.local/state/venv_hook/paused
end

function unpause_venv_hook
    rm -f ~/.local/state/venv_hook/paused
end

function venv_hook --on-event fish_prompt
    if test -f ~/.local/state/venv_hook/paused
        return
    end

    # Search for .venv in $PWD and parents recursively.
    set -l search_dir (pwd)
    while test "$search_dir" != "/" && not test -d "$search_dir/.venv"
        set search_dir (dirname "$search_dir")
    end

    # Deactivate if left a python project subtree.
    if test "$search_dir" = "/"
        type -q deactivate && echo "venv: deactivating $VIRTUAL_ENV" && deactivate
        return
    end

    set venv_path "$search_dir/.venv"

    # Still inside a previously activated environment.
    if test "$venv_path" = "$VIRTUAL_ENV"
        return
    end

    type -q deactivate && echo "venv: deactivating $VIRTUAL_ENV" && deactivate
    source "$venv_path/bin/activate.fish"
    echo "venv: activating $venv_path"
end

atuin init fish | source
