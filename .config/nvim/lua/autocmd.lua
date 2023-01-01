-------------------------------
--          AUTOCMD          --
-------------------------------

local au = vim.api.nvim_create_autocmd

-- Disable auto comment new line
au('BufEnter', { command = [[ set formatoptions-=cro ]] })

-- Delete trailing spaces and extra line when save file
local DeleteExtraSpaces = function() --{{{
  vim.cmd [[
    let b:nline= line('.')
    %s/\s\+$//e
    %s/\n\+\%$//e
    execute "to ".b:nline
  ]]
end --}}}
au('BufWrite', { callback = DeleteExtraSpaces })

-- Setting for terminal mode
au('TermOpen', { command = 'setlocal nonumber signcolumn=no' })
-- autocmd('TermOpen', { command = 'startinsert' })

-- Cursorline on focused window
au('WinEnter', { command = 'setlocal cursorline' })
au('WinLeave', { command = 'setlocal nocursorline' })


-- Use marker foldding in nvim config file
au('BufEnter', {
  pattern = { '*/nvim/*' },
  command = [[
     set foldmethod=marker
     set foldlevel=0
  ]]
})


-- Indent --
au('BufEnter', {
  pattern = { '*/linux/*', '*/suckless/*' },
  command = [[ setlocal noet sw=8 ts=8 sts=8 ]]
})
