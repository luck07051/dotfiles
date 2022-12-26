local M = {
  'karb94/neoscroll.nvim',
  keys = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
  config = true,
}

M.config = function()
  require('neoscroll').setup({})
  local t = {}
  t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '130'}}
  t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '130'}}
  t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '250'}}
  t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '250'}}
  t['<C-y>'] = {'scroll', {'-0.10', 'false', '50'}}
  t['<C-e>'] = {'scroll', { '0.10', 'false', '50'}}
  t['zt']    = {'zt', {'100'}}
  t['zz']    = {'zz', {'100'}}
  t['zb']    = {'zb', {'100'}}
  require('neoscroll.config').set_mappings(t)
end

return M
