-------------------------------
--          AUTOCMD          --
-------------------------------

-- Disable auto comment new line
Au('BufEnter', { command = [[ set formatoptions-=cro ]] })

-- Delete trailing spaces and extra line when save file
local DeleteExtraSpaces = function() --{{{
  vim.cmd [[
    let b:nline= line('.')
    %s/\s\+$//e
    %s/\n\+\%$//e
    execute "to ".b:nline
  ]]
end --}}}
Au('BufWrite', { callback = DeleteExtraSpaces })

-- Setting for terminal mode
Au('TermOpen', { command = 'setlocal nonumber signcolumn=no' })
-- autocmd('TermOpen', { command = 'startinsert' })

-- Cursorline on focused window
Au('WinEnter', { command = 'setlocal cursorline' })
Au('WinLeave', { command = 'setlocal nocursorline' })


-- Use marker foldding in nvim config file
Au('BufEnter', {
  pattern = { '*/nvim/*' },
  command = [[
     set foldmethod=marker
     set foldlevel=0
  ]]
})


-- Indent --

-- Use 4-width indent depand on filetype
Au('FileType', {
  pattern = { 'c', 'h', 'cpp' },
  command = [[ setlocal sw=4 ts=4 sts=4 ]]
})

-- Use 4-width indent
Au('BufEnter', {
  pattern = { '*/yt-local/*', '*/youtube-local/*' },
  command = [[ setlocal sw=4 ts=4 sts=4 ]]
})

-- Use 8-width tab indent
Au('BufEnter', {
  pattern = { '*/linux/*', '*/suckless/*' },
  command = [[
    setlocal noexpandtab
    setlocal sw=8 ts=8 sts=8
  ]]
})
