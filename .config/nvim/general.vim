
"==================== GENERAL ===================="
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




