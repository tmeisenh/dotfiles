#!/usr/bin/env bash
# Installs homebrew and all my brews

install_brew() {
  /usr/bin/which -s brew
  ret=$?
  if [ $ret -ne 0 ]; then
    echo "Homebrew not found, trying to install..."
    curl --fail --silent --show-error --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
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
echo "You need to reboot for some changes (like fonts) to be applied"
echo ""
echo ""
