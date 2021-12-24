set nocompatible
set t_RV=
filetype off
set encoding=utf-8
filetype plugin indent on


"====================PLUGIN===================="
call plug#begin('~/.vim/plugged')

"===Basic==="
Plug 'itchyny/lightline.vim'

call plug#end()
" :PlugInstall



"====================GENERAL===================="
"===Basic===" 
set ruler               " show the cursor position below
set number              " show line number on left side
set showcmd             " show incomplete commad in last line
set cursorline          " highlight cursor line
set laststatus=2        " always show statusline
set scrolloff=3         " keep 3 line when scrolling

"===Theme==="
set background=dark     " dark back ground
colorscheme lucius      " theme
syntax enable           " open syntax highlight

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
set nobackup            " not keep the backup file

set showmatch           " when you insert bracket, 
set matchtime=1         "    the cursor will briefly jump to the matching one

set backspace=indent,eol,start  " make that backspace key work the way it should

set linebreak           " if text warp, no break on word

set novisualbell        " turn off visual bell
set visualbell t_vb=    " turn off error beep/flash

set t_Co=256            " set 256 colors if term supports
set t_ut=""

set wildmenu            " show the commom complete list, can use Tab and S-Tab


"====================KEYMAP===================="
" let space useless and be Leader Key
noremap <Space> <nop>
let mapleader="\<Space>"
" resource vimrc
nnoremap <F5> :source $MYVIMRC<CR>

"===Remap Defalut Key==="
noremap Y y$
noremap ~ g~
noremap 0 ^
"noremap Q gq

"===Add a Empty Line==="
nnoremap <silent><C-j> :set paste<CR>m'o<Esc>'':set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m'O<Esc>'':set nopaste<CR>


"===Leader Key==="
noremap <Leader>m %
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
   
"===Copy or Change Search==="
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>



"====================AUTOCMD===================="
" not auto comment new line
autocmd filetype * set formatoptions-=c formatoptions-=r formatoptions-=o

" delete extra space
autocmd BufWrite *.cpp,*.h,makefile call DeleteExtraSpaces()
function DeleteExtraSpaces()
    :let b:nline= line('.')
    :%s/\s\+$//e
    :execute "to ".b:nline
endfunction



"====================PLUGIN===================="

"===lightline==="
" Set lightline theme
let g:lightline = { 'colorscheme': 'darcula' } 
set noshowmode          " dont show mode below

