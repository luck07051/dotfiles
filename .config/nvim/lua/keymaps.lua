-- Setup global keymap short hand --
Keymap = vim.keymap.set     -- This have default noremap = true
Silent = { noremap = true, silent = true }

--
-- Keymap('n', '', ':w !sudo tee %<CR>')

-- Make space as leader key --
Keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Change default key behavior --
Keymap('', 'Y', 'y$')  -- didn;t needed for neovim, but...
-- Swap ; and :
Keymap('', ';', ':')
Keymap('', ':', ';')
Keymap('n', 'q;', 'q:')
-- Change method do not change register
Keymap('', 'c', '"_c')
Keymap('', '<C-E>', '3<C-E>')
Keymap('', '<C-Y>', '3<C-Y>')

-- Delete with black hole --
Keymap('', '<Leader>d', '"_d')
Keymap('', '<Leader>D', '"_D')
-- Copy paste with system clipboard --
-- (y/p to + (or *) register)
Keymap('', '<Leader>y', '"+y')
Keymap('', '<Leader>Y', '"+y$')
Keymap('', '<Leader>p', '"+p')
Keymap('', '<Leader>P', '"+P')
-- Copy all file to clipboard --
Keymap('', '<Leader><Leader>y', 'gg"+yG\'\'')
-- Paste in visual mode but not change register --
Keymap('v', 'p', '"_dP')
Keymap('v', 'gp', '"_d"+P')

-- Wizard --
Keymap('n', 'R', '!!$SHELL<CR>')
Keymap('v', 'R', '!$SHELL<CR>')

-- Cancel search highlight --
Keymap('n', '<Leader>nh', ':nohlsearch<CR>', Silent)

-- Spell check --
Keymap('n', '<Leader>s', ':setlocal spell! spelllang=en_us<CR>')

-- Terminal --
Keymap('t', '<C-[>', '<C-\\><C-n>', Silent)
Keymap('t', '<C-w>', '<C-\\><C-n><C-w>', Silent)
-- Keymap('t', '<CR>', '<CR><C-\\><C-n>', Silent)

-- Create a terminal if not have one --
Keymap('n', '<Leader>tt', function() vim.cmd [[
  if !exists("t:terminal_id") || !win_gotoid(t:terminal_id)
    belowright 15%split term://$SHELL
    let t:terminal_id = win_getid()
  endif
]] end, Silent)
-- Goto terminal and exec last command --
Keymap('n', '<Leader>te', function() vim.cmd [[
  let t:cur_win_id = win_getid()
  if exists("t:terminal_id") && win_gotoid(t:terminal_id)
    call win_gotoid(t:terminal_id)
    call feedkeys("a\<Up>\<CR>\<C-\>\<C-N>\<C-W>p")
  endif
]] end, Silent)

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

-- Resize windows --
Keymap('n', '<A-H>', '3<C-w><')
Keymap('n', '<A-J>', '3<C-w>+')
Keymap('n', '<A-K>', '3<C-w>-')
Keymap('n', '<A-L>', '3<C-w>>')
Keymap('i', '<A-H>', '<C-\\><C-N><C-w><gi')
Keymap('i', '<A-J>', '<C-\\><C-N><C-w>+gi')
Keymap('i', '<A-K>', '<C-\\><C-N><C-w>-gi')
Keymap('i', '<A-L>', '<C-\\><C-N><C-w>>gi')
Keymap('t', '<A-H>', '<C-\\><C-N><C-w><gi')
Keymap('t', '<A-J>', '<C-\\><C-N><C-w>+i')
Keymap('t', '<A-K>', '<C-\\><C-N><C-w>-i')
Keymap('t', '<A-L>', '<C-\\><C-N><C-w>>i')

-- Switch conceal --
Keymap("n", "<Leader>c", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, Silent)
