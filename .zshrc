# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install

# for bare Git repository
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


# Alias
alias res='source ~/.zshrc'
alias q='startx'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu yes select

#===================Plug=====================#
source ~/.zplug/init.zsh

# zplug "romkatv/powerlevel10k", as:theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

zplug "zpm-zsh/ls"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
        printf "Install? [y/N]: "
            if read -q; then
                        echo; zplug install
                            fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
