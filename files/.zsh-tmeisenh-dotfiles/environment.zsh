# Z shell configuration file for the local system.
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
#********************************************************************

eval "$(rbenv init -)"
[[ -d $HOME/.nvm ]] || mkdir -p $HOME/.nvm

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

export GTAGSLABEL=pygments
