from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"
browser = "firefox"

#====================KEY BINDINGS====================#
keys = [
    # Basic Stuff #
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"),

    Key([mod, "shift"], "Return",
        lazy.spawn("dmenu_run -p 'Run: '"),
        desc="Run Launcher"),

    Key([mod], "b",
        lazy.spawn(browser),
        desc="Launch browser"),

    Key([mod, "shift"], "c",
        lazy.window.kill(),
        desc="Kill active windows"),

    Key([mod, "shift"], "r",
        lazy.restart(),
        desc="Restart Qtile"),

    Key([mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"),

    Key([mod], "Tab", 
        lazy.next_layout(),
        desc="Toggle between layouts"),


    # Monitor #
    Key([mod], "u", lazy.to_screen(0), desc="Focus to monitor 1"),
    Key([mod], "i", lazy.to_screen(1), desc="Focus to monitor 2"),
    Key([mod], "o", lazy.to_screen(2), desc="Focus to monitor 3"),


    # Windows #
    Key([mod], "j", lazy.layout.down(),  desc="Move focus to down in current stack"),
    Key([mod], "k", lazy.layout.up(),    desc="Move focus to up in current stack"),

    Key([mod], "h",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc="Shrink window (MonadTall), decrease number in master pane (Tile)"),
    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc="Expand window (MonadTall), increase number in master pane (Tile)"),

    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),  desc="Move windows down in current stack"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),    desc="Move windows down in current stack"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),  desc="Move windows down in current stack"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move windows down in current stack"),


    # Group #

    Key([mod], "m",
        lazy.layout.maximize(),
        desc="toggle window between minimum and maximum sizes"),

    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc="toggle floating"),

    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc="toggle fullscreen"),

]



#====================GROUPS====================#
groups = [
    Group("a"),
    Group("b"),
    Group("c")]

# mod + index Number : Switch to Group[index]
# mod + shift + index Number : Send active window to another Group
from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder(mod)



#====================LAYOUT====================#
layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "#FFC0CB",
                "border_normal": "#2F3340"}

layouts = [
    layout.MonadTall(**layout_theme, border_on_single="true"),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme)
]



#====================WIDGET====================#
widget_defaults = dict(
    font='MesloLGS Nerd Font',
    fontsize=11,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
            ],
            24,
        ),
    ),
]



#====================MISC====================#
# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
