return {
  'luck07051/uicolors.nvim',

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
      { 'ga', '<Plug>(EasyAlign)', mode = { 'n', 'x' }, desc = 'Aligning stuff' }
    }
  },

  { -- Auto figure out what indent used in file
    'nmac427/guess-indent.nvim',
    event = "BufReadPre",
    config = true
  },

  { -- Enhanced gx
    'stsewd/gx-extended.vim',
    keys = {
      { 'gx', desc = 'Enhanced gx' },
    },
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

  { -- Show undo tree
    'jiaoshijie/undotree',
    keys = {
      { '<Leader>u', function() require('undotree').toggle() end, desc = 'Open the undotree' }
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
  },

  { -- Profiling startup time
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  },

  -- {
  --   'danymat/neogen',
  --   config = true,
  -- },
  --
  -- {
  --   'ckolkey/ts-node-action',
  --   keys = {
  --     { 'K' , function() require("ts-node-action").node_action() end, desc = 'Trigger Node Action' },
  --   },
  --   config = true,
  -- },

}
