#!/usr/bin/env bash
# Clones antigen to ~/git where zsh config expects it

ANTIGEN_DIR="$HOME/git/antigen"
ANTIGEN_REPO="https://github.com/zsh-users/antigen.git"

mkdir -p "$HOME/git"

if [ -d "$ANTIGEN_DIR" ]; then
  echo "Antigen already installed, pulling latest..."
  git -C "$ANTIGEN_DIR" pull
else
  echo "Cloning antigen..."
  git clone "$ANTIGEN_REPO" "$ANTIGEN_DIR"
fi
