local M = {
  'nvim-treesitter/nvim-treesitter',
  event = "BufReadPost",
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
    -- 'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
    -- 'ray-x/cmp-treesitter',
  },
}

M.config = function()
  local treesitter = require "nvim-treesitter.configs"

  treesitter.setup {
    ensure_installed = 'all',
    ignore_install = { '' },

    highlight = {
      enable = true,
      disable = { "help" },
    },

    indent = {
      enable = true,
      disable = { 'yaml' }
    },

    playground = {
      enable = true,
    },

    query_linter = {
      enable = true,
      -- use_virtual_text = true,
      -- lint_events = { "BufWrite", "CursorHold" },
    },


    autopairs = {
      enable = false
    },

    endwise = {
        enable = true,
    },

    autotag = {
      enable = true,
      filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "markdown" },
    },
  }

  Keymap('n', '<Leader>tp', ':TSPlaygroundToggle<CR>', Silent)
  Keymap('n', '<Leader>ts', ':TSCaptureUnderCursor<CR>', Silent)

end

return M
