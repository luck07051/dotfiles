-- Setup global keymap short hand --
Keymap = vim.keymap.set     -- This have default noremap = true
Silent = { noremap = true, silent = true }


-- Make space as leader key --
Keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Resource config --
Keymap('n', '<F5>', ':source %<CR>:nohlsearch<CR>', Silent)

-- Change default key behavior --
Keymap('', 'Y', 'y$')
-- Swap ; and :
Keymap('', ';', ':')
Keymap('', ':', ';')
Keymap('n', 'q;', 'q:')
-- Change method do not change register
Keymap('', 'c', '"_c')
Keymap('', 'C', '"_C')

-- Delete with black hole --
Keymap('', '<Leader>d', '"_d')
Keymap('', '<Leader>D', '"_D')
-- Copy paste with system clipboard --
Keymap('', '<Leader>y', '"+y')
Keymap('', '<Leader>Y', '"+y$')
Keymap('', '<Leader>p', '"+p')
Keymap('', '<Leader>P', '"+P')
-- Paste in visual mode but not change register --
Keymap('v', 'p', '"_dP')
Keymap('v', 'gp', '"_d"+P')

-- Wizard --
Keymap('n', 'R', '!!$SHELL<CR>')
Keymap('v', 'R', '!$SHELL<CR>')

-- Copy all file to clipboard --
Keymap('', '<Leader><Leader>y', 'gg"+yG\'\'')

-- Cancel search highlight --
Keymap('n', '<Leader>nh', ':nohlsearch<CR>', Silent)

-- Terminal --
Keymap('n', '<Leader>t', ':15%sp term://$SHELL<CR>', Silent)
Keymap('t', '<C-[>', '<C-\\><C-n>', Silent)
Keymap('t', '<C-w>', '<C-\\><C-n><C-w>', Silent)
Keymap('t', '<CR>', '<CR><C-\\><C-n>', Silent)


-- Split windows --
--Keymap('n', '<Leader>s', ':split<CR>', Silent)
--Keymap('n', '<Leader>v', ':vsplit<CR>', Silent)

-- Navigation windows --
-- Keymap('n', '<C-h>', '<C-w>h')
-- Keymap('n', '<C-j>', '<C-w>j')
-- Keymap('n', '<C-k>', '<C-w>k')
-- Keymap('n', '<C-l>', '<C-w>l')

-- Switch conceal --
Keymap("n", "<Leader>c", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, Silent)


Keymap('n', '<Leader>v', '<C-W><C-J>a<Up><CR><C-\\><C-N><C-w><C-K>', Silent)
