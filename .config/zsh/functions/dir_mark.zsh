# directory bookmark, using fzf to select.

export dirmarks=~/dirmarks

function dir_mark() {
  # target=$(sed '/^#/d' $dirmarks | sed '/^$/d' | awk '{print $1}' | fzf)
  target=$(sed '/^#/d' $dirmarks | sed '/^$/d' | fzf)

  if [ -n "$target" ]; then
    # extend ~ or env
    dir=$(eval "echo $target")
    cd $dir

    if [ -n "$(echo $chpwd_functions | grep -w "auto_ls")" ]; then
      print "\n"
    fi
  fi
  zle reset-prompt; zle -R
}

function magic_dir_mark() {
  # if buf is empty, press key will toggle dir_mark()
  if [ -z "$BUFFER" ] && [ -z "$PREBUFFER" ]; then
    dir_mark
  else
    zle .self-insert
  fi
}

function add_dir() {
  echo $PWD | sed "s#$HOME#~#" >> $dirmarks
}

zle -N dir_mark
zle -N magic_dir_mark

bindkey -M viins ';' magic_dir_mark
bindkey -M vicmd ';' dir_mark
