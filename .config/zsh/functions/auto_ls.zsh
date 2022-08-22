# if PWD changed, execute ls

function auto_ls() {
  printf "\n"
  if [ -x "$(which exa)" ]; then
    exa -a --icons --group-directories-first
  else
    /bin/ls -A --color=auto --group-directories-first
  fi
}

chpwd_functions=(auto_ls $chpwd_functions)
