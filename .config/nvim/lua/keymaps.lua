local function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    --vim.keymap.set(mode, lhs, rhs, options)
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local silent = { noremap = true, silent = true }


-- Make space as leader key --
keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Resource config --
keymap('n', '<F5>', ':w<CR>:source %<CR>:nohlsearch<CR>', silent)


-- Change default key behavior --
keymap('', 'Y', 'y$')
keymap('', '~', 'g~')
-- No Ex mode
keymap('', 'Q', 'qq')
-- Swap ; and :
keymap('', ';', ':')
keymap('', ':', ';')
-- Change method not change register
keymap('', 'c', '"_c')
keymap('', 'C', '"_C')

-- Delete with black hole --
keymap('', '<Leader>d', '"_d')
keymap('', '<Leader>D', '"_D')
-- Copy paste from system clipboard --
keymap('', '<Leader>y', '"+y')
keymap('', '<Leader>Y', '"+y$')
keymap('', '<Leader>p', '"+p')
keymap('', '<Leader>P', '"+P')
-- Copy all file to clipboard --
keymap('', '<Leader><Leader>y', 'gg"+yG\'\'')
-- Paste in visual mode but not change register --
keymap('v', 'p', '"_dP')
keymap('v', 'gp', '"_d"+P')

-- Cancel search highlight --
keymap('n', '<Leader>nh', ':nohlsearch<CR>', silent)

-- Split windows --
keymap('n', '<Leader>v', ':vsplit<CR>', silent)
keymap('n', '<Leader>x', ':split<CR>', silent)

-- Navigation windows --
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')
