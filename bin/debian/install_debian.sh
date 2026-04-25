#!/usr/bin/env bash
# Installs base packages on Debian

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

sudo apt-get update
sudo apt-get install -y $(grep -v '^#' "$SCRIPT_DIR/packages.basic" | tr '\n' ' ')

echo ""
echo "All done with basic install"
echo ""
