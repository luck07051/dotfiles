local M = {
  'akinsho/toggleterm.nvim',
}

M.keys = {
  { '<C-t>', desc = 'Toggle terminal' },
  { '<Leader>th', '<cmd>ToggleTerm size=15 direction=horizontal<cr>', desc = 'Open terminal in a horizontal window' },
  { '<Leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Open terminal in a floating window' },
  { '<Leader>te', '<cmd>TermExec cmd="!!"<cr>', desc = 'Exec previous command' },
  { '<Leader>git', '<cmd>lua _lazygit_toggle()<cr>', desc = 'Open lazygit in a floating window' },
}

M.config = function()
  require('toggleterm').setup({
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

  local Terminal  = require('toggleterm.terminal').Terminal

  -- LazyGit
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
  })
  function _lazygit_toggle() lazygit:toggle() end
end

return M
