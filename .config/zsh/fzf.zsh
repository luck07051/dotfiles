
export FZF_DEFAULT_OPTS="--bind ctrl-j:down,ctrl-k:up \
    --height 40% --color=pointer:5,gutter:-1,prompt:7 --info=default "
export FZF_DEFAULT_COMMAND="fd --hidden \
    --ignore-file \"$ZDOTDIR\"/fzf-ignore --type file"


fd_path() {
  fd --hidden --follow --exclude ".git" .
}
fd_dir() {
  fd --type d --hidden --follow --max-depth 7 --exclude ".git" .
}
fzf_run() {
  local command=$1
  shift

  case "$command" in
    cd)
        target=`fd_dir | fzf "$@" --preview 'tree -C {} | head -200'`
        [[ -n $target ]] && cd "$target"
        ;;
    vim)
        vim `'ls' -a | fzf "$@" --preview 'cat {}'`
        ;;

    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

bindkey -s '^F' 'fzf_run cd\n'
bindkey -s '^V' 'fzf_run vim\n'
