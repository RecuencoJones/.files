# Imports
source ~/.bash_aliases
source ~/.bash_functions

LANG=C

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

# PS1
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="$(echo -ne "\x0\x01\xF4\xBB" | iconv -f UTF-32BE -t UTF-8) \[$(tput bold)\]\[\033[38;5;71m\][\T]\[$(tput sgr0)\] \[$(tput bold)\]\u\[$(tput sgr0)\]@\h:\[$(tput setaf 5)\]\W\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;71m\]\$(parse_git_branch)\[$(tput sgr0)\] \[$(tput bold)\]\\$\[$(tput sgr0)\] "
