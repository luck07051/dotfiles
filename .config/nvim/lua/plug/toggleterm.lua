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

  Keymap('n', '<Leader>th', ':ToggleTerm size=15 direction=horizontal<CR>', Silent)
  Keymap('n', '<Leader>tf', ':ToggleTerm direction=float<CR>', Silent)
  Keymap('n', '<Leader>te', ':TermExec cmd="!!"<CR>', Silent)


  local Terminal  = require('toggleterm.terminal').Terminal

  -- LazyGit
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
  })
  function _lazygit_toggle() lazygit:toggle() end

  Keymap('n', '<Leader>git', ':lua _lazygit_toggle()<CR>', Silent)
end

return M
