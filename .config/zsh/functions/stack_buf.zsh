# push current command to stack,
# for late pop out

stack_buf_file=$XDG_CACHE_HOME/stackbuffile

function stack_buf_push() {
  if [[ -n $BUFFER ]]; then
    echo $BUFFER >> $stack_buf_file
    zle && zle kill-buffer && zle -R
  fi
}

function stack_buf_pop() {
  if [[ -s $stack_buf_file ]]; then
    zle -U "`tail -n1 $stack_buf_file`"
    sed -i '$d' $stack_buf_file
  fi
}

function stack_buf_clear() {
  rm -f $stack_buf_file
}

zle -N stack_buf_push
zle -N stack_buf_pop
zle -N stack_buf_clear

bindkey -M viins '^P' stack_buf_push
bindkey -M viins '^O' stack_buf_pop
bindkey -M viins '^A' stack_buf_clear
