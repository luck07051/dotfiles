to_parent_dir() {
  cd ..
  print "\n"
  zle reset-prompt
}
zle -N to_parent_dir
