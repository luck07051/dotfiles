# use fzf select file

function _fzflocal_find_root() {
  patterns=(.git _darcs .hg .bzr .svn Makefile package.json)
  dir=$PWD
  while [ $dir != "/" ]; do
    for pattern in ${patterns[*]}; do
      if [ -n "$(/bin/ls -a $dir | grep -w $pattern)" ]; then
        echo $dir
        return
      fi
    done
    dir="$(dirname $dir)"
  done
}

function _fzflocal() {
  root="$(_findroot)"
  if [ -n "$root" ]; then
    target="$(fd -HL -E '.git' -E '.cache' -- . $root |\
      sed "s#$root#...#g" |\
      fzf |\
      sed "s#...#$root#")"
  else
    target="$(fd --max-depth 3 -HL -E '.git' -E '.cache' | fzf)"
  fi

  if [ -n "$target" ]; then
    if [ -d "$target" ]; then
      cd $target
      # auto ls fix
      if [ -n "$(echo $chpwd_functions | grep -w "_auto_ls")" ]; then
        print "\n"
      fi
    else
      # cd "$(dirname $target)"
      # # auto ls fix
      # if [ -n "$(echo $chpwd_functions | grep -w "auto_ls")" ]; then
      #   print "\n"
      # fi
      $EDITOR $target
    fi
  fi
  zle reset-prompt; zle -R
}

function _fzflocal_keybind() {
  # if buf is empty, press key will toggle fzf_local()
  if [ -z "$BUFFER$PREBUFFER" ]; then
    _fzflocal
  else
    zle .self-insert
  fi
}

zle -N _fzflocal_keybind

bindkey ' ' _fzflocal_keybind
bindkey -M vicmd ' ' _fzflocal_keybind
