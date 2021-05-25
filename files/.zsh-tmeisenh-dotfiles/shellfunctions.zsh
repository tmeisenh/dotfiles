# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# Usage: pskill <application/program name>
# Description: kills a process
function pskill() {
  pkill -f $1
}

# Usage: killport <port number>
# Description: kills the process listening on the given port
function killport() {
  lsof -t -i :$1 | xargs --no-run-if-empty kill -9
}

# Usage: smartextract <file>
# Description: extracts archived files
# This uses the aliases defined above
function smartextract() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2)
      bz $1
      ;;
    *.tar.gz)
      utar $1
      ;;
    *.bz2)
      bunzip2 $1
      ;;
    *.gz)
      gunzip $1
      ;;
    *.jar)
      jar xf $1
      ;;
    *.tar)
      utar $1
      ;;
    *.tbz2)
      bz $1
      ;;
    *.tgz)
      utar $1
      ;;
    *.zip)
      unzip $1
      ;;
    *.Z)
      uncompress $1
      ;;
    *)
      echo "'$1' cannot be extracted via smartextract()."
      ;;
    esac
  else
    echo "'$1' is not a valid file."
  fi
}

# Usage: show-archive <archive>
# Description: view archive without unpack
function showarchive() {
  if [[ -f $1 ]]; then
    case $1 in
    *.tar.gz)
      gunzip -c $1 | tar -tf - --
      ;;
    *.tar)
      tar -tf $1
      ;;
    *.tgz)
      tar -ztf $1
      ;;
    *.zip)
      unzip -l $1
      ;;
    *.bz2)
      bzless $1
      ;;
    *)
      echo "'$1' cannot be shown via showarchive"
      ;;
    esac
  else
    echo "'$1' is not a valid archive"
  fi
}

# This only works if the remote host allows password authentication
# If you leave the passphrase blank you won't have to type a password for
# access into the remote system.
function ssh-automate-login() {
  echo "Checking to see if a public key exists."

  if [ ! -f .ssh/id_rsa ]; then
    echo "None found, generating a 2048 bit rsa key."
    echo "Hit enter/return for no passphrase."
    ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa
  else
    echo "Found existing ssh-keygen key, using that."
  fi

  echo "Copying public key to remote host."
  ssh $1 "([ -d ~/.ssh ]||mkdir -m 700 ~/.ssh) && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys" <~/.ssh/id_rsa.pub

  echo "Done!"
}

function unix_timestamp_to_date() {
  perl -e "require 'ctime.pl'; print &ctime($1);"
}

function delete_dsstore() {
  find $1 -name ".DS_Store" -depth -exec rm {} \;
}

function import_gpg_keys_from_usb() {
  find /mnt/usb/gnugpg -type f -name '*_pub.gpg' -exec gpg --import '{}' \;
  find /mnt/usb/gnugpg -type f -name '*_sec.gpg' -exec gpg --allow-secret-key-import --import '{}' \;
}

function delete_remote_git_tag() {
  git tag -d ${1} && git push origin :refs/tags/${1}
}

function strip_spaces_from_files() {
  find ${1} -type f -exec bash -c 'mv -f "$0" "${0// /_}"' {} \;
}

function normalize_filename() {
  mv -f "$1" "${1// /_}"
}

function read_x509() {
  openssl x509 -noout -text -in $1
}

function read_CSR() {
  openssl req -noout -text -in $1
}

function check_CSR() {
  openssl req -text -noout -verify -in $1
}

function home_status() {
  (cd ~/git/dotfiles; git st)
}

function load_keys() {
  find ~/.ssh -type f -name "*.pub" | xargs -L 1 -n 1 -I echo  | sed 's/\.pub//g' | ssh-add -K
}
