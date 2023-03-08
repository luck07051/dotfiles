# Yank a command

function _yank(){
  if [ -z "$BUFFER" ] && [ -z "$PREBUFFER" ]; then
    zle up-line-or-history
    printf "%s%s\n" "$PREBUFFER" "$BUFFER" | clip -i
    zle down-line-or-history
  else
    printf "%s%s\n" "$PREBUFFER" "$BUFFER" | clip -i
  fi
}

zle -N _yank

bindkey '^Y' _yank
bindkey -M vicmd '^Y' _yank
