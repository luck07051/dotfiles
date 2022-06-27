
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

-- Dont auto comment next line --
autocmd( 'BufEnter', { command = [[set formatoptions-=cro]] } )

-- When save file, delete trailing spaces and extra line -- {{{
local DeleteExtraSpaces = function()
    vim.cmd [[ let b:nline= line('.') ]]
    vim.cmd [[ %s/\s\+$//e ]]
    vim.cmd [[ %s/\n\+\%$//e ]]
    vim.cmd [[ execute "to ".b:nline ]]
end
autocmd( 'BufWrite', { pattern = '*', callback = DeleteExtraSpaces } ) --}}}


-- Auto clear nonessential files when leave tex file --
autocmd( 'VimLeave', { pattern = '*.tex', command = [[!latexmk -c %]] } )
-- Fix filetype --
autocmd( {'BufRead', 'BufNewFile'},
    { pattern = '*.tex', command = [[ set filetype=tex ]] } )

cmd [[
function! MyFoldText() "{{{
    let foldedlinecount = v:foldend - v:foldstart
    let line = getline(v:foldstart)
    " remove mark
    let line = substitute(line, '["\#]\?\(\*\)\?\(--\)\?\s*{{'.'{\s*', '', 'g')
    let line = substitute(line, '^["\#]\?\(\*\)\?\(--\)\?', '', 'g')
    " may sure line not too long
    let line = strpart(line, 0, windowwidth - 8 - len(foldedlinecount))
    let showline = " " . line

    let nucolwidth = &foldcolumn + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let fillcharcount = windowwidth - strdisplaywidth(showline) - len(foldedlinecount) -3
    return showline . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction "}}}
set foldtext=MyFoldText()
]]

-- Highlight 81 column
cmd [[ call matchadd('ColorColumn', '\%81v', 100) ]]
-- Show extra space
cmd [[ call matchadd('ColorColumn', '\s$', 100) ]]
