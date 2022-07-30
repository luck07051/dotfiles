# use fzf select file,
# if is dir, cd it
# if is file, edit it
fzf_local() {
  target="$(fd --max-depth 3 -HL -E '.git' -E '.cache' | fzf)"
  if [ -n "$target" ]; then
    if [ -d "$target" ]; then
      cd $target
      # fix auto ls
      if [ -n "$(echo $chpwd_functions | grep -w "auto_ls")" ]; then
        print "\n"
      fi
    else
      $EDITOR $target
    fi
  fi
  zle reset-prompt; zle -R
}
zle -N fzf_local

magic_fzf_local() {
  if [[ -z $BUFFER ]]; then
    fzf_local
  else
    zle .self-insert
  fi
}
zle -N magic_fzf_local


bindkey -M viins '^f' fzf_local
bindkey -M vicmd '^f' fzf_local
bindkey -M viins ' ' magic_fzf_local
bindkey -M vicmd ' ' fzf_local
