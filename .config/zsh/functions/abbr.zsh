# abbreviations function

# TODO
# highlight support
# better 'cmd' (syntax) analyze

abbr_cache_file="$HOME/.cache/zsh_abbr"
# clean file when open zsh
: > $abbr_cache_file

function abbr() {
  # add abbr to alias to have synx hightlight
  alias "$1"

  echo "${1%%=*};${1##*=}" >> $abbr_cache_file
}

function _abbr_expand() {
  [ -z "$LBUFFER" ] && return

  # I assume 'cmd' only appear after these patterns ; | || & && $( [ { and
  # beginning of buffer.
  # ('then', 'do'... not inclued)
  local cmd="$(echo $PREBUFFER $LBUFFER | tr -d '\\\n' | tr -d '\n' |
    sed 's/^.*[;|&\[{(]\s*//g')"

  [[ ! "$cmd" =~ "^\S*$" ]] && return

  # Find the command for that abbreviation
  local ecmd="$(echo "$cmd" | sed 's/[^^]/[&]/g; s/\^/\\^/g')"
  local abb="$(grep "^$ecmd;" $abbr_cache_file | cut -d';' -f2)"

  [ -z "$abb" ] && return

  # Insert the command
  LBUFFER=${LBUFFER%$cmd}
  LBUFFER=$LBUFFER$abb
  CURSOR=$#LBUFFER
}

function _abbr_keybind() {
  if [ -z "$BUFFER$PREBUFFER" ]; then
    # if buffer empty, toggle fzf_cd
    # is not a part of abbr
    # . fzf_cd
    zle reset-prompt; zle -R
  else
    _abbr_expand
    zle .self-insert
  fi
}

function _abbr_keybind_return() {
  _abbr_expand
  zle accept-line
}

zle -N _abbr_keybind
zle -N _abbr_keybind_return

bindkey ' ' _abbr_keybind
bindkey '^M' _abbr_keybind_return
