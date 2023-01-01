local M = {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
}

M.config = function()
  local toggleterm = require 'toggleterm'

  toggleterm.setup({
    size = 20,
    open_mapping = [[<c-t>]],
    direction = "float",
    highlights = {
      Normal = {
        link = "Normal",
      },
      NormalFloat = {
        link = 'NormalFloat'
      },
      FloatBorder = {
        link = "FloatBorder",
      },
    },
  })

  vim.keymap.set('n', '<Leader>th', ':ToggleTerm size=15 direction=horizontal<CR>', { silent = true } )
  vim.keymap.set('n', '<Leader>tf', ':ToggleTerm direction=float<CR>', { silent = true } )
  vim.keymap.set('n', '<Leader>te', ':TermExec cmd="!!"<CR>', { silent = true } )


  local Terminal  = require('toggleterm.terminal').Terminal

  -- LazyGit
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
  })
  function _lazygit_toggle() lazygit:toggle() end

  vim.keymap.set('n', '<Leader>git', ':lua _lazygit_toggle()<CR>', { silent = true } )
end

return M
