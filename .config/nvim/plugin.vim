
"==================== PLUGIN INSTALL ===================="
call plug#begin('~/.config/nvim/plugged')

" ale {{{
Plug 'dense-analysis/ale'

" run linter when text changed in normal mode or leave insert mode
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

"let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

"}}}
" YouCompleteMe {{{
Plug 'ycm-core/YouCompleteMe'

" set popup menu size
set pumheight=15
" dont use syntax cheacking and preview windows
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
set completeopt=menu,menuone
" let ycm work on string
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" Enter 2 word to trigger semantic completeopt
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript,rust': ['re!\w{2}'],
			\ }
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "rust":1,
            \ "python":1,
            \ "zsh":1,
            \ "sh":1,
            \ "vim":1,
            \}

"}}}
" gutentags {{{
Plug 'ludovicchabant/vim-gutentags'

" use there file to determine root dir
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" tags file name
let g:gutentags_ctags_tagfile = '.tags'
" palce tags in .cache
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" ctags option
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"}}}
" function hint {{{
Plug 'Shougo/echodoc.vim'

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
let g:echodoc#enevts = ['CompleteDone', 'TextChangedP', 'InsertEnter']
hi link EchoDocFloat Pmenu

"}}}

" vimwiki {{{
Plug 'vimwiki/vimwiki'

" use markdown syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" makes vimwiki markdown links ad [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1
"}}}
" snippet manager {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsEditSplit="vertical"

"}}}
" surround {{{
" ys to add, cs to change, ds to delete
Plug 'tpope/vim-surround'

"}}}
" commentary {{{
" gc to comment
Plug 'tpope/vim-commentary'

"}}}
" vim-repeat {{{
" let . work well with plug
Plug 'tpope/vim-repeat'

"}}}
" fzf {{{
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'down': '40%' }

"}}}
" vim-rooter {{{
" set working dir to root
Plug 'airblade/vim-rooter'

"}}}

"==================== LANGUAGE ===================="
" vim-polyglot {{{
" language packs
Plug 'sheerun/vim-polyglot'

"}}}
"===== markdown ====="
" markdown preview {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

let g:mkdp_browser = 'surf'
"let g:mkdp_auto_start = 1
let g:mkdp_preview_options = {}
let g:mkdp_preview_options.sync_scroll_type = 'relative'
let g:mkdp_preview_options.disable_filename = v:true
let g:mkdp_markdown_css = expand('$XDG_CONFIG_HOME/nvim/colors/markdown.css')

"}}}
" vim-markdown {{{
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
"}}}
"===== laTex ====="
" vimtex {{{
Plug 'lervag/vimtex', { 'for': 'tex' }

let g:vimtex_view_method = 'zathura'
"}}}
"===== other ====="
" rust {{{
Plug 'rust-lang/rust.vim'

"}}}
" yuck {{{
Plug 'elkowar/yuck.vim'

"}}}

"==================== MSIC ===================="
" lightline {{{
Plug 'itchyny/lightline.vim'


set noshowmode          " dont show mode below
let g:lightline = { 'active': {} }

let g:lightline.colorscheme = 'ui_lightline_colors'

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ], [ 'percent' ],
    \           [ 'fileencoding', 'filetype', 'totalline' ] ]
    \}
let g:lightline.component= {
    \   'totalline': '%L'}
let g:lightline.component_function= {
    \   'filetype': 'LightlineFiletype',
    \   }

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

"}}}
" smoothie {{{
Plug 'psliwka/vim-smoothie'

"}}}
" vim-css-color {{{
Plug 'ap/vim-css-color'

"}}}
" Goyo {{{
Plug 'junegunn/goyo.vim'

"}}}
" vim-signature {{{
" Show marks on sign column
Plug 'kshenoy/vim-signature'

"}}}
" vim-tmux-navigator {{{
" Use C-hjkl to switch vim and tmux panel
Plug 'christoomey/vim-tmux-navigator'

"}}}
" vim-hardtime {{{
Plug 'takac/vim-hardtime'

let g:hardtime_default_on = 0

"}}}

call plug#end()

"===== ligntline ====="
source $XDG_CONFIG_HOME/nvim/colors/ui_lightline_colors.vim


"Plug 'easymotion/vim-easymotion'  wish: over press s/f/t jump to next search
"Plug 'jdhao/better-escape.vim'
" latex
"Plug 'gillescastel/latex-snippets', { 'for': 'tex' }



"Plug 'mhinz/vim-signify'
