# Nushell Config File

# why i cant use this form
#source $"($env.NU_CONFIG_DIR)/completions"
source ~/.config/nushell/completions.nu
source ~/.config/nushell/keybindings.nu
source ~/.config/nushell/menus.nu

# for more information on themes see
# https://www.nushell.sh/book/coloring_and_theming.html
let dark_theme = { #{{{
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    bool: white
    int: white
    filesize: white
    duration: white
    date: white
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cellpath: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray

    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_binary: purple_bold
    shape_bool: light_cyan
    shape_int: purple_bold
    shape_float: purple_bold
    shape_range: yellow_bold
    shape_internalcall: cyan_bold
    shape_external: cyan
    shape_externalarg: green_bold
    shape_literal: blue
    shape_operator: yellow
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_datetime: cyan_bold
    shape_list: cyan_bold
    shape_table: blue_bold
    shape_record: cyan_bold
    shape_block: blue_bold
    shape_filepath: cyan
    shape_globpattern: cyan_bold
    shape_variable: purple
    shape_flag: blue_bold
    shape_custom: green
    shape_nothing: light_cyan
} #}}}


let-env config = {
    # basic, compact, compact_double, light, thin, with_love,
    # rounded, reinforced, heavy, none, other
    table_mode: light
    # if you want a light theme, replace `$dark_theme` to `$light_theme`
    color_config: $dark_theme
    # set this to false to prevent auto-selecting
    # completions when only one remains
    quick_completions: false
    # prefix, fuzzy
    completion_algorithm: "fuzzy"
    # redraw the prompt every second
    animate_prompt: false
    # emacs, vi
    edit_mode: vi
    # Session has to be reloaded for this to take effect
    max_history_size: 10000

    keybindings: $keybindings
    menus: $menus
}


# use bare Git repository to manager my dotfiles
alias conf = /usr/bin/git --git-dir $"($env.HOME)/.dotfiles/" --work-tree $env.HOME
alias cons = conf status

# vim
alias vim = nvim
alias ww = nvim ~/vimwiki/index.md

# ls
alias ls = ls -a
alias ll = ls -al

# Clean env
alias env = (env | where name != "config")

# File manager
def-env lf [] {
    with-env {
        LF_COLORS:
        ( open $"($env.CONFIG)/lf/colors.txt" | str replace -a "\n" "" )
    } {
        lf-imgview -last-dir-path="/tmp/lfcd"
    }
    cd ( open /tmp/lfcd )
}

# Add zoxide
#source $"($env.NU_CONFIG_DIR)/zoxide.nu"
source ~/.config/nushell/zoxide.nu
