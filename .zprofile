if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01c1c1c" #black
    echo -en "\e]P1d75f5f" #darkred
    echo -en "\e]P2afd75f" #darkgreen
    echo -en "\e]P3ffd787" #brown
    echo -en "\e]P487afff" #darkblue
    echo -en "\e]P5ffafd7" #darkmagenta
    echo -en "\e]P65f87af" #darkcyan
    echo -en "\e]P7d0d0d0" #lightgrey
    echo -en "\e]P8585858" #darkgrey
    echo -en "\e]P9ff8787" #red
    echo -en "\e]PA87d787" #green
    echo -en "\e]PBd7af5f" #yellow
    echo -en "\e]PC87afaf" #blue
    echo -en "\e]PDd787d7" #magenta
    echo -en "\e]PE5f5fd7" #cyan
    echo -en "\e]PF949494" #white
    clear #for background artifacting
fi
