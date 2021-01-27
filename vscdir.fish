#! /usr/bin/env fish

set platform (uname)

if test $platform = 'Darwin'
    echo "$HOME/Library/Application Support/Code/User"
else if test $platform = 'Linux'
    echo "$HOME/.config/Code/User"
else
    exit 1
end
