"====================GENERAL===================="
filetype plugin indent on
syntax enable

"===Basic==="
set ruler               " show the cursor position below
set number              " show line number on left side
set showcmd             " show incomplete commad in last line
set cursorline          " highlight cursor line
set laststatus=2        " always show statusline
set scrolloff=3         " keep 3 line when scrolling

"===Theme==="
set background=dark     " dark back ground
"=Cursor="
hi CursorLine                   ctermbg=236 cterm=none
hi CursorLineNr     ctermfg=7   ctermbg=236 cterm=bold
hi LineNr           ctermfg=8
"=Syntax="
hi Comment          ctermfg=15
hi Statement        ctermfg=4
hi Identifier       ctermfg=6
hi PreProc          ctermfg=6
hi Constant         ctermfg=11
hi Identifier       ctermfg=10
hi Type             ctermfg=14
"=Misc="
hi ErrorMsg         ctermfg=7
" listchars eol
hi NonText          ctermfg=238
" listchars space, tab
hi SpecialKey       ctermfg=238


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
set shiftround          " round the indentation to the nearest multiple of shiftwidth


"===Misc==="
set showmatch           " when you insert bracket,
set matchtime=1         "    the cursor will briefly jump to the matching one

set linebreak           " if text warp, no break on word

set novisualbell        " turn off visual bell
set visualbell t_vb=    " turn off error beep/flash

set t_Co=256            " set 256 colors if term supports
set t_ut=""

set wildmenu            " show the commom complete list, can use Tab and S-Tab

"set list
set listchars=tab:»\ ,eol:↲,trail:_
set showbreak=↪\ "


"====================KEYMAP===================="
" let space useless and be Leader Key
noremap <Space> <nop>
let mapleader="\<Space>"
" resource vimrc
nnoremap <F5> :source $MYVIMRC<CR>

"===Remap Defalut Key==="
noremap Y y$
noremap ~ g~

"===Add a Empty Line==="
nnoremap <silent><C-j> :set paste<CR>m'o<Esc>'':set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m'O<Esc>'':set nopaste<CR>


"===Leader Key==="
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
nnoremap <Leader>ns :call DeleteExtraSpaces()<CR>

"===Copy or Change Search==="
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>



"====================AUTOCMD===================="
" Not auto comment new line
autocmd filetype * set formatoptions-=c formatoptions-=r formatoptions-=o

" Delete extra space
autocmd BufWrite *.cpp,*.h,makefile call DeleteExtraSpaces()
function DeleteExtraSpaces()
    :let b:nline= line('.')
    :%s/\s\+$//e
    :execute "to ".b:nline
endfunction

" Fix initial size incorrectly
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"



"====================PLUGIN===================="
call plug#begin('~/.vim/plugged')
"===Basic==="
Plug 'itchyny/lightline.vim'

"===vimwiki and markdown==="
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'

Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app && yarn install' }

Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

"=== ==="
Plug 'ap/vim-css-color'

call plug#end()
" :PlugInstall


"===lightline==="
" Set lightline theme
let g:lightline = { 'colorscheme': 'seoul256' }
set noshowmode          " dont show mode below



"===vimwiki==="
" use markdown syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" makes vimwiki markdown links ad [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1


"===taskwiki==="
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_taskrc_location = '~/.config/task/taskrc'
let g:taskwiki_data_location = '~/.local/share/task/'
let g:taskwiki_disable_concealcursor = 'yes'


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


