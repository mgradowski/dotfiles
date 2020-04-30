#!/usr/bin/env bash

set -e
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle install --verbose
brew --cache | xargs rm -rf