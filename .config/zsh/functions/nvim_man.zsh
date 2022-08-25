# using nvim to read man

if [ -x "$(which nvim)" ]; then
  export MANPAGER='nvim +Man!'
fi
