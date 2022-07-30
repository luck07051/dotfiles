# use vim to read man
vim_man() {
  if [ -x "$(which nvim)" ]; then
    nvim -R -c "Man $1" -c "only"
  else
    vim -R -c "Man $1" -c "only"
  fi
}
alias man="vim_man"
