Config { 
      font            = "xft:Ubuntu Nerd Font:weight=bold:size=12:antialias=true:hinting=true"
    , additionalFonts = []

    , bgColor = "#1b1f21"
    , fgColor = "#b6beb9"
    , position = TopSize L 100 24
    , alpha = 255

    , lowerOnStart = True
    , pickBroadest = False
    , persistent = False
    , hideOnStart = False
    , allDesktops = True
    , overrideRedirect = True

    , iconRoot = ".config/xmonad/icon"

    , commands = [
                 Run UnsafeStdinReader

                 Run DiskU [("/", "<fn=2>\xf0c7</fn>  hdd: <free> free")] [] 60

                , Run Cpu ["-t", "<fn=1>\xf413</fn> cpu: (<total>%)","-H","50","--high","red"] 20

                -- , Run Cpu ["-L","3","-H","50", "--normal","green","--high","red"] 10
                , Run Memory ["-t","Mem: <usedratio>%"] 10

                , Run Swap [] 10


                -- date
                , Run Date "<fn=1>\xf017</fn> %b %d %Y - %H:%M" "date" 50
                ]
    , sepChar = "%"
    , alignSep = "}{"
    , template =   "%UnsafeStdinReader%\
                    \<fc=#666666>|</fc>}\

                    \{ %cpu% \
                    \%memory% %swap%\
                    \<fc=#ee9a00>%date%</fc> "
    }
