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


  Keymap('n', '<A-h>', '<cmd>lua require("tmux").move_left()<cr>')
  Keymap('n', '<A-j>', '<cmd>lua require("tmux").move_bottom()<cr>')
  Keymap('n', '<A-k>', '<cmd>lua require("tmux").move_top()<cr>')
  Keymap('n', '<A-l>', '<cmd>lua require("tmux").move_right()<cr>')
  Keymap('i', '<A-h>', '<C-\\><C-N><cmd>lua require("tmux").move_left()<cr>')
  Keymap('i', '<A-j>', '<C-\\><C-N><cmd>lua require("tmux").move_bottom()<cr>')
  Keymap('i', '<A-k>', '<C-\\><C-N><cmd>lua require("tmux").move_top()<cr>')
  Keymap('i', '<A-l>', '<C-\\><C-N><cmd>lua require("tmux").move_right()<cr>')
  Keymap('t', '<A-h>', '<C-\\><C-N><cmd>lua require("tmux").move_left()<cr>')
  Keymap('t', '<A-j>', '<C-\\><C-N><cmd>lua require("tmux").move_bottom()<cr>')
  Keymap('t', '<A-k>', '<C-\\><C-N><cmd>lua require("tmux").move_top()<cr>')
  Keymap('t', '<A-l>', '<C-\\><C-N><cmd>lua require("tmux").move_right()<cr>')

  -- Resize windows --
  Keymap('n', '<A-H>', '3<cmd>lua require("tmux").resize_left()<cr>')
  Keymap('n', '<A-J>', '3<cmd>lua require("tmux").resize_bottom()<cr>')
  Keymap('n', '<A-K>', '3<cmd>lua require("tmux").resize_top()<cr>')
  Keymap('n', '<A-L>', '3<cmd>lua require("tmux").resize_right()<cr>')
  Keymap('i', '<A-H>', '<C-\\><C-N><cmd>lua require("tmux").resize_left()<cr>gi')
  Keymap('i', '<A-J>', '<C-\\><C-N><cmd>lua require("tmux").resize_bottom()<cr>gi')
  Keymap('i', '<A-K>', '<C-\\><C-N><cmd>lua require("tmux").resize_top()<cr>gi')
  Keymap('i', '<A-L>', '<C-\\><C-N><cmd>lua require("tmux").resize_right()<cr>gi')
  Keymap('t', '<A-H>', '<C-\\><C-N><cmd>lua require("tmux").resize_left()<cr>gi')
  Keymap('t', '<A-J>', '<C-\\><C-N><cmd>lua require("tmux").resize_bottom()<cr>i')
  Keymap('t', '<A-K>', '<C-\\><C-N><cmd>lua require("tmux").resize_top()<cr>i')
  Keymap('t', '<A-L>', '<C-\\><C-N><cmd>lua require("tmux").resize_right()<cr>i')
end
