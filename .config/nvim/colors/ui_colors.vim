let g:colors_name = "ui_colors"

"==================== COLORS ===================="
set background=dark         " dark back ground


"=== Cursor ==="

hi CursorLine                   ctermbg=236 cterm=none
hi CursorLineNr     ctermfg=7   ctermbg=236 cterm=bold
hi LineNr           ctermfg=8

hi VertSplit        ctermfg=236 ctermbg=236
hi SignColumn                   ctermbg=none


"=== Syntax ==="

hi Comment          ctermfg=15
hi Statement        ctermfg=4
hi Identifier       ctermfg=6
hi PreProc          ctermfg=6
hi Constant         ctermfg=3
hi Identifier       ctermfg=10
hi Type             ctermfg=14
hi Error            ctermfg=0   ctermbg=1
hi MatchParen       ctermfg=0   ctermbg=15


"=== Misc ==="

hi ErrorMsg         ctermfg=7
" listchars eol
hi NonText          ctermfg=238
" listchars space, tab
hi SpecialKey       ctermfg=238
" complete menu
hi Pmenu            ctermfg=7   ctermbg=236
" concealed text
hi Conceal                      ctermbg=none



"==================== SPECIAL FUNCTION ===================="
" highlight 81 column
hi ColorColumn                  ctermbg=8
call matchadd('ColorColumn', '\%81v', 100)

" show extra space
hi ExtraWhitespace              ctermbg=8
match ExtraWhitespace /\s$/

"==================== FILE SPECIFIC ===================="

