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
Keymap('', 'Y', 'y$')  -- not needed for neovim, but...
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
-- (y/p to + (or *) register)
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

-- Keymap('n', '', ':w !sudo tee %<CR>')

-- Copy all file to clipboard --
Keymap('', '<Leader><Leader>y', 'gg"+yG\'\'')

-- Cancel search highlight --
Keymap('n', '<Leader>nh', ':nohlsearch<CR>', Silent)

-- Terminal --
Keymap('t', '<C-[>', '<C-\\><C-n>', Silent)
Keymap('t', '<C-w>', '<C-\\><C-n><C-w>', Silent)
Keymap('t', '<CR>', '<CR><C-\\><C-n>', Silent)

Keymap('n', '<Leader>t', ':belowright 15%sp term://$SHELL<CR>', Silent)
Keymap('n', '<Leader>v', '<C-W><C-J>a<Up><CR><C-\\><C-N>G<C-w><C-K>', Silent)


Keymap('t', '<C-R>', [[<C-\><C-N>" nr2char(getchar()) pi]], {expr=true, silent=true})

-- Navigation windows --
Keymap('n', '<A-h>', '<C-w>h')
Keymap('n', '<A-j>', '<C-w>j')
Keymap('n', '<A-k>', '<C-w>k')
Keymap('n', '<A-l>', '<C-w>l')
Keymap('i', '<A-h>', '<C-\\><C-N><C-w>h')
Keymap('i', '<A-j>', '<C-\\><C-N><C-w>j')
Keymap('i', '<A-k>', '<C-\\><C-N><C-w>k')
Keymap('i', '<A-l>', '<C-\\><C-N><C-w>l')
Keymap('t', '<A-h>', '<C-\\><C-N><C-w>h')
Keymap('t', '<A-j>', '<C-\\><C-N><C-w>j')
Keymap('t', '<A-k>', '<C-\\><C-N><C-w>k')
Keymap('t', '<A-l>', '<C-\\><C-N><C-w>l')
Keymap('n', '<A-J>', '3<C-w>+')
Keymap('n', '<A-K>', '3<C-w>-')

-- Switch conceal --
Keymap("n", "<Leader>c", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, Silent)
