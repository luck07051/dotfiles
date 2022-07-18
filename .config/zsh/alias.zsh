# Change working directories when exit filemanager
lf () {
    source $XDG_CONFIG_HOME/lf/colors;\
    lf-imgview -last-dir-path="/tmp/lfcd"
    cd `cat /tmp/lfcd`
}
# Quick open filemanager
bindkey -M viins -s '^f' '^ulf\n'
bindkey -M vicmd -s '^f' 'cclf\n'


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
