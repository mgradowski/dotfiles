#!/usr/bin/env bash

source "./vars.sh"

rm "$HOME/.vimrc"
rm "$VSCODIUM_USER_PATH/keybindings.json"
rm "$VSCODIUM_USER_PATH/settings.json"

xargs -L 1 code --uninstall-extension < "./.vscodeextensions"
