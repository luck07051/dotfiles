local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

-- Not auto comment --
autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- When save file, delete trailing spaces and extra line {{{
local DeleteExtraSpaces = function()
    cmd [[ let b:nline= line('.') ]]
    cmd [[ %s/\s\+$//e ]]
    cmd [[ %s/\n\+\%$//e ]]
    cmd [[ execute "to ".b:nline ]]
end
autocmd('BufWrite', { pattern = '*', callback = DeleteExtraSpaces })
--}}}

-- Change Fold Text --{{{
cmd [[
function! MyFoldText()
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
endfunction
set foldtext=MyFoldText()
]]
--}}}


-- Highlight 81 column
vim.fn.matchadd('ColorColumn', '\\%81v', 100)
-- Show extra space
vim.fn.matchadd('ColorColumn', '\\s$', 100)


-- TEX --
-- Fix filetype --
autocmd({ 'BufRead', 'BufNewFile' },
    { pattern = '*.tex', command = [[ set filetype=tex ]] })
-- Auto clear nonessential files when leave tex file --
autocmd('VimLeave',
    { pattern = '*.tex', command = [[ !latexmk -c % ]] })
-- Disable treesitter for conceal
autocmd({ 'BufRead', 'BufNewFile' },
    { pattern = '*.tex', command = [[ TSBufDisable highlight ]] })



autocmd({ 'BufRead', 'BufNewFile' },
    { pattern = '*.config', command = [[ set filetype=dosini ]] })
