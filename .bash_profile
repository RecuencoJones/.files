source .aliases

# OS X
# Git bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Got bash completion
__git_complete got __git_main
