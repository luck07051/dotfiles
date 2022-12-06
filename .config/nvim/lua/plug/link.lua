return function()
  require("link-visitor").setup({ })

  Keymap('n', '<Leader>fl', ':VisitLinkInBuffer<CR>', Silent)

end
