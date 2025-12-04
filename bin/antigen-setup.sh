#!/usr/bin/env bash
#
# Script to set up Antigen for Zsh plugin management
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#

set -e

ANTIGEN_DIR="$HOME/git/antigen"
ANTIGEN_REPO="https://github.com/zsh-users/antigen.git"

echo
echo "Setting up Antigen for Zsh plugin management..."

# Check if Antigen is already installed
if [ -d "$ANTIGEN_DIR" ]; then
    echo "Antigen is already installed at $ANTIGEN_DIR"
    echo "Nothing to do."
    exit 0
else
    echo "Installing Antigen to $ANTIGEN_DIR..."
    # Create git directory if it doesn't exist
    mkdir -p "$HOME/git"
    
    # Clone the Antigen repository
    git clone "$ANTIGEN_REPO" "$ANTIGEN_DIR"
    
    if [ $? -eq 0 ]; then
        echo "Antigen installed successfully!"
    else
        echo "Failed to install Antigen."
        exit 1
    fi
fi

# Verify installation
if [ -f "$ANTIGEN_DIR/antigen.zsh" ]; then
    echo "Antigen is ready to use."
    echo "Your .zshrc should source Antigen with: source \"$HOME/.zsh-tmeisenh-dotfiles/antigen.zsh\""
else
    echo "Something went wrong. Antigen files not found."
    exit 1
fi

echo
echo "Done!"