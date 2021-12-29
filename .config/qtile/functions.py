from libqtile import qtile
from libqtile.lazy import lazy

@lazy.function
def spawn_specific_app(qtile):
    current_group = qtile.current_group
    if current_group.name == '1':
        qtile.cmd_spawn(browser)

    elif current_group.name == "2":
        qtile.cmd_spawn(terminal)

    elif current_group.name == "3":
        qtile.cmd_spawn(terminal + " -e ncmpcpp")

    elif current_group.name == "4":
        qtile.cmd_spawn("discord")

    elif current_group.name == "5":
        qtile.cmd_spawn("steam")
