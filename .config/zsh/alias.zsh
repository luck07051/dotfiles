# Confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
# Auto make parent directories
alias mkdir="mkdir -pv"

# vim
alias vim="nvim"
alias ww="nvim ~/vimwiki/index.md"

# ls
alias ls="exa -al --icons --group-directories-first --color=auto"
alias l="exa --icons --group-directories-first --color=auto"

# grep
alias grep="grep --color=auto"

# git
alias gs="git status"
# use bare Git repository to manager my dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cs="config status"


# Fix config file path
# wget
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
# yarn
alias yarn="yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"
