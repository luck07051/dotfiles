local M = {
  'nvim-treesitter/nvim-treesitter',
  event = "BufReadPost",
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground',
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
    -- 'ray-x/cmp-treesitter',
  },
}

M.keys = {
  { '<Leader>tp', '<cmd>TSPlaygroundToggle<cr>',   desc = 'View treesitter information' },
  { '<Leader>ts', '<cmd>TSCaptureUnderCursor<cr>', desc = 'View treesitter under the cursor' },
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
end

return M
