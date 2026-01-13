#!/usr/bin/env bash

set -e

target=$HOME

setup_vim() {
  # Install vim-plug if not present
  if [ ! -f "$target"/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug..."
    curl -fLo "$target"/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  echo "Installing plugins..."
  vim +PlugInstall +qall
}

setup_vim
echo 'VIM Installation complete'
