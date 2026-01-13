#!/bin/zsh
# Z shell configuration file for k8s helpers
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Note: Source this file manually or from a host/project file when needed
#********************************************************************

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
