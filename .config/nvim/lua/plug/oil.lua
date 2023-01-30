local M = { -- File explorer
  'stevearc/oil.nvim',
  event = "Syntax",
}

M.keys = {
  { '<Leader>fi', function() require('oil').open() end,       desc = 'Open oil browser for a directory'},
  { '<Leader>fo', function() require('oil').open_float() end, desc = 'Open oil browser in a floating window'},
}

M.opts = {
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true
  },
  win_options = {
    conceallevel = 0
  },
  keymaps = {
    ["<BS>"] = "actions.parent",
  },
  float = {
    win_options = {
      winblend = 0,
    },
  }
}

return M