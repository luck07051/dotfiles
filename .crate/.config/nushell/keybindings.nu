let keybindings = [
    {
        name: completion-open-or-next
        modifier: control
        keycode: char_n
        mode: [emacs, vi_insert]
        event: {
            until: [
                { send: menu name: completion_menu }
                { send: menunext }
            ]
        }
    }
    {
        name: completion-previous
        modifier: control
        keycode: char_p
        mode: [emacs, vi_insert]
        event: { send: menuprevious }
    }
    {
        name: history-menu
        modifier: control
        keycode: char_r
        mode: [emacs, vi_normal, vi_insert]
        event: {
            until: [
                { send: menu name: history_menu }
                { send: menunext }
            ]
        }
    }

    {
        name: del-word
        modifier: control
        keycode: char_w
        mode: [emacs, vi_insert]
        event: {
            edit: BackspaceWord
        }
    }


    # Keybindings used to trigger the user defined menus
    {
        name: commands_menu
        modifier: control
        keycode: char_q
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menu name: help_menu }
    }

    {
        name: commands_menu
        modifier: control
        keycode: char_t
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menu name: commands_menu }
    }

    {
        name: vars_menu
        modifier: alt
        keycode: char_o
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menu name: vars_menu }
    }
    {
        name: commands_with_description
        modifier: control
        keycode: char_s
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menu name: commands_with_description }
    }
]
