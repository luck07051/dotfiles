-------------------------------
--          AUTOCMD          --
-------------------------------

-- Disable auto comment new lin
Au('BufEnter', { command = [[ set formatoptions-=cro ]] })

-- Specify indent width by filetype
Au('FileType',
  { pattern = { 'c', 'h', 'cpp' },
    command = [[ setlocal sw=4 ts=4 sts=4 ]] })

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

-- Update xresource when write the xresource file
Au('BufWritePost',
  { pattern = { 'xresources', '.Xresources' },
    command = [[ !xrdb -merge %; $XDG_CONFIG_HOME/X11/sync_xrdb ]] })

--Au('BufWritePost',
--  { pattern = { '*newsboat/urls' },
--    command = [[ !%:p:h/syncrss ]] })


-- 4 width indent for yt-local
Au('BufEnter',
  { pattern = { '*/yt-local/*', '*/youtube-local/*' },
    command = [[ setlocal sw=4 ts=4 sts=4 ]] })
