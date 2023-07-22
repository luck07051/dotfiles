return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    use_default_keymaps = false,
  },

  keys = {
    { '<space>tm', function() require('treesj').toggle() end, desc = 'toggle node under cursor' },
    { '<space>ts', function() require('treesj').split()  end, desc = 'split node under cursor' },
    { '<space>tj', function() require('treesj').join()   end, desc = 'join node under cursor' },
  },
}
