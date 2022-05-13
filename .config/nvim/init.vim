" todo:
" * one key for open md or tex previewer.
" * keybind for switch tab etc.

"====================GENERAL===================="
filetype plugin indent on
syntax enable

"===Basic==="
set ruler                   " show the cursor position below
set number relativenumber   " show line number on left side
set showcmd                 " show incomplete commad in last line
set cursorline              " highlight cursor line
set laststatus=2            " always show statusline
set scrolloff=3             " keep 3 line when scrolling


"===Search==="
set hlsearch            " highlight search result
set incsearch           " do incremental searching
set ignorecase          " ignore case when searching, use \c turn off
set smartcase           " no ignorecase if uppercase char present


"===Indent==="
set shiftwidth=4        " indent width
set softtabstop=4       " tab width
set expandtab           " tab always insert softtabstop of amonut spaces
set autoindent          " copy the indentation of the previous line
set smartindent         " auto indent to next level, work on C-like file
set shiftround          " round indent to multiple of 'shiftwidth'


"===Misc==="
set showmatch           " when you insert bracket,
set matchtime=1         "    the cursor will briefly jump to the matching one

set linebreak           " if text warp, no break on word

set novisualbell        " turn off visual bell
set visualbell t_vb=    " turn off error beep/flash

"set termhuicolors
set t_Co=256            " set 256 colors if term supports
set t_ut=""

set wildmenu            " show the commom complete list, can use Tab and S-Tab

"set list
"set listchars=tab:»\ ,eol:↲,trail:_
set showbreak=↪\ "



"====================THEME===================="
set background=dark         " dark back ground
"===Cursor==="
hi CursorLine                   ctermbg=236 cterm=none
hi CursorLineNr     ctermfg=7   ctermbg=236 cterm=bold
hi LineNr           ctermfg=8

hi VertSplit        ctermfg=236 ctermbg=236
hi SignColumn                   ctermbg=none
"===Syntax==="
hi Comment          ctermfg=15
hi Statement        ctermfg=4
hi Identifier       ctermfg=6
hi PreProc          ctermfg=6
hi Constant         ctermfg=3
hi Identifier       ctermfg=10
hi Type             ctermfg=14
hi Error            ctermfg=0   ctermbg=1
hi MatchParen       ctermfg=0   ctermbg=4
"===Misc==="
hi ErrorMsg         ctermfg=7
" listchars eol
hi NonText          ctermfg=238
" listchars space, tab
hi SpecialKey       ctermfg=238
" complete menu
hi Pmenu            ctermfg=7   ctermbg=236

" highlight 81 column
hi ColorColumn                  ctermbg=8
call matchadd('ColorColumn', '\%81v', 100)

" show extra space
hi ExtraWhitespace              ctermbg=8
match ExtraWhitespace /\s$/




"====================AUTOCMD===================="
" Not auto comment new line
autocmd filetype * set formatoptions-=c formatoptions-=r formatoptions-=o


" Delete extra space when write the file
autocmd BufWrite * call DeleteExtraSpaces()
function DeleteExtraSpaces()
    :let b:nline= line('.')
    :%s/\s\+$//e
    :execute "to ".b:nline
endfunction


" Fix initial size incorrectly
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"


" set color for tex
autocmd filetype tex hi Error ctermfg=1   ctermbg=none





"====================KEYMAP===================="
" resource vimrc
nnoremap <F5> :source $MYVIMRC<CR>

" let space useless and be Leader Key
noremap <Space> <nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

noremap Y y$
noremap ~ g~
noremap ; :
noremap : ;
noremap Q qq
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

"" add a empty line
"nnoremap <silent><C-j> :set paste<CR>m'o<Esc>'':set nopaste<CR>
"nnoremap <silent><C-k> :set paste<CR>m'O<Esc>'':set nopaste<CR>

" let d purely for deleting
noremap <Leader>d "_d
noremap <Leader>D "_D
" let y and p can use clipboard
noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P

" cancel search highlight
nnoremap <silent><Leader>nh :nohlsearch<CR>
" delete extra spaces
nnoremap <silent><Leader>ns :call DeleteExtraSpaces()<CR>

" open new file
nnoremap <silent><Leader>t :tabnew<CR>
nnoremap <silent><Leader>v :split<CR>
nnoremap <silent><Leader>x :vsplit<CR>

" switch windows
"nnoremap <silent><C-j> <C-w>j
"nnoremap <silent><C-k> <C-w>k
"nnoremap <silent><C-h> <C-w>h
"nnoremap <silent><C-l> <C-w>l
"" switch buffers
"nnoremap <silent><A-j> :bnext<CR>
"nnoremap <silent><A-k> :bprev<CR>
"" switch tabs
"nnoremap <silent><A-h> gT
"nnoremap <silent><A-l> gt

"===Copy or Change Search==="
vnoremap <silent>s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>




"====================PLUGIN===================="
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


"====================PLUGIN CONFIG===================="
"===lightline==="
set noshowmode          " dont show mode below
let g:lightline = { 'active': {} }
let g:lightline.colorscheme = 'ui_theme'

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
