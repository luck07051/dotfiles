" =============================================================================
" Filename: autoload/lightline/colorscheme/ui_lightline_colors.vim
" Author: luck07051
" License: MIT License
" Last Change: 2022/03/15 23:58:59.
" =============================================================================

let s:black =   [ '#1C1C1C', 234 ]
let s:white = [ '#bcbcbc', 250 ]
let s:none =   [ 'NONE', 'NONE' ]

let s:base0 = [ '#4e4e43', 239 ]
let s:base1 = [ '#6c6c6c', 242  ]

let s:yellow = [ '#d8af5f', 3 ]
let s:orange = [ '#d7875f', 216 ]
let s:red = [ '#d68787', 131 ]
let s:magenta = [ '#df5f87', 168 ]
let s:peach = [ '#d7afaf', 181 ]
let s:blue = [ '#87afaf', 109 ]
let s:cyan = [ '#87d7d7', 23 ]
let s:green = [ '#87af87', 108 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left =   [ [ s:black, s:blue ], [ s:white, s:base0 ] ]
let s:p.normal.right =  [ [ s:white, s:none ], [ s:white, s:none ] ]
let s:p.normal.middle = [ [ s:base1, s:none ] ]

let s:p.inactive.left =   [ [ s:white, s:base0 ], [ s:base1, s:black ] ]
let s:p.inactive.right =  [ [ s:base1, s:none ], [ s:base1, s:none ] ]
let s:p.inactive.middle = [ [ s:base1, s:none ] ]


let s:p.insert.left =  [ [ s:black, s:green ], [ s:white, s:base1 ] ]
let s:p.replace.left = [ [ s:black, s:magenta ], [ s:white, s:base1 ] ]
let s:p.visual.left =  [ [ s:black, s:peach ], [ s:white, s:base1 ] ]

let s:p.tabline.left =   [ [ s:white, s:none ] ]
let s:p.tabline.tabsel = [ [ s:white, s:base0 ] ]
let s:p.tabline.middle = [ [ s:white, s:none ] ]
let s:p.tabline.right = copy(s:p.normal.right)

let s:p.normal.error =   [ [ s:red, s:none ] ]
let s:p.normal.warning = [ [ s:yellow, s:base0 ] ]

let g:lightline#colorscheme#ui_lightline_colors#palette = lightline#colorscheme#flatten(s:p)
