auto_ls() {
  echo
  if [ -n "$(which exa)" ]; then
    exa -a --icons --group-directories-first
  else
    /bin/ls -A --color=auto --group-directories-first
  fi
}
