function _G.Keymap(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end
Silent = { noremap = true, silent = true }


-- Make space as leader key --
Keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Resource config --
Keymap('n', '<F5>', ':w<CR>:source %<CR>:nohlsearch<CR>', Silent)


-- Change default key behavior --
Keymap('', 'Y', 'y$')
Keymap('', '~', 'g~')
-- No Ex mode
Keymap('', 'Q', 'qq')
-- Swap ; and :
Keymap('', ';', ':')
Keymap('', ':', ';')
-- Change method not change register
Keymap('', 'c', '"_c')
Keymap('', 'C', '"_C')

-- Delete with black hole --
Keymap('', '<Leader>d', '"_d')
Keymap('', '<Leader>D', '"_D')
-- Copy paste from system clipboard --
Keymap('', '<Leader>y', '"+y')
Keymap('', '<Leader>Y', '"+y$')
Keymap('', '<Leader>p', '"+p')
Keymap('', '<Leader>P', '"+P')
-- Paste in visual mode but not change register --
Keymap('v', 'p', '"_dP')
Keymap('v', 'gp', '"_d"+P')

-- Copy all file to clipboard --
Keymap('', '<Leader><Leader>y', 'gg"+yG\'\'')

-- Cancel search highlight --
Keymap('n', '<Leader>nh', ':nohlsearch<CR>', Silent)

-- Split windows --
--Keymap('n', '<Leader>v', ':vsplit<CR>', Silent)
--Keymap('n', '<Leader>x', ':split<CR>', Silent)

-- Navigation windows --
Keymap('n', '<C-h>', '<C-w>h')
Keymap('n', '<C-j>', '<C-w>j')
Keymap('n', '<C-k>', '<C-w>k')
Keymap('n', '<C-l>', '<C-w>l')

-- Switch conceal --
Keymap("n", "<Leader>c", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, Silent)
