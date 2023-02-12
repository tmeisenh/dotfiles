#!/usr/bin/env bash

source ~/bin-darwin/get_homebrew_path.sh
export PATH=$HOMEBREW_HOME/bin:$HOMEBREW_HOME/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

if [ ! -f "$(which brew)" ]; then
  echo "homebrew is not installed"
  exit 1
fi

echo "Starting at $(date)"
(
  brew update && brew upgrade
  brew upgrade --cask
  brew doctor
  brew cleanup
  brew autoremove
)
echo "Finished at $(date)"
echo "--------------------------------------------------------------------------------"
