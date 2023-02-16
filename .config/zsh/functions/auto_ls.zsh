# if PWD changed, execute ls

function _auto_ls() {
  printf "\n"
  if type lsd >/dev/null; then
    lsd -A --group-directories-first
  elif type exa >/dev/null; then
    exa -a --icons --group-directories-first
  else
    /bin/ls -A --color=auto --group-directories-first
  fi
}

chpwd_functions=(_auto_ls $chpwd_functions)
