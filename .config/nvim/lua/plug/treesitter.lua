local M = {
  'nvim-treesitter/nvim-treesitter',
  event = "BufReadPost",
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground',
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
    'HiPhish/nvim-ts-rainbow2',
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


    -- rainbow = {
    --   enable = true,
    --   -- list of languages you want to disable the plugin for
    --   disable = { 'jsx', 'cpp' },
    --   -- Which query to use for finding delimiters
    --   query = 'rainbow-parens',
    --   -- Highlight the entire buffer all at once
    --   strategy = require('ts-rainbow').strategy.global,
    -- },

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
