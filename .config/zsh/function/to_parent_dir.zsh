# Quick cd ..
to_parent_dir() {
  cd ..
  print "\n"
  zle reset-prompt
}
zle -N to_parent_dir

bindkey -M viins '^D' to_parent_dir
bindkey -M vicmd '^D' to_parent_dir
