
let $VIMHOME = "$XDG_CONFIG_HOME/nvim"

source $VIMHOME/basic.vim
source $VIMHOME/general.vim

source $VIMHOME/plugin.vim
source $VIMHOME/key.vim


" Fix filetype
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Fix initial size incorrectly
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
