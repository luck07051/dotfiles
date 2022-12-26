return {
  'luck07051/uicolors.nvim',

  { -- `gc` to comment text --
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' } },
      { 'gb', mode = { 'n', 'v' } },
    },
    config = true
  },

  { -- Surround selections --
    "kylechui/nvim-surround",
    keys = { 'cs', 'ds', 'ys' },
    config = true
  },

  { -- Align stuff --
    'junegunn/vim-easy-align',
    keys = { { 'ga', '<Plug>(EasyAlign)', mode = { 'n', 'x' } } }
  },

  { -- Auto figure out what indent used in file --
    'nmac427/guess-indent.nvim',
    event = "BufReadPre",
    config = true
  },

  {
    'jghauser/follow-md-links.nvim',
    ft = { 'markdown' }
  },

  {
    'jiaoshijie/undotree',
    keys = {
      { '<Leader>u', function() require('undotree').toggle() end }
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
  },

  { -- Color picker and color highlight --
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    config = function()
      require('ccc').setup({
        highlighter = {
          auto_enable = true,
          filetypes = {},
          excludes = {},
        },
      })
      Keymap('n', '<Leader>cc', ':CccPick<CR>')
      Keymap('i', '<A-c>', '<Plug>(ccc-insert)')
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    enabled = false,
    event = 'BufReadPre',
    config = true
  },

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  },
}
