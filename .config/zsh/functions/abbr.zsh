# abbreviations function

abbr_cache_file="$HOME/.cache/zsh_abbr"
# clean file
: > $abbr_cache_file

function abbr() {
  c=${1%%=*}
  a=${1##*=}
  echo "$c;$a" >> $abbr_cache_file
}

function abbr_expand() {
  if [ -z "$LBUFFER" ]; then
    return
  fi

  # abbr only works on after these pattern or beginning of the buffer
  #   ; | || & && $(
  # 'then', 'do' not works very well, so i not inclued them in the pattern list
  local cmd="$(echo $PREBUFFER $LBUFFER | tr -d '\\\n' | tr -d '\n' |
    sed 's/^.*[;|&\(||\)\(&&\)\($(\)]\s*//g')"

  if [[ ! "$cmd" =~ "^\S*$" ]]; then
    return
  fi

  local abb="$(grep "^$cmd;" $abbr_cache_file | cut -d';' -f2)"
  if [ -z "$abb" ]; then
    return
  fi

  LBUFFER=${LBUFFER%$cmd}
  LBUFFER=$LBUFFER$abb
  CURSOR=$#LBUFFER
}

function magic_abbr() {
  abbr_expand
  zle .self-insert
}
function magic_abbr_return() {
  abbr_expand
  zle accept-line
}

zle -N magic_abbr
zle -N magic_abbr_return

bindkey -M viins ' ' magic_abbr
bindkey -M viins ';' magic_abbr
bindkey -M viins '^M' magic_abbr_return
