-- Speed up startup time
pcall(require, 'impatient')


-- Global Shorthand --
Opt    = vim.opt
Au     = vim.api.nvim_create_autocmd
Keymap = vim.keymap.set
Silent = { silent = true }


require 'options'
require 'keymaps'
require 'plugins'
require 'autocmd'

vim.cmd.colorscheme('uicolors')
