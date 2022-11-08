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
