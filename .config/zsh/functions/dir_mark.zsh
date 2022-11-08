# directory bookmark, using fzf to select.

export dirmarks=~/bookmarks/dirmark

function _dirmark() {
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

function _dirmark_keybind() {
  # if buf is empty, press key will toggle dir_mark()
  if [ -z "$BUFFER$PREBUFFER" ]; then
    _dirmark
  else
    zle .self-insert
  fi
}

function add_dir() {
  echo $PWD | sed "s#$HOME#~#" >> $dirmarks
}

zle -N _dirmark_keybind

bindkey -M viins ';' _dirmark_keybind
bindkey -M vicmd ';' _dirmark_keybind
