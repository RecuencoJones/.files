LC_ALL=C

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


# VSCode
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Imports
source ~/.bash_aliases
source ~/.bash_functions

# PS1
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[$(tput bold)\]\[\033[38;5;71m\][\T]\[$(tput sgr0)\] \[$(tput bold)\]\u\[$(tput sgr0)\]@\h:\[$(tput setaf 5)\]\W\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;71m\]\$(parse_git_branch)\[$(tput sgr0)\]\n\[$(tput bold)\]\\$>\[$(tput sgr0)\] "

# Help
echo "Welcome human!"
echo "To reload the shell press $(tput setaf 5)r$(tput sgr0)"
