
"==================== PLUGIN INSTALL ===================="
call plug#begin('~/.config/nvim/plugged')

" Status bar
Plug 'itchyny/lightline.vim'
" Linting
Plug 'dense-analysis/ale'
" Code comletion
Plug 'ycm-core/YouCompleteMe'
" Show marks on sign column
Plug 'kshenoy/vim-signature'
" Vimwiki
Plug 'vimwiki/vimwiki'
" Use C-hjkl to switch vim and tmux panel
Plug 'christoomey/vim-tmux-navigator'
" Add some movement to Sorrondings
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
""
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

"Plug 'easymotion/vim-easymotion'

"=== fzf ==="
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

"=== markdown ==="
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

"=== laTex ==="
Plug 'lervag/vimtex', { 'for': 'tex' }

"=== language ==="
Plug 'rust-lang/rust.vim'
Plug 'elkowar/yuck.vim'

"=== Misc ==="
Plug 'ap/vim-css-color'

call plug#end()


"==================== CONFIG ===================="
"=== lightline ==="
set noshowmode          " dont show mode below
let g:lightline = { 'active': {} }
source $XDG_CONFIG_HOME/nvim/colors/ui_lightline_colors.vim
let g:lightline.colorscheme = 'ui_lightline_colors'

let g:lightline.active.left =
    \   [ [ 'mode', 'paste' ],[ 'readonly', 'filename', 'modified' ] ]
let g:lightline.active.right =
    \   [ [ 'lineinfo' ], [ 'percent' ],
    \   [ 'fileencoding', 'filetype', 'totalline' ] ]

let g:lightline.component= {
    \   'totalline': '%L'}
let g:lightline.component_function= {
    \   'filetype': 'LightlineFiletype',
    \   }

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction


"=== ale ==="
" run linter when text changed in normal mode or leave insert mode
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
hi ALEErrorSign     ctermfg=1   ctermbg=none
hi ALEWarningSign   ctermfg=3   ctermbg=none
hi SpellBad         ctermfg=1   ctermbg=none    cterm=bold,underline
hi SpellCap         ctermfg=3   ctermbg=none    cterm=bold,underline


"=== easymotion ==="
" wish: over press s/f/t jump to next search


"=== fzf ==="
let g:fzf_layout = { 'down': '40%' }
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }


"=== vimwiki ==="
" use markdown syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" makes vimwiki markdown links ad [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1


"=== markdown preview ==="
let g:mkdp_browser = 'surf'
"let g:mkdp_auto_start = 1
let g:mkdp_preview_options = {}
let g:mkdp_preview_options.sync_scroll_type = 'relative'
let g:mkdp_preview_options.disable_filename = v:true
let g:mkdp_markdown_css = expand('$XDG_CONFIG_HOME/nvim/colors/markdown.css')


"=== vim markdown ==="
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1


"=== vimtex ==="
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'



