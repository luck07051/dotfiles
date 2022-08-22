
"==================== GENERAL ===================="

" Let vim can search sub and subdir
set path+=**
" Tags setting
set tags=./.tags;,.tags
" The file what complete to ignore
set wildignore=*.git/*,*.tags,tags,*.o,*.class

" Show sign in number col
set signcolumn=number
"set signcolumn=yes

" Conceal text
set conceallevel=2

" Open new split window on bottom or right
set splitbelow
set splitright

" Fold
set foldmethod=marker
"set foldlevel=1
function! MyFoldText() "{{{
    let foldedlinecount = v:foldend - v:foldstart
    let line = getline(v:foldstart)
    " remove fold mark
    let line = substitute(line, '"\?\s*{{'.'{\s*', '', 'g')
    " remove commend mark
    let line = substitute(line, '^["\#(\*)]\s*', '', '')
    let line = strpart(line, 0, windowwidth - 8 - len(foldedlinecount))
    let showline = " " . line

    let nucolwidth = &foldcolumn + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let fillcharcount = windowwidth - strdisplaywidth(showline) - len(foldedlinecount) -1
    return showline . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction "}}}
set foldtext=MyFoldText()

" Show special char
"set list
"set listchars=tab:»\ ,eol:↲,trail:_

" Let space useless and be Leader Key
noremap <Space> <nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"


function ToggleConceal() "{{{
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction "}}}

" Not auto comment new line
autocmd filetype * set formatoptions-=c formatoptions-=r formatoptions-=o

" Delete extra space when write the file
autocmd BufWrite * call DeleteExtraSpaces()
function DeleteExtraSpaces() "{{{
    :let b:nline= line('.')
    :%s/\s\+$//e
    :%s/\n\+\%$//e
    :execute "to ".b:nline
endfunction "}}}



"==================== LaTex ===================="
autocmd VimLeave *.tex !latexmk -c %
