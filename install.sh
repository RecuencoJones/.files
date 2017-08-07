#!/bin/bash

# @param {string} $1 - prompt message
# @param {string} $2 - callback function
function confirm() {
  echo $1
  read -p "y/n: " -n 1 -r
  echo 

  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    $2
  fi
}

# @param {string} $1 - file name
# @param {string} $2 - file url
function downloadWithCurl() {
  curl -sL -o $1 $2
}


# @param {string} $1 - file name
# @param {string} $2 - file url
function downloadWithWget() {
  wget -q -O $1 $2
}

# @param {string} $1 - command name
function commandExists() {
  test ! -z "$(command -v $1)"
}


# @param {string} $1 - file name
# @param {string} $2 - file url
function pickDownloadStrategy() {
  if commandExists wget
  then
    downloadWithWget $1 $2
  elif commandExists curl
  then
    downloadWithCurl $1 $2
  fi
}

# @param {string} $1 - file name
function download() {
  curl -sL -o ~/$1 https://raw.githubusercontent.com/RecuencoJones/.files/master/$1

  if [ "$?" -eq "0" ]
  then
    echo "Done installing $1"
  else
    echo 'Unexpected error :('
  fi

}

function installProfile() {
  download '.aliases'
  download '.bash_profile'
}

function installGitConfig() {
  download '.gitconfig'
}

function installVimConfig() {
  download '.vimrc'
}

function all() {
  echo "Running RecuencoJones .files config script!"
  echo
  confirm "Do you want to install .gitconfig?" installGitConfig
  confirm "Do you want to install .vimrc?" installVimConfig
  confirm "Do you want to install profile and aliases? (OS X only)" installProfile
  echo
  echo "You are all done! :)"
}

function main() {
  case $1 in
    vim) installVimConfig;;
    git) installGitConfig;;
    *) all;;
  esac
}

main "$@"
