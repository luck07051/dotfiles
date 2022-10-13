local dbct = require 'dashboard'.custom_center

-- Setting keybind
local opt = { noremap = true, buffer = 0, silent = true, nowait = true }
for _, item in pairs( dbct ) do
  vim.keymap.set('n', item.shortcut:gsub('%s+', ''), ':'.. item.action ..'<CR>', opt)
end

-- Hide buttomleft stuff
vim.opt_local.ruler = false

-- Disable ColorColumn locally
local user_hl_colorcolumn = vim.api.nvim_get_hl_by_name('ColorColumn', '')
vim.api.nvim_set_hl(0, 'ColorColumn', {})
Au('BufLeave',
  { once = true,
    callback = function()
      if vim.o.filetype == 'dashboard' then
        vim.api.nvim_set_hl(0, 'ColorColumn', user_hl_colorcolumn)
      end
    end })
