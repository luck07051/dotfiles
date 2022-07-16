# Nushell Config File

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

# The default config record. This is where much of your global configuration is setup.
let-env config = {
    filesize_metric: false
    # basic, compact, compact_double, light, thin, with_love,
    # rounded, reinforced, heavy, none, other
    table_mode: light
    use_ls_colors: true
    rm_always_trash: false
    # if you want a light theme, replace `$dark_theme` to `$light_theme`
    color_config: $dark_theme
    use_grid_icons: true
    # always, never, number_of_rows, auto
    #footer_mode: "25"
    footer_mode: auto
    # set this to false to prevent auto-selecting completions when only one remains
    quick_completions: false
    # set this to false to prevent partial filling of the prompt
    partial_completions: true
    # prefix, fuzzy
    completion_algorithm: "fuzzy"
    # redraw the prompt every second
    animate_prompt: false
    float_precision: 2
    # command that will be used to edit the current line buffer with ctrl+o,
    # if unset fallback to $env.EDITOR and $env.VISUAL
    #buffer_editor: "emacs"
    use_ansi_coloring: true
    # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
    filesize_format: "auto"
    # emacs, vi
    edit_mode: vi
    # Session has to be reloaded for this to take effect
    max_history_size: 10000
    # Enable to share the history between multiple sessions,
    # else you have to close the session to persist history to file
    sync_history_on_enter: true
    # "sqlite" or "plaintext"
    history_file_format: "plaintext"
    # enables terminal markers and a workaround to arrow keys stop working issue
    shell_integration: true
    # set to true to remove the index column from tables
    disable_table_indexes: false
    # set to true to allow you to do things like cd s/o/f and
    # nushell expand it to cd some/other/folder
    cd_with_abbreviations: false
    # set to true to enable case-sensitive completions
    case_sensitive_completions: false
    # set to false to prevent nushell looking into $env.PATH to
    # find more suggestions, `false` recommended for WSL users
    # as this look up my be very slow
    enable_external_completion: true

    keybindings: $keybindings
    menus: $menus
    hooks: { #{{{
        pre_prompt: [{
            # replace with source code to run before the prompt is shown
            $nothing
        }]
        pre_execution: [{
            # replace with source code to run before the repl input is run
            $nothing
        }]
        env_change: {
            PWD: [{|before, after|
                # replace with source code to run if the PWD environment
                # is different since the last repl input
                $nothing
            }]
        }
    } #}}}

}


# use bare Git repository to manager my dotfiles
alias conf = /usr/bin/git --git-dir $"($env.HOME)/.dotfiles/" --work-tree $env.HOME

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
        LF_COLORS: ( open $"($env.CONFIG)/lf/colors.txt" | str replace -a "\n" "" )
    } {
        lf-imgview -last-dir-path="/tmp/lfcd"
    }
    cd ( open /tmp/lfcd )
}
