local M = {
  'Pocco81/true-zen.nvim',
  cmd = {
    'TZNarrow',
    'TZFocus',
    'TZMinimalist',
    'TZAtaraxis',
    'Twilight',
  },
  dependencies = {
    'folke/twilight.nvim',
  },
}

M.config = function()

  local fix_cursorline = function()
    vim.opt_local.cursorline = true
  end

  require('true-zen').setup {
    modes = {
      ataraxis = {
        callbacks = { -- run functions when opening/closing Ataraxis mode
          close_pos = fix_cursorline
        },
      },
      narrow = {
        folds_style = "invisible",
        callbacks = { -- run functions when opening/closing Narrow mode
          close_pos = fix_cursorline
        },
      },
    },

    integrations = {
      -- tmux = false,
      -- twilight = true,
      lualine = true
    },
  }

  require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  -- fix ataraxis mode use '^' fillchars in statusbar
  vim.cmd [[ hi StatusLine ctermfg=1 ]]

end

M.init = function()
  -- Narrow a text region for better focus
  vim.keymap.set("n", "<leader>zn", ":TZNarrow<CR>", { silent = true } )
  vim.keymap.set("v", "<leader>zn", ":'<,'>TZNarrow<CR>", { silent = true } )
  -- Focus on current window
  vim.keymap.set("n", "<leader>zf", ":TZFocus<CR>", { silent = true } )
  -- Disable ui components
  vim.keymap.set("n", "<leader>zm", ":TZMinimalist<CR>", { silent = true } )
  -- Classic zen mode
  vim.keymap.set("n", "<leader>za", ":TZAtaraxis<CR>", { silent = true } )
  -- Toggle twilight
  vim.keymap.set("n", "<leader>zt", ":Twilight<CR>", { silent = true } )
end

return M
