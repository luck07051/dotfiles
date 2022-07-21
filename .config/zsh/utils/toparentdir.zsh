to_parent_dir() {
  cd ..
  zle reset-prompt; zle -R
}
zle -N to_parent_dir
