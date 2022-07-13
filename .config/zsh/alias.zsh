# F5 to resource
bindkey -s '\e[15~' 'source $XDG_CONFIG_HOME/zsh/.zshrc\n'
# Quick run filemanager
bindkey -M viins -s '^f' '^ulf\n'
# Back to upper dir
bindkey -s '^H' 'cd ..\n'


# Change working directories when exit filemanager
alias lf="lfrun -last-dir-path=\"/tmp/lfcd\"; cd \`cat /tmp/lfcd\`"

alias ..="cd .."

# Confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
# Auto make parent directories
alias mkdir="mkdir -p"

# vim
alias vim="nvim"
alias ww="nvim ~/vimwiki/index.md"

# ls
alias ls="exa -al --icons --group-directories-first --color=always"
alias ll="exa -al --icons --group-directories-first --color=always"
alias la="exa -a --icons --group-directories-first --color=always"
alias l="exa --icons --group-directories-first --color=always"

# grep
alias grep="grep --color=auto"

# git
alias gs="git status"
# use bare Git repository to manager my dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cons="config status"

# trans
alias tt="trans :zh-TW"

# Fix config file path
# wget
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
# yarn
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
