for file in $ZDOTDIR/utils/*; do
  source $file
done

# Jump to mark
bindkey -M viins ';' magic-semicolon
bindkey -M vicmd ';' dirmark

bindkey -M viins '^f' fzf_local
bindkey -M vicmd '^f' fzf_local

# Quick open filemanager
#bindkey -M viins -s '^f' '^ulf\n'
#bindkey -M vicmd -s '^f' 'cclf\n'

bindkey -M viins '^P' stack_buf_push
bindkey -M viins '^O' stack_buf_pop
bindkey -M viins '^A' stack_buf_clear

bindkey -M viins '^D' to_parent_dir
bindkey -M vicmd '^D' to_parent_dir
