# Change working directories when exit filemanager
lf() {
  source $XDG_CONFIG_HOME/lf/colors;\
    lf-imgview -last-dir-path="/tmp/lfcd"
  cd `cat /tmp/lfcd`
}
