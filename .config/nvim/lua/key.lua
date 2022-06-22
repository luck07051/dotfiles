
-- ==================== KEY ==================== --

local keymap = vim.api.nvim_set_keymap
local nore = { noremap = true }
local silent = { noremap = true, silent = true }


-- Make space as leader key --
keymap("", "<Space>", "<Nop>", nore)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<F5>", ":source %<CR>:nohlsearch<CR>", silent)

-- Change default key behavior --
keymap("", "Y", "y$", nore)
keymap("", "~", "g~", nore)
keymap("", ";", ":", nore)
keymap("", ":", ";", nore)
keymap("", "Q", "qq", nore)
keymap("", "c", "\"_c", nore)
keymap("", "C", "\"_C", nore)
-- Delete with black hole --
keymap("", "<Leader>d", "\"_d", nore)
keymap("", "<Leader>D", "\"_D", nore)
-- Copy paste from system clipboard --
keymap("", "cy", "\"+y", nore)
keymap("", "cY", "\"+y$", nore)
keymap("", "cp", "\"+p", nore)
keymap("", "cP", "\"+P", nore)

-- Cancel search highlight --
keymap("n", "<Leader>nh", ":nohlsearch<CR>", silent)

-- Navigation windows --
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)
keymap("n", "<C-l>", "<C-w>l", silent)
