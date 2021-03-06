# Nushell Environment Config File

# prompt {{{
def create_left_prompt [] {
    let path_segment = $"(ansi green_bold)($env.PWD)"
    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([ (date now | date format '%R') ] | str collect)
    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
#let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }
let-env PROMPT_COMMAND_RIGHT = { $nothing }

let-env PROMPT_INDICATOR = " > "
let-env PROMPT_INDICATOR_VI_INSERT = " > "
let-env PROMPT_INDICATOR_VI_NORMAL = " < "
let-env PROMPT_MULTILINE_INDICATOR = $"(ansi light_gray) "
#}}}

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) }
        to_string: { |v| $v | path expand | str collect (char esep) }
    }
}


let-env NU_CONFIG_DIR = ($nu.config-path | path dirname)
# Directories to search for scripts when calling source or use
let-env NU_LIB_DIRS = [
    ($env.NU_CONFIG_DIR | path join 'scripts')
]
# Directories to search for plugin binaries when calling register
let-env NU_PLUGIN_DIRS = [
    ($env.NU_CONFIG_DIR | path join 'plugins')
]



# Use sh scripts to handle env
~/.config/nushell/profile

# Add zoxid
zoxide init nushell --hook prompt --cmd cd
| save $"($env.NU_CONFIG_DIR)/zoxide.nu"

# Shorthand
let-env CONFIG  = $env.XDG_CONFIG_HOME
let-env CACHE   = $env.XDG_CACHE_HOME
let-env DATA    = $env.XDG_DATA_HOME
let-env STATE   = $env.XDG_STATE_HOME
