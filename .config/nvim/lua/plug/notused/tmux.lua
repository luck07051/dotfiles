return function()
  require("tmux").setup({
    copy_sync = {
      enable = true,
    },
    navigation = {
      enable_default_keybindings = false,
      cycle_navigation = false,
    },
    resize = {
      enable_default_keybindings = false,
      resize_step_x = 4,
      resize_step_y = 2,
    }
  })

  local map = function(key, dir)
    Keymap('n', '<A-'..key..'>', '<cmd>lua require("tmux").move_'..dir..'()<cr>')
    Keymap('i', '<A-'..key..'>', '<C-\\><C-N><cmd>lua require("tmux").move_'..dir..'()<cr>')
    Keymap('t', '<A-'..key..'>', '<C-\\><C-N><cmd>lua require("tmux").move_'..dir..'()<cr>')
    key = string.upper(key)
    Keymap('n', '<A-'..key..'>', '3<cmd>lua require("tmux").resize_'..dir..'()<cr>')
    Keymap('i', '<A-'..key..'>', '<C-\\><C-N>3<cmd>lua require("tmux").resize_'..dir..'()<cr>gi')
    Keymap('t', '<A-'..key..'>', '<C-\\><C-N>3<cmd>lua require("tmux").resize_'..dir..'()<cr>gi')
  end

  map('h', 'left')
  map('j', 'bottom')
  map('k', 'top')
  map('l', 'right')

end
