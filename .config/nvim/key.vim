
"==================== KEYMAP ===================="
" resource vimrc
nnoremap <F5> :source $MYVIMRC<CR>

" let these key make sense
noremap Y y$
noremap ~ g~
noremap ; :
noremap : ;
noremap Q qq
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

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

" open new file
nnoremap <silent><Leader>t :tabnew<CR>
nnoremap <silent><Leader>v :split<CR>
nnoremap <silent><Leader>x :vsplit<CR>

" switch windows (currently uses plug)
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


"==================== PLUGIN ===================="
"=== ale ==="
nmap <silent> <Leader>a <Plug>(ale_next_wrap)


"=== fzf ==="
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


"=== markdown preview ==="
nmap <Leader>md <Plug>MarkdownPreview
nmap <Leader>ms <Plug>MarkdownPreviewStop
