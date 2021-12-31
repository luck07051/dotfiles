from libqtile import qtile, bar, widget

colors = [  "#1d1f21", "#c1c8c6",
            "#777777", "#555555",
            "#f5bad0"]

myMainWidget = [
        widget.GroupBox(
            background = colors[0],
            foreground = colors[1],
            active = colors[1],
            inactive = colors[3],

            borderwidth = 3,
            highlight_method = "line",
            highlight_color = colors[3],
            this_current_screen_border = colors[4],
            this_screen_border = colors[4],
            other_current_screen_border = colors[3],
            other_screen_border = colors[3],

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
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        widget.WindowName( 
            foreground = colors[1],
            ),
        widget.Sep(
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        widget.CurrentLayout(
            foreground = colors[1],
            ),
        widget.Sep(
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        widget.CPU(
            foreground = colors[1],
            format = "CUP {load_percent:4.1f}%"
            ),
        widget.Sep(
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        widget.Memory(
            foreground = colors[1],
            format = "MEM {MemPercent:4.1f}% {MemUsed:5.0f}{mm}",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
            ),
        widget.Sep(
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        #widget.Net(
        #    foreground = colors[1],
        #    interface = "enp0s20f0u1",
        #    format = "NET {down}↓↑{up}",
        #    ),
        #widget.Sep(
        #    foreground = colors[3],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 0,
        #    ),
        #widget.ThermalSensor(
        #    foreground = colors[1],
        #    ),
        #widget.Sep(
        #    foreground = colors[3],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 0,
        #    ),
        #widget.NvidiaSensors(
        #    foreground = colors[1],
        #    ),
        #widget.Sep(
        #    foreground = colors[3],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 0,
        #    ),
        widget.TextBox(
            foreground = colors[1],
            channel = "Master",
            text = "Vol",
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
            ),
        widget.Volume(
            foreground = colors[1],
            ),
        widget.Sep(
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        #widget.CheckUpdates(
        #    foreground = colors[1],
        #    update_interval = 1800,
        #    distro = "Arch",
        #    display_format = "{updates} Updates",
        #    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')},
        #    ),
        #widget.Sep(
        #    foreground = colors[3],
        #    size_percent = 90,
        #    linewidth = 2,
        #    padding = 0,
        #    ),
        widget.Clock(
            foreground = colors[1],
            format = ' %b %d %Y - %H:%M',
            padding = 8
            ),
    ]
mySecondWidget = [
        widget.GroupBox(
            background = colors[0],
            foreground = colors[1],
            active = colors[1],
            inactive = colors[3],

            borderwidth = 3,
            highlight_method = "line",
            highlight_color = colors[3],
            this_current_screen_border = colors[4],
            this_screen_border = colors[4],
            other_current_screen_border = colors[3],
            other_screen_border = colors[3],

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
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        widget.WindowName( 
            foreground = colors[1],
            ),
        widget.Sep(
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        widget.CurrentLayout(
            foreground = colors[1],
            ),
        widget.Sep(
            foreground = colors[3],
            size_percent = 90,
            linewidth = 2,
            padding = 0,
            ),
        widget.Clock(
            foreground = colors[1],
            format = ' %b %d %Y - %H:%M',
            padding = 8
            ),
    ]
