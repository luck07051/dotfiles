-- Color picker and color highlight --
local M = {
  'uga-rosa/ccc.nvim',
  event = 'VeryLazy',
}

M.keys = {
  { '<Leader>cc', ':CccPick<CR>',              desc = 'Open the color picker' },
  { '<A-c>', '<Plug>(ccc-insert)', mode = 'i', desc = 'Insert the color code in insert mode' }
}

M.opts = {
  highlighter = {
    auto_enable = true,
    filetypes = {},
    excludes = {},
  },
}

return M
