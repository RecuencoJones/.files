# mkcd
# create directory (any depth) and cd into it
function mkcd {
  mkdir -p $1
  cd $1
}

# switch-npmrc
# change between multiple npmrc profiles
switch-npmrc() {
  if [ -z $1 ] ; then
    homePath=`echo ~`
    profiles=`find ~ -maxdepth 1 -name ".npmrc*" \( ! -name .npmrc \) -exec bash -c "echo '{}' | sed 's,'"$homePath/.npmrc."',,'" \;`

    echo switch-npmrc requires 1 argument!
    echo Available profiles: $profiles
  else
    cp ~/.npmrc.$1 ~/.npmrc

    echo Now using ~/.npmrc.$1 file
    echo Registry: $(npm get registry)
  fi
}
