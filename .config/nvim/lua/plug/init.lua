return {
  {
    'luck07051/uicolors.nvim',
    url = 'git@github.com:luck07051/uicolors.nvim.git',
  },

  { -- `gc` to comment text
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' }, desc = 'Line comment' },
      { 'gb', mode = { 'n', 'v' }, desc = 'Block comment' },
    },
    config = true
  },

  { -- Surround selections
    "kylechui/nvim-surround",
    keys = {
      { 'cs', desc = 'Change the surround' },
      { 'ds', desc = 'Delete the surround' },
      { 'ys', desc = 'Add the surround' },
    },
    config = true
  },

  { -- Align stuff
    'junegunn/vim-easy-align',
    keys = {
      { 'ga', '<Plug>(EasyAlign)', mode = { 'n', 'x' }, desc = 'Aligning stuff' },
    }
  },

  { -- Auto figure out what indent used in file
    'nmac427/guess-indent.nvim',
    event = 'BufReadPost',
    keys = {
      { '<Leader>ind', function() require("guess-indent").set_from_buffer(true) end, desc = 'Reset indent' },
    },
    config = true
  },

  { -- Enhanced gx
    'stsewd/gx-extended.vim',
    keys = {
      { 'gx', desc = 'Enhanced gx' },
    },
  },

  {
    'SmiteshP/nvim-navic',
    event = 'LspAttach',
    opts = {},
  },

  { -- Enhanced quickfix
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  },

  { -- Project management
    'ahmedkhalf/project.nvim',
    event = 'BufReadPre',
    config = function()
      require("project_nvim").setup()
    end,
  },

  { -- Profiling startup time
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  },

}
