#!/usr/bin/env bash

set -e

target=$HOME

setup_vim() {
  if [ ! -d "$target"/.vim/vundle ]; then
    git clone https://github.com/gmarik/vundle.git "$target"/.vim/bundle/vundle
  fi
  vim +BundleInstall +qall
}

setup_vim
echo 'VIM Installation complete'
