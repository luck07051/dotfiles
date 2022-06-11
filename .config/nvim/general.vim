
"==================== GENERAL ===================="

" let space useless and be Leader Key
noremap <Space> <nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"


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

