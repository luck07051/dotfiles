dirmark() {
  dirmarks=~/dirmarks
  target=$(sed '/^#/d' $dirmarks | sed '/^$/d' \
    | fzf | awk '{print $2}')
  cd $(eval "echo $target")
  zle reset-prompt; zle -R
}
zle -N dirmark

magic-semicolon() {
  if [[ -z $BUFFER ]]; then
    dirmark
  else
    zle .self-insert
  fi
}
zle -N magic-semicolon
bindkey -M viins ';' magic-semicolon
bindkey -M vicmd ';' dirmark
