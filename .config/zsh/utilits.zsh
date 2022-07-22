for file in $ZDOTDIR/function/*; do
  source $file
done

# auto ls
chpwd_functions=(auto_ls $chpwd_functions)

# F5 to resource
bindkey -s '\e[15~' 'source $ZDOTDIR/.zshrc\n'

# Jump to mark
bindkey -M viins ';' magic_dir_mark
bindkey -M vicmd ';' dir_mark

# <C-F> to fzf files
bindkey -M viins '^f' fzf_local
bindkey -M vicmd '^f' fzf_local
bindkey -M viins ' ' magic_fzf_local
bindkey -M vicmd ' ' fzf_local

# Quick open filemanager
#bindkey -M viins -s '^f' '^ulf\n'
#bindkey -M vicmd -s '^f' 'cclf\n'

bindkey -M viins '^P' stack_buf_push
bindkey -M viins '^O' stack_buf_pop
bindkey -M viins '^A' stack_buf_clear

bindkey -M viins '^D' to_parent_dir
bindkey -M vicmd '^D' to_parent_dir
