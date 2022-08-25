# Yank a command

function _yank(){
  if [ -z "$BUFFER" ] && [ -z "$PREBUFFER" ]; then
    zle up-line-or-history
    printf "%s%s" "$PREBUFFER" "$BUFFER" | xclip -selection clipboard
    zle down-line-or-history
  else
    printf "%s%s" "$PREBUFFER" "$BUFFER" | xclip -selection clipboard
  fi
}

zle -N _yank

bindkey -M viins '^Y' _yank
bindkey -M vicmd '^Y' _yank
