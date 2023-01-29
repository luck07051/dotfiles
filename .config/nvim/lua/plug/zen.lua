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

M.keys = {
  { '<leader>zn', ':TZNarrow<cr>',                  silent = true, desc = 'Narrow a text region for better focus' },
  { '<leader>zn', ":'<,'>TZNarrow<cr>", mode = 'v', silent = true, desc = 'Narrow a text region for better focus' },
  { '<leader>zf', ':TZFocus<cr>',                   silent = true, desc = 'Focus on current window' },
  { '<leader>zm', ':TZMinimalist<cr>',              silent = true, desc = 'Disable ui components' },
  { '<leader>za', ':TZAtaraxis<cr>',                silent = true, desc = 'Classic zen mode' },
  { '<leader>zt', ':Twilight<cr>',                  silent = true, desc = 'Toggle twilight' },
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

return M
