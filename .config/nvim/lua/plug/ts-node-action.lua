return {
  'ckolkey/ts-node-action',
  dependencies = { 'nvim-treesitter', 'tpope/vim-repeat' },
  keys = {
    { 'k', function() require('ts-node-action').node_action() end, desc = 'Trigger Node Action' }
  },
  opts = {}
}
