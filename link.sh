#!/usr/bin/env bash

source "./vars.sh"

ln -si "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc" 
ln -si "$DOTFILES_DIR/keybindings.json" "$VSCODIUM_USER_PATH/keybindings.json"
ln -si "$DOTFILES_DIR/settings.json" "$VSCODIUM_USER_PATH/settings.json"

xargs -L 1 code --install-extension < "./.vscodeextensions"
