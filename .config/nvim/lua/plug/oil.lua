local M = { -- File explorer
  'stevearc/oil.nvim',
  event = "Syntax",
}

M.config = function()
  require('oil').setup({
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
  })
end

M.keys = {
  { '<Leader>fi', function() require('oil').open() end },
  { '<Leader>fo', function() require('oil').open_float() end },
}

return M
