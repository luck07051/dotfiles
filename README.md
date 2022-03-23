# This Is My Configuration

# Installed

Basic
```
base-devel
xorg xorg-xinit xorg-fonts-misc
xdg-user-dirs
alsl-utils
git
openssh
```

Setup
```
alacritty           # terminal emulator
i3-gaps             # windows manager
yay i3ass           # i3 function, for i3run
sxhkd               # keybinding
yay polybar         # status bar
zsh                 # shell
rofi                # launcher and more
qutebrowswer        # browser

picom               # compositor
nitrogen            # wallpaper
setxkbmap           # uses to remap capslock to ctrl
```
```
(bluez bluez-utils)
(qtile)
(xmonad xmonad-contrib xmobar)
```


Commandline tool
```
tmux
yay tmuxinator
ranger              # file manager
yay lf              # file manager
sxiv                # image viewer
ueberzug            # image viewer (for ranger preview)
zathura zathura-pdf-mupdf   # pdf viewer
ncmpcpp             # music player
yay -S ncpamixer    # pulseaudio control

icdiff              # diff tool
wget                # download file from web
ffmpeg ffmpegthumbnailer    # audio/video conversion tool
youtube-dl          # youtube download

task                # taskwarrior, task management tool
taskwarrior-tui     # a tui for taskwarrior

bitwarden-cli       # bitwarden in commandline
bitwarden-rofi      # bitwarden rofi menu

fzf                 # fuzzy finder
starship            # prompt
exa                 # better ls
htop                # better top
bat                 # better cat
procs               # better ps
zoxide              # better cd
fd                  # better find
ripgerp             # better gerp
```

Graphical app
```
thunar              # file manager
pavucontrol         # pulseaudio control
gimp                # draw app
vlc                 # video viewer
mpv                 # video viewer
```

Dependencie
```
# qtile bar
pip install psutil
pip install dbus-next

# taskwiki
sudo pip3 install tasklib
sudo pip3 install pynvim

# bitwarden-rofi
jq
xdotool

# vim plug markdown perviewer
yarn

# polybar
# spotify
playerctl
pip install dbus-python

# ranger
findutils
mlocate
```

Nvidea
```
nvidia
nvidia-utils
nvidia-settings
nvtop
```

Gtk theme
```
arc-gtk-theme
papirus-icon-theme
```

Font
```
yay -S nerd-fonts-complete
yay -S adobe-source-han-sans-otc-fonts
yay -S noto-fonts-cjk
```

Useless
```
screenfetch
cmatrix
```






#

### yay
```
$ git clone https://aur.archlinux.org/yay-git.git
$ cd yay-git
$ makepkg -si
rm yay-git
```

### **[zplug](https://github.com/zplug/zplug)**
```
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
$ zplug install
```
```
yay -S zsh-syntax-highlighting-git
```


### **[vim-plug](https://github.com/junegunn/vim-plug)**
Vim
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs\
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Neovim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
If markdown-preview dont work, try this `:call mkdp#util#install()`


### Tmux
[tmux plug manager](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```


### ranger
```
git clone git@github.com:jchook/ranger-zoxide.git ~/.config/ranger/plugins/zoxide
```
```
sudo vim /etc/updatedb.conf

>>> remove /media from PRUNEPATHS
>>> save and exit


# refresh database
sudo updatedb
```

### lf
see [image preview](https://github.com/cirala/lfimg)


### pip
```
sudo pacman -S gcc python3-dev python-pip
```

### qutebrowser
Unable to view DRM content
```
yay -S chromium-widevine
```

### changing default shell
```
chsh -l
chsh -s full-path-to-shell
```

### [dotfile](https://www.atlassian.com/git/tutorials/dotfiles)
Install onto a new system
```
echo "dotfiles' >> .gitignore
git clone --bare alias config='/usr/bin/git --git-dir=$HOME/.cfg/ \
    --work-tree=$HOME' $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# Checkout the actual content from the bare repository to your $HOME
# If error, check webpage
config checkout
config config --local status.showUntrackedFiles no
```

### ? nvidia ?
Not try yet
```
yay -S optimus-manager
sudo systemctl enable optimus-manager
vim /etc/optimus-manager/optimus-manager.conf
    startup-mode=nvidia
```


### [steam](https://www.chrisatmachine.com/Linux/08-steam-on-linux/)
If text is corrupt
` pacman -S  lib32-fontconfig ttf-liberation wqy-zenhei `


### git difftool
Add in .gitconfig
```
[user]
    email =
    name =

[diff]
    tool = icdiff
[difftool]
    prompt = false
[difftool "icdiff"]
    cmd = icdiff --line-numbers $LOCAL $REMOTE
```

### if default browser incorrect
try this
```
xdg-mime default $(xdg-settings get default-web-browser) x-scheme-handler/https x-scheme-handler/http
```
