#!/usr/bin/env bash
#
# Sets an env var, HOMEBREW_HOME, with the location of homebrew based on the chipset of the mac.
#

chip=$(uname -p)
if [[ $chip == "arm" ]]; then
  export HOMEBREW_HOME="/opt/homebrew"
else
  export HOMEBREW_HOME="/usr/local"
fi
