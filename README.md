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
bspwm               # windows manager
sxhkd               # keybinding
yay -S polybar      # status bar
zsh                 # shell
rofi                # launcher and more
qutebrowswer        # browser

pipewire-jack       # audio
pipewire-pulse
pipewire-alsa

yay -S picom-jonaburg-git   # compositor
nitrogen            # wallpaper
setxkbmap           # uses it to remap capslock to ctrl

cronie              # auto exec tasks at pre-determined times
ntp                 # clock fixer
xclip               # let nvim can use system clipboard

fcitx5-im           # imput framework
fcitx5-rime         # chinese engine
```
```
(bluez bluez-utils)
(qtile)
(xmonad xmonad-contrib xmobar)
(i3-gaps)
(yay i3ass)
```


Commandline tool
```
tmux
yay -S tmuxinator
yay -S lf           # file manager
ranger              # file manager
-nsxiv              # image viewer (install from git@github.com:luck07051/nsxiv.git)
ueberzug            # image viewer (to view image in terminal)
zathura zathura-pdf-mupdf   # pdf viewer
ncmpcpp             # music player
yay -S ncpamixer    # pulseaudio control

icdiff              # diff tool
wget                # download file from web
ffmpeg ffmpegthumbnailer    # audio/video conversion tool
youtube-dl          # youtube downloader

task                # taskwarrior, task management tool
taskwarrior-tui     # a tui for taskwarrior

bitwarden-cli       # bitwarden in commandline
bitwarden-rofi      # bitwarden rofi menu

fzf                 # fuzzy finder
starship            # prompt
exa                 # better ls
htop                # better top
btop                # better better top
bat                 # better cat
procs               # better ps
zoxide              # better cd
fd                  # better find
ripgerp             # better gerp
```

Graphical app
```
flameshot           # screenshot
thunar              # file manager
pavucontrol         # pulseaudio control
gimp                # draw app
vlc                 # video viewer
mpv                 # video viewer
```

Dependencie
```
# vim plug markdown perviewer
yarn
# vimtex
texlive-most

# polybar
## spotify
playerctl
pip install dbus-python

# bitwarden-rofi
jq
xdotool
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





# NOTE

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


### **[vim-plug](https://github.com/junegunn/vim-plug)**
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Make sure nodejs and yarn installed

If markdown-preview dont work, `:call mkdp#util#install()`

ycm
```
yay -S vim-youcompleteme-git
sudo pacman -S python-pynvim

cd .../plugged/YouCompleteMe
/usr/bin/python install.py --all
```


### Tmux
[tmux plug manager](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
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
git clone --bare alias config='/usr/bin/git --git-dir=$HOME/.cfg/ \
    --work-tree=$HOME' $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# Checkout the actual content from the bare repository to your $HOME
# If error, check webpage
config checkout
config config --local status.showUntrackedFiles no
```


### [steam](https://www.chrisatmachine.com/Linux/08-steam-on-linux/)
If text is corrupt
` pacman -S  lib32-fontconfig ttf-liberation wqy-zenhei `


### if default browser incorrect
```
xdg-mime default $(xdg-settings get default-web-browser) x-scheme-handler/https x-scheme-handler/http
```


### xinput
```
ln ~/.config/X11/xorg.conf.d/[] /etc/X11/xinit/xinitrc.d/
```


### clock drift
```
sudo pacman -S ntp
sudo ntpd -qg
sudo hwclock --systohc
```


### MATLAB
if matlab can't install
```
downgrade cairo
```


### Firefox
#### CSS
Open `about:config` page.
```
    toolkit.legacyUserProfileCustomizations.stylesheets
    layers.acceleration.force-enabled
    gfx.webrender.all
    gfx.webrender.enabled
    layout.css.backdrop-filter.enabled
    svg.context-properties.content.enabled

    layout.css.color-mix.enabled
```
Then make sure to enable them all.


### Cron
enable cron
```
systemctl enable cronie
systemctl start cronie
```

put this in `srontab -u root -e`
```
# sync time everyday at 8pm
0 20 * * * /usr/bin/ntpd -qg; /usr/bin/hwclock --systohc
```


### GRUB
[Hidden menu](https://wiki.archlinux.org/title/GRUB/Tips_and_tricks#Hidden_menu)

Fix resolution, add these in /etc/default/grub
```
GRUB_CMDLINE_LINUX_DEFAULT="nomodeset"
GRUB_GFXPAYLOAD_LINUX=1920x1080
```
remember comment default setting



### rime
If not want fcitx5 overrides xkeyboard.
Use fcitx5-configtool to uncheck Addons → XCB → Allow Overriding System XKB Settings.



