local autocmd = vim.api.nvim_create_autocmd

-- Not auto comment --
autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- When save file, delete trailing spaces and extra line
local DeleteExtraSpaces = function()
  vim.cmd [[
    let b:nline= line('.')
    %s/\s\+$//e
    %s/\n\+\%$//e
    execute "to ".b:nline
  ]]
end
autocmd('BufWrite', { callback = DeleteExtraSpaces })

-- Auto clear nonessential files when leave Tex file --
autocmd('VimLeave', { pattern = '*.tex', command = [[ !latexmk -c % ]] })

-- Auto in insert mode at terminal --
autocmd('TermOpen', { command = 'startinsert' })

-- No relativenumber in insert mode --
autocmd('InsertEnter', { command = 'set norelativenumber' })
autocmd('InsertLeave', { command = 'set relativenumber' })
