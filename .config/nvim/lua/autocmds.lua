
local autocmd = vim.api.nvim_create_autocmd

-- Dont auto comment next line --
autocmd( "BufEnter", { command = [[set formatoptions-=cro]] } )

-- When save file, delete trailing spaces and extra line at and -- {{{
local DeleteExtraSpaces = function()
    vim.cmd [[ let b:nline= line('.') ]]
    vim.cmd [[ %s/\s\+$//e ]]
    vim.cmd [[ %s/\n\+\%$//e ]]
    vim.cmd [[ execute "to ".b:nline ]]
end
autocmd( "BufWrite", { pattern = "*", callback = DeleteExtraSpaces } ) --}}}


-- Auto clear nonessential files when leave tex file --
autocmd( "VimLeave", { pattern = "*.tex", command = [[!latexmk -c %]] } )
-- Fix filetype --
autocmd( {"BufRead", "BufNewFile"},
    { pattern = "*.tex", command = [[ set filetype=tex ]] } )
