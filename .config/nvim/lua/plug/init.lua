return {
  'luck07051/uicolors.nvim',

  { -- File explorer
    'stevearc/oil.nvim',
    event = "Syntax",
    config = function() require('oil').setup({
      view_options = { show_hidden = true },
      win_options = { conceallevel = 0 },
      keymaps = {
        ["<BS>"] = "actions.parent",
      },
      float = {
        win_options = {
          winblend = 0,
        },
      }
    }) end
  },

  { -- `gc` to comment text
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' } },
      { 'gb', mode = { 'n', 'v' } },
    },
    config = true
  },

  { -- Surround selections
    "kylechui/nvim-surround",
    keys = { 'cs', 'ds', 'ys' },
    config = true
  },

  { -- Align stuff
    'junegunn/vim-easy-align',
    keys = { { 'ga', '<Plug>(EasyAlign)', mode = { 'n', 'x' } } }
  },

  { -- Auto figure out what indent used in file
    'nmac427/guess-indent.nvim',
    event = "BufReadPre",
    config = true
  },

  { -- Enhanced gx
    'stsewd/gx-extended.vim',
    keys = { 'gx' },
  },

  { -- Enhanced quickfix
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  },

  { -- Color picker and color highlight
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    keys = {
      { '<Leader>cc', ':CccPick<CR>' },
      { '<A-c>', '<Plug>(ccc-insert)' }
    },
    config = function()
      require('ccc').setup({
        highlighter = {
          auto_enable = true,
          filetypes = {},
          excludes = {},
        },
      })
    end
  },

  { -- Project management
    'ahmedkhalf/project.nvim',
    event = 'BufReadPre',
    config = function()
      require("project_nvim").setup()
    end,
  },

  { -- Show undo tree
    'jiaoshijie/undotree',
    keys = {
      { '<Leader>u', function() require('undotree').toggle() end }
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
  },

  { -- Profiling startup time
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  },

}
