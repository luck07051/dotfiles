# if PWD changed, execute ls

function _auto_ls() {
  printf "\n"
  if [ -x "$(which exa)" ]; then
    exa -a --icons --group-directories-first
  else
    /bin/ls -A --color=auto --group-directories-first
  fi
}

chpwd_functions=(_auto_ls $chpwd_functions)
