import os
import subprocess

from typing import List  # noqa: F401

from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"
browser = "firefox"

import functions
import widgets


#====================KEY BINDING====================#
keys = [
    #===Basic Stuff===#
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn("dmenu_run -l 20"), desc="Run Launcher"),

    Key([mod], "q", lazy.window.kill(), desc="Kill active windows"),

    Key([mod], "y", functions.spawn_specific_app, desc="open specific app depend on group"),


    Key([mod, "control"], "s", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Logout Qtile"),

    Key([mod, "control"], "r", lazy.spawn("reboot"), desc="Reboot"),
    Key([mod, "control"], "d", lazy.spawn("shutdown now"), desc="Shutdown"),


    #===Monitor===#
    Key([mod], "u", lazy.to_screen(0), desc="Focus to monitor 1"),
    Key([mod], "i", lazy.to_screen(1), desc="Focus to monitor 2"),


    #===Layout===#
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

    KeyChord([mod], "m", [
        Key([], "j", lazy.layout.shuffle_down(),  desc="Move windows down  in current stack"),
        Key([], "k", lazy.layout.shuffle_up(),    desc="Move windows up    in current stack"),
        Key([], "h", lazy.layout.shuffle_left(),  desc="Move windows left  in current stack"),
        Key([], "l", lazy.layout.shuffle_right(), desc="Move windows right in current stack"),
        Key([], "m", lazy.layout.maximize(), desc="toggle window between minimum and maximum sizes"),
        Key([], "n", lazy.layout.normalize(), desc="normalize window size rations"),
    ]),

    #===Group===#

    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc="toggle floating"),

    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc="toggle fullscreen"),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),


    #===Open App===#
    KeyChord([mod], "space", [
        Key([], "b", lazy.spawn(browser)),
        Key([], "d", lazy.spawn("discord")),
        Key([], "m", lazy.spawn(terminal + " -e ncmpcpp")),
    ]),

]




#====================GROUPS====================#
groups_name = ["1","2","3","4","5"]

groups = [
    Group(
        name = groups_name[0],
        label = "B  ",
        matches = [Match(wm_class = browser)],
        spawn = (browser),
        ),
    Group(
        name = groups_name[1], 
        label = "T  ",
        matches = [Match(wm_class = terminal)],
        spawn = (terminal),
        ),
    Group(
        name = groups_name[2], 
        label = "C  ",
        ),
    Group(
        name = groups_name[3], 
        label = "M  ",
        ),
    Group(
        name = groups_name[4], 
        label = "D ﭮ ",
        ),
]

for i in groups_name:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i, lazy.group[i].toscreen(),
            desc="Switch to group {}".format(i)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i, lazy.window.togroup(i, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i)),
    ])




#====================LAYOUT====================#
layout_theme = {"border_width": 2,
                "margin": 6,
                "border_focus": "#FFC0CB",
                "border_normal": "#2F3340"}

layouts = [
    layout.MonadTall(**layout_theme, border_on_single = "true"),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme)
]



#====================WIDGET====================#
widget_defaults = dict(
    font = 'MesloLGM Nerd Font Bold',
    fontsize = 12,
)

extension_defaults = widget_defaults.copy()

colors = [  "#1d1f21", "#c1c8c6",
            "#777777", "#555555",
            "#ffc0cb"]


screens = [
    Screen( top = bar.Bar( widgets.myMainWidget, opacity = 0.98, size = 24), 
        x = 0, y = 0, width = 1920, height = 1080),

    Screen( top = bar.Bar( widgets.mySecondWidget, opacity = 0.98, size = 24), 
        x = 1920, y = 0, width = 1920, height = 1080),
]       



#====================HOOK====================#
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])


#====================MOUSE BINDING====================#
# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


#====================MISC====================#
# Float rule
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class = 'confirmreset'),  # gitk
    Match(wm_class = 'makebranch'),  # gitk
    Match(wm_class = 'maketag'),  # gitk
    Match(wm_class = 'ssh-askpass'),  # ssh-askpass
    Match(title = 'branchdialog'),  # gitk
    Match(title = 'pinentry'),  # GPG key password entry

    Match(wm_class = 'pavucontrol'),  # Volume Controler
])

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = False
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



