return function()
  local treesitter = require "nvim-treesitter.configs"

  treesitter.setup {
    ensure_installed = 'all',
    ignore_install = { '' },
    highlight = {
      enable = true,
      disable = { '' },
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { 'yaml' }
    },
    playground = {
      enable = true,
    },
    query_linter = {
      enable = true,
    },
  }


  Keymap('n', '<Leader><Leader>tp', ':TSPlaygroundToggle<CR>', Silent)
  Keymap('n', '<Leader><Leader>tc', ':TSCaptureUnderCursor<CR>', Silent)
end
