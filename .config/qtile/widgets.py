from libqtile import qtile, bar, widget
from color import ColorScheme
from KeyChain import Keywidget


myMainWidget = [
        widget.GroupBox(
            background = ColorScheme[0],
            foreground = ColorScheme[7],
            active = ColorScheme[7],
            inactive = ColorScheme[8],

            borderwidth = 3,
            highlight_method = "line",
            highlight_color = ColorScheme[8],
            this_current_screen_border = ColorScheme[5],
            this_screen_border = ColorScheme[5],
            other_current_screen_border = ColorScheme[8],
            other_screen_border = ColorScheme[8],

            font = "Ubuntu Nerd Font",
            fontsize = 15,
            margin_y = 3,
            margin_x = 0,
            padding_y = 5,
            padding_x = 8,

            rounded = False,
            spacing = 5,
            disable_drag = True
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.WindowName( 
            foreground = ColorScheme[7],
            ),



        Keywidget(
            foreground = ColorScheme[7]
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.CurrentLayout(
            foreground = ColorScheme[7],
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.CPU(
            foreground = ColorScheme[7],
            format = "CUP {load_percent:4.1f}%"
            ),
        #widget.ThermalSensor(
        #    foreground = ColorScheme[7],
        #    ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.Memory(
            foreground = ColorScheme[7],
            format = "MEM {MemPercent:4.1f}% {MemUsed:5.0f}{mm}",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        #widget.Net(
        #    foreground = ColorScheme[7],
        #    interface = "enp0s20f0u1",
        #    format = "NET {down}↓↑{up}",
        #    ),
        #widget.Sep(
        #    foreground = ColorScheme[8],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 2,
        #    ),
        #widget.NvidiaSensors(
        #    foreground = ColorScheme[7],
        #    ),
        #widget.Sep(
        #    foreground = ColorScheme[8],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 2,
        #    ),
        widget.TextBox(
            foreground = ColorScheme[7],
            channel = "Master",
            text = "Vol",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
            ),
        widget.Volume(
            foreground = ColorScheme[7],
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        #widget.CheckUpdates(
        #    foreground = ColorScheme[7],
        #    update_interval = 1800,
        #    distro = "Arch",
        #    display_format = "{updates} Updates",
        #    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')},
        #    ),
        #widget.Sep(
        #    foreground = ColorScheme[8],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 2,
        #    ),
        widget.Clock(
            foreground = ColorScheme[7],
            format = ' %b %d %Y - %H:%M',
            padding = 8
            ),
    ]
mySecondWidget = [
        widget.GroupBox(
            background = ColorScheme[0],
            foreground = ColorScheme[7],
            active = ColorScheme[7],
            inactive = ColorScheme[8],

            borderwidth = 3,
            highlight_method = "line",
            highlight_color = ColorScheme[8],
            this_current_screen_border = ColorScheme[5],
            this_screen_border = ColorScheme[5],
            other_current_screen_border = ColorScheme[8],
            other_screen_border = ColorScheme[8],

            font = "Ubuntu Nerd Font",
            fontsize = 15,
            margin_y = 3,
            margin_x = 0,
            padding_y = 5,
            padding_x = 10,

            rounded = False,
            spacing = 5,
            disable_drag = True
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.WindowName( 
            foreground = ColorScheme[7],
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.CurrentLayout(
            foreground = ColorScheme[7],
            ),
        widget.Sep(
            foreground = ColorScheme[8],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.Clock(
            foreground = ColorScheme[7],
            format = ' %b %d %Y - %H:%M',
            padding = 8
            ),
    ]
