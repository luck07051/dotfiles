stack_buf_file=$XDG_CACHE_HOME/stackbuffile

stack_buf_push() {
  if [[ -n $BUFFER ]]; then
    echo $BUFFER >> $stack_buf_file
    zle && zle kill-buffer && zle -R
  fi
}
zle -N stack_buf_push

stack_buf_pop() {
  if [[ -s $stack_buf_file ]]; then
    zle -U "`tail -n1 $stack_buf_file`"
    sed -i '$d' $stack_buf_file
  fi
}
zle -N stack_buf_pop

stack_buf_clear() {
  rm -f $stack_buf_file
}
zle -N stack_buf_clear
