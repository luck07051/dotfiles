#if [ "$TERM" = "linux" ]; then
#    echo -en "\e]P01C1C1C" #black
#    echo -en "\e]P1CF6868" #darkred
#    echo -en "\e]P2ADCF68" #darkgreen
#    echo -en "\e]P3FFDF5F" #brown
#    echo -en "\e]P476A3D1" #darkblue
#    echo -en "\e]P5FFB9DC" #darkmagenta
#    echo -en "\e]P687ADA3" #darkcyan
#    echo -en "\e]P7D0D0D0" #lightgrey
#    echo -en "\e]P8585858" #darkgrey
#    echo -en "\e]P9E59999" #red
#    echo -en "\e]PA94C68B" #green
#    echo -en "\e]PBFFD787" #yellow
#    echo -en "\e]PC68ADCF" #blue
#    echo -en "\e]PDD5B0FF" #magenta
#    echo -en "\e]PE82C4AC" #cyan
#    echo -en "\e]PF949494" #white
#    clear #for background artifacting
#fi

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  startx
#fi
