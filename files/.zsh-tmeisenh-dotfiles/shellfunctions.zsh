#!/bin/zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# Usage: pskill <application/program name>
# Description: kills a process
pskill() {
  pkill -f "$1"
}

# Usage: killport <port number>
# Description: kills the process listening on the given port
killport() {
  local pids=$(lsof -t -i :"$1" 2>/dev/null)
  
  if [[ -n "$pids" ]]; then
    echo "Killing processes on port $1: $pids"
    kill -9 $pids 2>/dev/null
  else
    echo "No process found listening on port $1"
  fi
}

# Usage: smartextract <file>
# Description: extracts archived files
# This uses the aliases defined above
smartextract() {
  if [[ ! -f "$1" ]]; then
    echo "'$1' is not a valid file."
    return 1
  fi

  case "${1:l}" in  # Convert to lowercase for case-insensitive matching
    *.tar.bz2|*.tbz2)
      bz "$1" ;;
    *.tar.gz|*.tgz)
      utar "$1" ;;
    *.bz2)
      bunzip2 "$1" ;;
    *.gz)
      gunzip "$1" ;;
    *.jar)
      jar xf "$1" ;;
    *.tar)
      utar "$1" ;;
    *.zip)
      unzip "$1" ;;
    *.Z)
      uncompress "$1" ;;
    *.xz)
      unxz "$1" 2>/dev/null || echo "unxz not found, install xz-utils" ;;
    *.7z)
      7z x "$1" 2>/dev/null || echo "7z not found, install p7zip" ;;
    *)
      echo "'$1' cannot be extracted via smartextract()."
      return 1 ;;
  esac
}

# Usage: show-archive <archive>
# Description: view archive without unpack
showarchive() {
  if [[ ! -f "$1" ]]; then
    echo "'$1' is not a valid archive"
    return 1
  fi

  case "${1:l}" in  # Convert to lowercase for case-insensitive matching
    *.tar.gz|*.tgz)
      gunzip -c "$1" | tar -tf - -- ;;    
    *.tar.bz2|*.tbz2)
      bzcat "$1" | tar -tf - ;;    
    *.tar)
      tar -tf "$1" ;;    
    *.zip)
      unzip -l "$1" ;;    
    *.bz2)
      bzless "$1" ;;    
    *.gz)
      gzcat "$1" 2>/dev/null || zcat "$1" ;;    
    *.7z)
      7z l "$1" 2>/dev/null || echo "7z not found, install p7zip" ;;    
    *.xz)
      xzcat "$1" | less 2>/dev/null || echo "xzcat not found, install xz-utils" ;;    
    *)
      echo "'$1' cannot be shown via showarchive"
      return 1 ;;
  esac
}

# Setup SSH key-based authentication with a remote host
# This works if the remote host allows password authentication
# Usage: ssh-automate-login <user@hostname>
ssh-automate-login() {
  local remote_host="$1"
  local key_path="$HOME/.ssh/id_rsa"
  
  if [[ -z "$remote_host" ]]; then
    echo "Error: No remote host specified"
    echo "Usage: ssh-automate-login <user@hostname>"
    return 1
  fi

  echo "Checking for existing RSA key..."
  
  if [[ ! -f "$key_path" ]]; then
    echo "No RSA key found, generating a 4096 bit RSA key."
    echo "Hit enter/return for no passphrase (or enter a passphrase for better security)."
    ssh-keygen -t rsa -b 4096 -f "$key_path"
  else
    echo "Found existing SSH key at $key_path, using that."
  fi

  echo "Copying public key to $remote_host..."
  ssh-copy-id -i "${key_path}.pub" "$remote_host"
  
  echo "Done! You should now be able to connect without a password."
  echo "Try: ssh $remote_host"
}

unix_timestamp_to_date() {
  # Use native date command instead of perl for better portability
  if [[ "$(uname)" == "Darwin" ]]; then
    # macOS date command
    date -r "$1"
  else
    # Linux date command
    date -d "@$1"
  fi
}

delete_dsstore() {
  local target_dir="${1:-.}"
  
  # Use -delete which is more efficient than -exec rm
  find "$target_dir" -type f -name ".DS_Store" -delete
}

import_gpg_keys_from_usb() {
  local gpg_path="${1:-/mnt/usb/gnugpg}"
  
  # Import public keys
  find "$gpg_path" -type f -name '*_pub.gpg' -exec gpg --import '{}' \;
  
  # Import secret keys
  find "$gpg_path" -type f -name '*_sec.gpg' -exec gpg --import '{}' \;
}

delete_remote_git_tag() {
  local tag_name="$1"
  local remote="${2:-origin}"
  
  # Delete local tag
  git tag -d "$tag_name" && \
  # Delete remote tag
  git push "$remote" ":refs/tags/$tag_name"
}

strip_spaces_from_files() {
  local target_dir="${1:-.}"

  # Use null-delimited find to handle special characters safely
  find "$target_dir" -type f -name "* *" -print0 | while IFS= read -r -d '' file; do
    local new_name="${file// /_}"
    [[ "$file" != "$new_name" ]] && mv -f "$file" "$new_name"
  done
}

normalize_filename() {
  local file="$1"
  local new_name="${file// /_}"
  
  [[ "$file" != "$new_name" ]] && mv -f "$file" "$new_name"
}
