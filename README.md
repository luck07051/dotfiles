# This Is My Configuration

## Installed

Basic
```
base-devel
xorg xorg-xinit
xdg-user-dirs
alsl-utils
git
wget
openssh
```

Setup
```
alacritty           # terminal emulator
bspwm               # windows manager
leftwm              # wm
sxhkd               # keybinding
yay -S polybar      # status bar
yay -S eww          # status bar
zsh                 # shell
nushell             # shell
rofi                # launcher and more
firefox             # browser
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
```


Commandline tool
```
tmux
yay -S lf           # file manager
- nsxiv             # image viewer (install from git@github.com:luck07051/nsxiv.git)
ueberzug            # image viewer (to view image in terminal)
zathura zathura-pdf-mupdf   # pdf viewer
#ncmpcpp             # music player
#yay -S ncpamixer    # pulseaudio control

icdiff              # diff tool
ffmpeg ffmpegthumbnailer    # audio/video conversion tool
youtube-dl          # youtube downloader
pactl               # pulse control

tldr                # help

fzf                 # fuzzy finder
starship            # prompt
exa                 # better ls
htop                # better top
btop                # better top
bat                 # better cat
procs               # better ps
zoxide              # better cd
fd                  # better find
sd                  # better sed
ripgerp             # better gerp
hexyl               # hex viewer
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
xorg-fonts-misc
```





## NOTE

### yay
```
$ git clone https://aur.archlinux.org/yay-git.git
$ cd yay-git
$ makepkg -si
rm yay-git
```

### vim

If markdown-preview dont work, try `:call mkdp#util#install()`


##### ycm
```
yay -S vim-youcompleteme-git
sudo pacman -S python-pynvim

cd .../plugged/YouCompleteMe
/usr/bin/python install.py --all
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
ln ~/.config/X11/xorg.conf.d/[] /etc/X11/xinit/xorg.conf.d/
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

put this in `crontab -u root -e`
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
