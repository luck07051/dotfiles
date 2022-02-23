import os
from libqtile import qtile, bar, widget
from KeyChain import Keywidget
from read_xresources import xresources

def separator():
    return widget.Sep(
            foreground = xresources['*.color8'],
            size_percent = 90,
            linewidth = 2,
            padding = 2)

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

        separator(),

        widget.WindowName(
            foreground = xresources['*.foreground'],
            ),


        # the widget for key chain
        #Keywidget(
        #    foreground = xresources['*.foreground']
        #    ),
        #separator(),

        widget.CurrentLayout(
            foreground = xresources['*.foreground'],
            ),

        separator(),

        widget.CPU(
            foreground = xresources['*.foreground'],
            format = "CUP {load_percent:4.1f}%"
            ),

        separator(),

        widget.Memory(
            foreground = xresources['*.foreground'],
            format = "MEM {MemPercent:4.1f}% {MemUsed:5.0f}{mm}",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(os.environ['TERMINAL'] + ' --class "floating" -e htop')},
            ),

        separator(),

        widget.CheckUpdates(
            foreground = xresources['*.foreground'],
            update_interval = 1800,
            distro = "Arch",
            display_format = "{updates} Updates",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(os.environ['TERMINAL'] + ' --class "floating" -e sudo pacman -Syu')},
            ),

        #widget.Net(
        #    foreground = xresources['*.foreground'],
        #    interface = "enp0s20f0u1",
        #    format = "NET {down}↓↑{up}",
        #    ),
        #
        #separator(),

        #widget.NvidiaSensors(
        #    foreground = xresources['*.foreground'],
        #    ),
        #
        #separator(),

        widget.TextBox(
            foreground = xresources['*.foreground'],
            channel = "Master",
            text = "Vol",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
            ),
        widget.PulseVolume(
            foreground = xresources['*.color7'],
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
            ),


        separator(),

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

        separator(),

        widget.WindowName(
            foreground = xresources['*.foreground'],
            ),

        separator(),

        widget.CurrentLayout(
            foreground = xresources['*.foreground'],
            ),

        separator(),

        widget.Clock(
            foreground = xresources['*.foreground'],
            format = ' %b %d %Y - %H:%M',
            padding = 8
            ),
    ]
