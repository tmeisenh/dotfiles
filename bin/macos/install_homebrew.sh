#!/usr/bin/env bash
# Installs homebrew and all my brews

install_brew() {
  if [ ! -f "$(which brew)" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Homebrew found"
  fi
}

install_brew
brew doctor
brew update
brew bundle

echo "linking emacs"
#brew linkapps emacs-plus

echo ""
echo ""
echo "All done with basic install"
echo ""
echo ""
