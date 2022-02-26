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
hi Constant         ctermfg=3
hi Identifier       ctermfg=10
hi Type             ctermfg=14
"=Misc="
hi VertSplit        ctermfg=236 ctermbg=236
hi ErrorMsg         ctermfg=7
" listchars eol
hi NonText          ctermfg=238
" listchars space, tab
hi SpecialKey       ctermfg=238

" highlight 81 column
hi ColorColumn                  ctermbg=8
call matchadd('ColorColumn', '\%81v', 100)

" show extra space
hi ExtraWhitespace              ctermbg=8
match ExtraWhitespace /\s$/


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

set t_Co=256            " set 256 colors if term supports
set t_ut=""

set wildmenu            " show the commom complete list, can use Tab and S-Tab

"set list
"set listchars=tab:»\ ,eol:↲,trail:_
set showbreak=↪\ "


"====================KEYMAP===================="
" resource vimrc
nnoremap <F5> :source $MYVIMRC<CR>

" let space useless and be Leader Key
noremap <Space> <nop>
let mapleader="\<Space>"

noremap Y y$
noremap ~ g~
nnoremap ; :
nnoremap : ;

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
nnoremap <Leader>ns :call DeleteExtraSpaces()<CR>

" switch windows
nnoremap <Leader>j <C-W>
" switch buffers
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <C-H> gT
nnoremap <C-L> gt

"===Copy or Change Search==="
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>



"====================AUTOCMD===================="
" Not auto comment new line
autocmd filetype * set formatoptions-=c formatoptions-=r formatoptions-=o

" Delete extra space
autocmd BufWrite *.cpp,*.h,*.py,*yml,makefile call DeleteExtraSpaces()
function DeleteExtraSpaces()
    :let b:nline= line('.')
    :%s/\s\+$//e
    :execute "to ".b:nline
endfunction

" Fix initial size incorrectly
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"


"====================PLUGIN===================="
call plug#begin('~/.config/nvim/plugged')
"===Basic==="
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'

"===vimwiki and markdown==="
Plug 'vimwiki/vimwiki'
"Plug 'michal-h21/vimwiki-sync'
Plug 'tools-life/taskwiki'

Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': 'cd app && yarn install'}

Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

"===Misc==="
Plug 'ap/vim-css-color'

call plug#end()


"===lightline==="
" Set lightline theme
let g:lightline = { 'colorscheme': 'seoul256' }
set noshowmode          " dont show mode below


"===easymotion==="
" wish: over press s/f/t jump to next search

" f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


"===vimwiki==="
" use markdown syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" makes vimwiki markdown links ad [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1



"===vimwiki-sync==="


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


