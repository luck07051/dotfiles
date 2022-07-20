# Change working directories when exit filemanager
lf() {
  source $XDG_CONFIG_HOME/lf/colors;\
  lf-imgview -last-dir-path="/tmp/lfcd"
  cd `cat /tmp/lfcd`
}
# Quick open filemanager
bindkey -M viins -s '^f' '^ulf\n'
bindkey -M vicmd -s '^f' 'cclf\n'
