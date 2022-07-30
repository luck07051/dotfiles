addfun() {
  file="$ZDOTDIR/function/$1.zsh"
  if [ -f "$file" ]; then
    source $file
  fi
}

addfun lf
addfun auto_ls

addfun dir_mark
addfun fzf_local
addfun to_parent_dir

addfun stack_buf

addfun vim_man

# F5 to resource
bindkey -s '\e[15~' 'source $ZDOTDIR/.zshrc\n'
