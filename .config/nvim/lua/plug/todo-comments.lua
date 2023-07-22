return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  keys = {
    { '<Leader>xt', '<cmd>TodoTrouble<cr>', desc = 'List all project todos in trouble'},
  },
  opts = {},
}
