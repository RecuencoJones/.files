# Imports
source ~/.bash_aliases
source ~/.bash_functions

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Jenv
export PATH=$HOME/.jenv/bin:$PATH
eval "$(jenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
. $(brew --prefix nvm)/nvm.sh

# Go
export PATH=$PATH:$HOME/go/bin

# Kubeconfig
export KUBECONFIG=$HOME/.kube/config

# Custom git
alias got='git'

__git_complete got __git_main

# Custom kubectl
alias k='kubectl'

function __kubectl_complete() {
  complete -o default -F __start_kubectl $1
}

__kubectl_complete k

unset -f __complete_kubectl
