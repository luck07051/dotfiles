# Change working directorie when exit filemanager

function lf() {
  source $XDG_CONFIG_HOME/lf/colors;\
    lf-imgview -last-dir-path="/tmp/lfcd"
  cd `cat /tmp/lfcd`
}
