#!/usr/bin/env bash

# ARM homebrew path
PATH=/opt/homebrew/bin:$PATH

set -e

target=$HOME
force=""
pretend=""
delete=""
vscode="$HOME/Library/Application Support/Code/User"

usage() {
  cat <<EOF
usage: $0 options

OPTIONS:
   -h      Show this message
   -p      pretend to stow
   -d      delete the stow
   -f      force the stow
EOF
}

for arg in "$@"; do
  case $arg in
  -h)
    echo
    usage
    exit 1
    ;;
  -p)
    pretend="--simulate"
    ;;
  -d)
    delete="--delete"
    ;;
  -f)
    force="--override=*"
    ;;
  *)
    echo "Invalid option: $arg"
    usage
    exit 1
    ;;
  esac
done

stow_check() {
  if [ ! -f "$(which stow)" ]; then
    echo 'Please install stow OR ensure it is in $PATH.'
    echo '  See http://www.gnu.org/software/stow/'
    echo ''
    echo '  To install:'
    case "$(uname)" in
    "Darwin")
      echo '  brew install stow'
      ;;
    esac
    exit 1
  fi
  return 0
}

stow_it() {
  stow --verbose $pretend $delete --target="$target" $force files || echo "Unable to stow."
  stow --verbose $pretend $delete --target="${vscode}" $force vscode || echo "Unable to stow vscode."
}

stow_check
stow_it
echo 'Installation complete'
