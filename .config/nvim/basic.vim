
"==================== BASIC ===================="
filetype plugin indent on
syntax enable

colorscheme ui_colors

set ruler               " show the cursor position below
set number              " show line number on left side
set relativenumber     " show relative number instead absolute number
set showcmd             " show incomplete commad in last line
set cursorline          " highlight cursor line
set laststatus=2        " always show statusline
set scrolloff=3         " keep 3 line when scrolling

"===== Search ====="
set hlsearch            " highlight search result
set incsearch           " do incremental searching
set ignorecase          " ignore case when searching, use \c turn off
set smartcase           " no ignorecase if uppercase char present

"===== Indent ====="
set shiftwidth=4        " indent width
set softtabstop=4       " tab width
set expandtab           " tab always insert softtabstop of amonut spaces
set autoindent          " copy the indentation of the previous line
set smartindent         " auto indent to next level, work on C-like file
set shiftround          " round indent to multiple of 'shiftwidth'

"===== Misc ====="
set linebreak           " if text warp, no break on word
set showbreak=↪\ "      " if text warp, show a char to tell
set wildmenu            " show the commom complete list, can use Tab and S-Tab
