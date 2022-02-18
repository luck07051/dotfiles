from libqtile import qtile, bar, widget
from KeyChain import Keywidget
from read_xresources import xresources



myMainWidget = [
        widget.GroupBox(
            background = xresources['*.background'],
            foreground = xresources['*.foreground'],
            active = xresources['*.color7'],
            inactive = xresources['*.color8'],

            borderwidth = 3,
            highlight_method = "line",
            highlight_color = xresources['*.color8'],
            this_current_screen_border = xresources['*.color5'],
            this_screen_border = xresources['*.color5'],
            other_current_screen_border = xresources['*.color8'],
            other_screen_border = xresources['*.color8'],

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
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.WindowName( 
            foreground = xresources['*.foreground'],
            ),



        Keywidget(
            foreground = xresources['*.foreground']
            ),
        widget.Sep(
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.CurrentLayout(
            foreground = xresources['*.foreground'],
            ),
        widget.Sep(
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.CPU(
            foreground = xresources['*.foreground'],
            format = "CUP {load_percent:4.1f}%"
            ),
        #widget.ThermalSensor(
        #    foreground = xresources['*.foreground'],
        #    ),
        widget.Sep(
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.Memory(
            foreground = xresources['*.foreground'],
            format = "MEM {MemPercent:4.1f}% {MemUsed:5.0f}{mm}",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
            ),
        widget.Sep(
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        #widget.Net(
        #    foreground = xresources['*.foreground'],
        #    interface = "enp0s20f0u1",
        #    format = "NET {down}↓↑{up}",
        #    ),
        #widget.Sep(
        #    foreground = xresources['*.color8'],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 2,
        #    ),
        #widget.NvidiaSensors(
        #    foreground = xresources['*.foreground'],
        #    ),
        #widget.Sep(
        #    foreground = xresources['*.color8'],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 2,
        #    ),

        #widget.TextBox(
        #    foreground = xresources['*.foreground'],
        #    channel = "Master",
        #    text = "Vol",
        #    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
        #    ),
        #widget.Volume(
        #    foreground = xresources['*.foreground'],
        #    ),
        #widget.Sep(
        #    foreground = xresources['*.color8'],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 2,
        #    ),

        #widget.CheckUpdates(
        #    foreground = xresources['*.foreground'],
        #    update_interval = 1800,
        #    distro = "Arch",
        #    display_format = "{updates} Updates",
        #    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')},
        #    ),
        #widget.Sep(
        #    foreground = xresources['*.color8'],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 2,
        #    ),
        widget.Clock(
            foreground = xresources['*.foreground'],
            format = ' %b %d %Y - %H:%M',
            padding = 8
            ),
    ]
mySecondWidget = [
        widget.GroupBox(
            background = xresources['*.background'],
            foreground = xresources['*.foreground'],
            active = xresources['*.color7'],
            inactive = xresources['*.color8'],

            borderwidth = 3,
            highlight_method = "line",
            highlight_color = xresources['*.color8'],
            this_current_screen_border = xresources['*.color5'],
            this_screen_border = xresources['*.color5'],
            other_current_screen_border = xresources['*.color8'],
            other_screen_border = xresources['*.color8'],

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
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.WindowName( 
            foreground = xresources['*.foreground'],
            ),
        widget.Sep(
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.CurrentLayout(
            foreground = xresources['*.foreground'],
            ),
        widget.Sep(
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2,
            ),
        widget.Clock(
            foreground = xresources['*.foreground'],
            format = ' %b %d %Y - %H:%M',
            padding = 8
            ),
    ]
