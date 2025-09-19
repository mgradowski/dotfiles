# common configs

export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

set -U fish_greeting


function err
    echo $argv >&2
end

# venv_hook

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
        type -q deactivate && err "venv: deactivating $VIRTUAL_ENV" && deactivate
        return
    end

    set venv_path "$search_dir/.venv"

    # Still inside a previously activated environment.
    if test "$venv_path" = "$VIRTUAL_ENV"
        return
    end

    type -q deactivate && err "venv: deactivating $VIRTUAL_ENV" && deactivate
    source "$venv_path/bin/activate.fish"
    err "venv: activating $venv_path"
end


# uvedit

function uvedit
  if test (count $argv) -ne 1
    err "usage: uvedit <path to script>"
    return 1
  end

  set -l script_path $argv[1]

  if not test -f "$script_path"
    err "error: '$script_path' is not a file"
    return 1
  end

  uv sync --script "$script_path"
  set -l python_executable (uv python find --script "$script_path")
  set -l venv_root (dirname (dirname $python_executable))
  begin
    source "$venv_root/bin/activate.fish"
    nvim "$script_path"
  end
end



# ssh proxy utils

function proxy
    set --local _ssh_proxy socks5://127.0.0.1:9999

    if test -z "$argv"
        export ALL_PROXY=$_ssh_proxy
        export HTTPS_PROXY=$_ssh_proxy
        err 'proxy: activated'
    else if test -z "$ALL_PROXY" -o -z "$HTTPS_PROXY"
        err 'proxy: temporarily activated'
        ALL_PROXY=$_ssh_proxy HTTPS_PROXY=$_ssh_proxy command $argv
    else
        command $argv
    end
end

function unproxy
    if test -z "$argv"
        set --erase ALL_PROXY
        set --erase HTTPS_PROXY
        err 'proxy: deactivated'
    else if test -n "$ALL_PROXY" -o -n "$HTTPS_PROXY"
        err 'proxy: temporarily deactivated'
        env -u ALL_PROXY -u HTTPS_PROXY $argv
    else
        command $argv
    end
end


# macOS-specific configs

if test (uname) = 'Darwin'
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH=/opt/context/tex/texmf-osx-64/bin:"$PATH"

    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_BUNDLE_FILE=$HOME/.Brewfile/Brewfile
end


# host-specific configs

if test (string match -r '^4d23bca0.*' (hostname | sha512sum))
    # fix pre-commit (pysocks)
    export VIRTUALENV_SYSTEM_SITE_PACKAGES=True

    alias uvx 'command uvx --with pysocks'

    ulimit -n 10240
end


if not status --is-interactive
    return
end

# interactive configs

fish_user_key_bindings
SHELL=fish keychain --quiet --eval --agents ssh --inherit any | source
atuin init fish | source

if type -q direnv
    direnv hook fish | source
end

alias nv 'nvim .'
alias va 'source (find . | grep -F bin/activate.fish | head -n1)'
alias da 'deactivate'
alias vinit 'python3 -m venv .venv'
alias reload_fish_config 'source "$__fish_config_dir/config.fish"'
alias poetry 'uvx --with pysocks poetry'

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
