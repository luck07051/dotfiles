local M = {
  'monaqa/dial.nvim',
  keys = {
    { '<C-a>', mode = { 'n', 'v' } },
    { '<C-x>', mode = { 'n', 'v' } },
    { 'g<C-a>', mode = { 'v' } },
    { 'g<C-x>', mode = { 'v' } },
  }
}

M.config = function()
  local augend = require("dial.augend")
  require('dial.config').augends:register_group{
    default = {
      augend.integer.alias.decimal_int,
      augend.integer.alias.hex,
      augend.constant.alias.bool,
      augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
      augend.constant.new{
        elements = { "True", "False" },
        word = false,
        cyclic = true,
      },
      augend.constant.new{
        elements = { "and", "or" },
        word = false,
        cyclic = true,
      },
      augend.constant.new{
        elements = { "||", "&&" },
        word = false,
        cyclic = true,
      },
    },
  }

  vim.keymap.set('n', '<C-a>', require('dial.map').inc_normal())
  vim.keymap.set('n', '<C-x>', require('dial.map').dec_normal())
  vim.keymap.set('v', '<C-a>', require('dial.map').inc_visual())
  vim.keymap.set('v', '<C-x>', require('dial.map').dec_visual())
  vim.keymap.set('v', 'g<C-a>', require('dial.map').inc_gvisual())
  vim.keymap.set('v', 'g<C-x>', require('dial.map').dec_gvisual())
end

return M
