-- local dbct = require 'dashboard'.custom_center
--
-- -- Setting keybind
-- local opt = { noremap = true, buffer = 0, silent = true, nowait = true }
-- for _, item in pairs( dbct ) do
--   vim.keymap.set('n', item.shortcut:gsub('%s+', ''), ':'.. item.action ..'<CR>', opt)
-- end
--
-- Hide buttomleft stuff
vim.opt_local.ruler = false
