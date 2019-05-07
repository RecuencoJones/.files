# aliases
alias r='source ~/.bash_profile'
alias ll='ls -la'
alias chromenosecurity='open -n -a Google\ Chrome --args --disable-web-security --user-data-dir=/tmp/chrome'
alias chmox='chmod +x'
alias f='fuck'
alias fu='fuck'

# git
alias got='git'

__git_complete got __git_main

# npm
alias npmi='npm install'
alias npms='npm start'
alias npml='npm run lint'
alias npmb='npm run build'
alias npmt='npm test'
alias npmv='f() { npm show $1 version;  unset -f f; }; f'
alias v='node -p "require(\"./package.json\").version"'

alias k='kubectl'
alias kubectx='kubectl config current-context'
alias kubecdev='kubectl config use-context dev-hzo'
alias kubecstg='kubectl config use-context stg-hzo'
alias kubecpro='kubectl config use-context prd-hzo'
alias kubelocal='kubectl --kubeconfig=$HOME/.kube/config-local'

function __complete_kubectl() {
  #complete -o default -o nospace -F __start_kubectl $1
  complete -F _complete_alias $1
}

function __make_k8s_alias {
  # $1 namespace
  # $2 abbreviation
  alias kube${2}="kubectl -n ${1}"
  alias k${2}="kubectl -n ${1}"
  alias k${2}l="kubectl -n ${1} logs"
  alias k${2}lf="kubectl -n ${1} logs -f"
  alias k${2}po="kubectl -n ${1} get po"
  alias k${2}pow="kubectl -n ${1} get po -w"
  alias k${2}depo="kubectl -n ${1} describe pod"
  alias k${2}exec="kubectl -n ${1} exec -it"
  alias k${2}pf="kubectl -n ${1} port-forward"

  __complete_kubectl kube${2}
  __complete_kubectl k${2}
  __complete_kubectl k${2}l
  __complete_kubectl k${2}lf
  __complete_kubectl k${2}po
  __complete_kubectl k${2}pow
  __complete_kubectl k${2}depo
  __complete_kubectl k${2}exec
  __complete_kubectl k${2}pf
}

__make_k8s_alias adidas-github-portal agp
__make_k8s_alias bwrnpm npm
__make_k8s_alias lean-delivery lnd

__complete_kubectl k
__complete_kubectl kubelocal
