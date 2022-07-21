fzf_local() {
  target="$(fd --max-depth 2 -HL --exclude '.git' | fzf)"
  if [ -d "$target" ]; then
    cd $target
  else
    $EDITOR $target
  fi
  zle reset-prompt; zle -R
}
zle -N fzf_local
