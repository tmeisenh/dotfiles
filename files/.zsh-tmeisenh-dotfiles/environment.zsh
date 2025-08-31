#!/bin/zsh
# shellcheck shell=zsh
# Z shell configuration file for the local system.
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
#********************************************************************

eval "$(rbenv init -)"
[[ -d "$HOME/.nvm" ]] || mkdir -p "$HOME/.nvm"

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
source "/usr/local/opt/nvm/nvm.sh"

export GTAGSLABEL=pygments
export EMACS_USER_DIRECTORY="$HOME/.emacs.d"

# k8s
alias ks="kubectl exec --tty -it --namespace"
alias kp="kubectl get pod --namespace"
alias klf="kubectl logs --follow --namespace"

function klogs() {
	kubectl logs --follow --namespace "$1" "$2"
}

function kexec() {
	local env=$1
	local pod=$2
	local first_pod
	first_pod=$(kubectl get pod --namespace "$env" | /usr/bin/grep "$pod" | head -n 1 | cut -d " " -f1)
	kubectl exec -it --namespace "$env" "$first_pod" -- /bin/sh
}
