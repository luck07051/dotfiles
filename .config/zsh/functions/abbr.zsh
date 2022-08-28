# abbreviations function

# TODO
# highlight support
# better 'cmd' (syntax) analyze

abbr_cache_file="$HOME/.cache/zsh_abbr"
# clean file when i open a zsh
: > $abbr_cache_file

function abbr() {
  # "$1" looks like sp="sudo pacman"
  echo "${1%%=*};${1##*=}" >> $abbr_cache_file
}

function _abbr_expand() {
  [ -z "$LBUFFER" ] && return

  # I want abbr only works on 'cmd', meaning abbr not works on 'option'. A
  # 'cmd' only appear after these patterns ; | || & && $( [ { and beginning of
  # buffer.
  # ('then', 'do'... don't works very well on current function, so i not
  # inclued them in the pattern list)
  local cmd="$(echo $PREBUFFER $LBUFFER | tr -d '\\\n' | tr -d '\n' |
    sed 's/^.*[;|&\[{(]\s*//g')"

  [[ ! "$cmd" =~ "^\S*$" ]] && return

  ecmd="$(echo "$cmd" | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
  local abb="$(grep "^$ecmd;" $abbr_cache_file | cut -d';' -f2)"
  [ -z "$abb" ] && return

  LBUFFER=${LBUFFER%$cmd}
  LBUFFER=$LBUFFER$abb
  CURSOR=$#LBUFFER
}

function magic_abbr() {
  if [ -z "$BUFFER" ] && [ -z "$PREBUFFER" ]; then
    # if buffer empty, toggle fzf_cd
    # not part of abbr
    . fzf_cd
    zle reset-prompt; zle -R
  else
    _abbr_expand
    zle .self-insert
  fi
}

function magic_abbr_return() {
  _abbr_expand
  zle accept-line
}

zle -N magic_abbr
zle -N magic_abbr_return

bindkey -M viins ' ' magic_abbr
bindkey -M viins '^M' magic_abbr_return
