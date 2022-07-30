# directory bookmark, using fzf to select.

function dir_mark() {
  dirmarks=~/dirmarks
  target=$(sed '/^#/d' $dirmarks | sed '/^$/d' | awk '{print $1}' | fzf)
  if [ -n "$target" ]; then
    dir=$(eval "echo $(grep -E "^$target\s" $dirmarks | awk '{print $2}')")
    cd $dir
    if [ -n "$(echo $chpwd_functions | grep -w "auto_ls")" ]; then
      print "\n"
    fi
  fi
  zle reset-prompt; zle -R
}

function magic_dir_mark() {
  if [[ -z $BUFFER ]]; then
    dir_mark
  else
    zle .self-insert
  fi
}

zle -N dir_mark
zle -N magic_dir_mark

bindkey -M viins ';' magic_dir_mark
bindkey -M vicmd ';' dir_mark
