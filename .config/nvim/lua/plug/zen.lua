return function()

  require('true-zen').setup {
    integrations = {
      -- tmux = false,
      twilight = true,
      lualine = true
    },
  }

  require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  -- Narrow a text region for better focus
  Keymap("n", "<leader>zn", ":TZNarrow<CR>", Silent)
  Keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", Silent)
  -- Focus on current window
  Keymap("n", "<leader>zf", ":TZFocus<CR>", Silent)
  -- Disable ui components
  Keymap("n", "<leader>zm", ":TZMinimalist<CR>", Silent)
  -- Classic zen mode
  Keymap("n", "<leader>za", ":TZAtaraxis<CR>", Silent)
  -- Toggle twilight
  Keymap("n", "<leader>zt", ":Twilight<CR>", Silent)

end
