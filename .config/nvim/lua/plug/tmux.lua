return function()
  require("tmux").setup({
    copy_sync = {
      enable = true,
    },
    navigation = {
      cycle_navigation = false,
      enable_default_keybindings = true,
    },
    resize = {
      enable_default_keybindings = true,
      resize_step_x = 4,
      resize_step_y = 2,
    }
  })
end
