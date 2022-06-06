
"==================== PLUGIN ===================="
call plug#begin('~/.config/nvim/plugged')
"===Basic==="
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
""
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"===fzf==="
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

"===markdown==="
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

"===laTex==="
Plug 'lervag/vimtex', { 'for': 'tex' }

"===language==="
Plug 'rust-lang/rust.vim'
Plug 'elkowar/yuck.vim'

"===Misc==="
Plug 'ap/vim-css-color'

call plug#end()


"==================== CONFIG ===================="
"===lightline==="
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


"===ale==="
nmap <silent> <Leader>a <Plug>(ale_next_wrap)
" run linter when text changed in normal mode or
" leave insert mode
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
hi ALEErrorSign     ctermfg=1   ctermbg=none
hi ALEWarningSign   ctermfg=3   ctermbg=none
hi SpellBad         ctermfg=1   ctermbg=none    cterm=bold,underline
hi SpellCap         ctermfg=3   ctermbg=none    cterm=bold,underline

"let g:ale_linters = {'rust': ['cargo', 'rls']}

"===easymotion==="
" wish: over press s/f/t jump to next search


"===fzf==="
let g:fzf_layout = { 'down': '40%' }
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fm :Marks<CR>
nnoremap <Leader>fg :Rg<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>f/ :Helptags<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>


"===vimwiki==="
" use markdown syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" makes vimwiki markdown links ad [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1


"===markdown preview==="
nmap <Leader>md <Plug>MarkdownPreview
nmap <Leader>ms <Plug>MarkdownPreviewStop
let g:mkdp_browser = 'surf'
let g:mkdp_auto_close = 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'relative',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }


"===vim markdown==="
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1


"===vimtex==="
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'



