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

-- Setting for terminal mode --
autocmd('TermOpen', { command = 'normal! G' })
autocmd('TermOpen', { command = 'startinsert' })
autocmd('TermOpen', { command = 'set nonumber' })
autocmd('TermEnter', { command = 'set nocursorline' })


-- No relativenumber in insert mode --
-- autocmd('InsertEnter', { command = 'set norelativenumber' })
-- autocmd('InsertLeave', { command = 'set relativenumber' })

-- Only focus window have cursorline --
autocmd('WinEnter', { command = 'set cursorline' })
autocmd('WinLeave', { command = 'set nocursorline' })
