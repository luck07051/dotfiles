import os
import subprocess
import xcffib

from typing import List  # noqa: F401

from libqtile import qtile, bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy

returnkey = "Escape"    # Esc
rootkey = "Super_L"     # left Super
mod = "mod4"            # left/right Super
mousemod = "mod1"       # Alt

terminal = "alacritty"
browser = "firefox"


from widgets import myMainWidget, mySecondWidget
from color import ColorScheme
from KeyChain import KeyNode



#====================GROUPS====================#
groups_name = ["1", "2", "3", "4", "5", "6", "7"]
groups_label = ["", "", "", "ﱘ", "ﭮ", "", ""]
groups_shortcut = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]

groups = [ Group( name = groups_name[i], label = groups_label[i] ) for i in range(len(groups_name)) ]



#====================KEY BINDING====================#

root = KeyNode([], rootkey, [], name="Root")
home = KeyNode([], returnkey, [], ishome=True, name="Home")
home.addchildren(
    root,
    )
root.sethome(home)
keys = home.children

qtile_keys = KeyNode([], "q", [
    KeyNode([], "r", [], lazy.restart()),
    KeyNode(["shift"], "q", [], lazy.shutdown()),
], name="Qtile")

open_keys = KeyNode([], "o", [
    KeyNode([], "o", [], lazy.spawn("rofi -show combi -i -theme ui_theme"), desc="Run Launcher"),
    KeyNode([], "t", [], lazy.spawn(terminal), desc="Open terminal"),
    KeyNode([], "b", [], lazy.spawn(browser), desc="Open browser"),
], name="Open")

window_keys = KeyNode([], "w", [
    KeyNode([], "w", [], lazy.spawn("rofi -show window -i -theme ui_theme"),
        desc="Open window rofi"),

    KeyNode([], "j", [], lazy.layout.shuffle_down(),  desc="Move windows down  in current stack"),
    KeyNode([], "k", [], lazy.layout.shuffle_up(),    desc="Move windows up    in current stack"),
    KeyNode([], "h", [], lazy.layout.shuffle_left(),  desc="Move windows left  in current stack"),
    KeyNode([], "l", [], lazy.layout.shuffle_right(), desc="Move windows right in current stack"),

    KeyNode([], "m", [], lazy.layout.maximize(), desc="toggle window between minimum and maximum sizes"),
    KeyNode([], "n", [], lazy.layout.normalize(), desc="normalize window size rations"),

    KeyNode([], "f", [], lazy.window.toggle_floating(), desc="toggle floating"),
], name="Window")

group_keys = KeyNode([], "g", [], name="Group")
for group in groups:
    group_keys.addchildren(
            KeyNode([], group.name, [], lazy.group[ group.name ].toscreen(),
                desc="Switch to group {}".format(group.name)),

            KeyNode(["shift"], group.name, [], lazy.window.togroup( group.name ),
                desc="Move focused window to group {}".format(group.name)),
    )



root.addchildren(
    KeyNode([], "x", [], lazy.window.kill(), desc="Kill active windows"),
    KeyNode([], "semicolon", [], lazy.spawn("rofi-menu"), desc="Open rofi menu"),

    KeyNode([], "space", [], lazy.next_screen(), desc="Switch monitor"),

    KeyNode([], "j", [], lazy.layout.down(), desc="Move focus to down in current stack"),
    KeyNode([], "k", [], lazy.layout.up(),   desc="Move focus to up in current stack"),
    
    KeyNode([], "h", [],
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc="Shrink window (MonadTall), decrease number in master pane (Tile)"),
    KeyNode([], "l", [],
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc="Expand window (MonadTall), increase number in master pane (Tile)"),

    KeyNode([], "Tab", [], lazy.next_layout(), desc="Toggle between layouts"),

    qtile_keys,     #q
    open_keys,      #o
    window_keys,    #w
    group_keys,     #g
)



#====================MOUSE BINDING====================#
mouse = [
    Drag( [mousemod], "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()),

    Drag( [mousemod, "shift"], "Button1",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()),

    Click([mousemod, "control"], "Button1", 
        lazy.window.bring_to_front())
]





#====================LAYOUT====================#
layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": ColorScheme[5],
                "border_normal": ColorScheme[0]}

layouts = [
    layout.MonadTall(**layout_theme, border_on_single = "true"),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme)
]



#====================WIDGET====================#
widget_defaults = dict(
    font = 'MesloLGL Nerd Font bold', 
    fontsize = 12,
)

extension_defaults = widget_defaults.copy()


screens = [
    Screen( top = bar.Bar( myMainWidget, opacity = 1, size = 24), 
        x = 0, y = 0, width = 1920, height = 1080),

    Screen( top = bar.Bar( mySecondWidget, opacity = 1, size = 24), 
        x = 1920, y = 0, width = 1920, height = 1080),
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




# Default bindings
#mkeys = {}
#mkeys[mod] = [
#    # Switch between windows
#    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
#    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
#    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
#    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
#    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
#    # Move windows
#    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
#    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
#    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
#    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
#    # Grow windows
#    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
#    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
#    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
#    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
#    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
#    # Toggle between split and unsplit sides of stack.
#    # Split = all windows displayed
#    # Unsplit = 1 window displayed, like Max layout, but still with
#    # multiple stack panes
#    Key( [mod, "shift"], "Return",
#        lazy.layout.toggle_split(),
#        desc="Toggle between split and unsplit sides of stack",),
#    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
#    # Toggle between different layouts as defined below
#    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
#    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
#    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
#    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
#    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
#]
#
#for i in groups_name:
#    keys.extend([
#        # mod1 + letter of group = switch to group
#        Key([mod], i, lazy.group[i].toscreen(),
#            desc="Switch to group {}".format(i)),
#
#        # mod1 + shift + letter of group = switch to & move focused window to group
#        Key([mod, "shift"], i, lazy.window.togroup(i),
#            desc="Switch to & move focused window to group {}".format(i)),
#    ])
