
"==================== KEYMAP ===================="
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

