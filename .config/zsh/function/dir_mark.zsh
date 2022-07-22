dir_mark() {
  dirmarks=~/dirmarks
  target=$(sed '/^#/d' $dirmarks | sed '/^$/d' | awk '{print $1}' | fzf)
  if [ -n "$target" ]; then
    result=$(eval "echo $(grep -E "^$target\s" $dirmarks | awk '{print $2}')")
    dir=$(eval "echo $result")
    cd $dir
    if [ -n "$(echo $chpwd_functions | grep -w "auto_ls")" ]; then
      print "\n"
    fi
  fi
  zle reset-prompt; zle -R
}
zle -N dir_mark

magic_dir_mark() {
  if [[ -z $BUFFER ]]; then
    dir_mark
  else
    zle .self-insert
  fi
}
zle -N magic_dir_mark
