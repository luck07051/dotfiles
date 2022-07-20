toparentdir() {
  cd ..
  zle reset-prompt; zle -R
}
zle -N toparentdir

# Prevent <C-D> to colse window
set -o ignoreeof
stty -ixon

bindkey -M viins '^D' toparentdir
bindkey -M vicmd '^D' toparentdir
