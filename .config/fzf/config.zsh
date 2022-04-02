
export FZF_DEFAULT_OPTS="--height 40% --color=pointer:5,gutter:-1,prompt:7 --info=inline"
export FZF_DEFAULT_COMMAND="fd --hidden \
    --ignore-file ~/.config/fzf/ignore-file --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
