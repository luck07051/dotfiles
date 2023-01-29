local M = {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
}

M.keys = {
  { '<Leader>xt', '<cmd>TodoTrouble<cr>', desc = 'List all project todos in trouble'},
}

M.opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

return M
