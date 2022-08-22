
"==================== KEYMAP ===================="
" resource vimrc
nnoremap <F5> :source $MYVIMRC<CR>:nohlsearch<CR>

" let these key make sense
noremap Y y$
noremap ~ g~
noremap ; :
noremap : ;
noremap Q qq
noremap c "_c
noremap C "_C
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

" let d purely for deleting
noremap <Leader>d "_d
noremap <Leader>D "_D
" let y and p can use clipboard
noremap cy "+y
noremap cY "+Y
noremap cp "+p
noremap cP "+P

" cancel search highlight
nnoremap <silent><Leader>nh :nohlsearch<CR>

" open new file
nnoremap <silent><Leader>t :tabnew<CR>
nnoremap <silent><Leader>v :split<CR>
nnoremap <silent><Leader>x :vsplit<CR>

" toggle conceal
nnoremap <silent><Leader>cc :call ToggleConceal()<CR>

" switch windows
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-l> <C-w>l

" adjusing split sizes
nnoremap <silent><C-Left> :vertical resize +3<CR>
nnoremap <silent><C-Right> :vertical resize -3<CR>
nnoremap <silent><C-Up> :resize +3<CR>
nnoremap <silent><C-Down> :resize -3<CR>

" open file
cnoreabbrev <expr> e getcmdtype() == ":" && getcmdline() == 'e' ? 'e<Space><C-D>' : 'e'
cnoreabbrev <expr> b getcmdtype() == ":" && getcmdline() == 'b' ? 'ls<CR>:b' : 'b'



"==================== PLUGIN ===================="

"===== ale ====="
nnoremap <Leader>aa <Plug>(ale_next_wrap)
nnoremap <Leader>ad <Plug>(ale_go_to_definition_in_split)
nnoremap <Leader>ar <Plug>(ale_find_references)
nnoremap <Leader>am <Plug>(ale_hover)
nnoremap <Leader>ai <Plug>(ale_import)
nnoremap <Leader>ao <Plug>(ale_organize_imports)
nnoremap <Leader>an <Plug>(ale_rename)
nnoremap <Leader>as :ALESymbolSearch "


"===== FZF ====="
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fm :Marks<CR>
nnoremap <Leader>fg :Rg<CR>
nnoremap <Leader>f/ :Helptags<CR>
nnoremap <C-f> :Files<CR>
nnoremap <Leader>fl <plug>(fzf-maps-n)

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }


"===== YCM ====="
"" use C-J and C-K to select completion
"let g:ycm_key_list_select_completion = ['<C-J>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-K>', '<Up>']
"let g:ycm_key_invoke_completion = '<C-J>'


"===== UltiSnips ====="
"let g:UltiSnipsExpandTrigger="<C-J>"
"let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsExpandTrigger="<Space><Space>"
let g:UltiSnipsJumpForwardTrigger="<Space><Space>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"


"===== Goyo ====="
nnoremap <silent><Leader>gg :Goyo<CR>


"===== Markdown preview ====="
nmap <Leader>md <Plug>MarkdownPreview
nmap <Leader>ms <Plug>MarkdownPreviewStop
