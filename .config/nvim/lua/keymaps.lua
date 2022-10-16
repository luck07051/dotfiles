-- Make space as leader key --
Keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Swap ';' and ':' --
Keymap('', ';', ':')
Keymap('', ':', ';')
Keymap('n', 'q;', 'q:')

-- Quicker move --
Keymap('', '<C-E>', '3<C-E>')
Keymap('', '<C-Y>', '3<C-Y>')

-- Paste in visual mode but not change register --
Keymap('v', 'p', '"_dP')
Keymap('v', 'gp', '"_d"+P')

-- Quick replace --
Keymap('n', 's', ':%s/')
Keymap('v', 's', ':s/')

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

Keymap('n', '<Leader>=', ':lua vim.lsp.buf.format()<CR>')

-- Wizard --
Keymap('n', '<Leader>r', '!!$SHELL<CR>')
Keymap('v', '<Leader>r', '!$SHELL<CR>')

-- Spell check --
Keymap('n', '<Leader>s', ':setlocal spell! spelllang=en_us<CR>')

-- Compiler script --
Keymap('n', '<Leader>dl', ':w | !compiler "%:p"<CR>')
Keymap('n', '<Leader>do', ':!open "%:p"<CR>')

-- Terminal --
Keymap('t', '<C-[>', '<C-\\><C-n>', Silent)
Keymap('t', '<C-w>', '<C-\\><C-n><C-w>', Silent)
-- Keymap('t', '<CR>', '<CR><C-\\><C-n>', Silent)



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
-- Keymap('n', '<A-j>', '<C-w>w')
-- Keymap('n', '<A-k>', '<C-w>W')
-- Keymap('i', '<A-j>', '<C-\\><C-N><C-w>w')
-- Keymap('i', '<A-k>', '<C-\\><C-N><C-w>W')
-- Keymap('t', '<A-j>', '<C-\\><C-N><C-w>w')
-- Keymap('t', '<A-k>', '<C-\\><C-N><C-w>W')

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
Keymap("n", "<Leader>zc", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, Silent)

-- Create a terminal if not have one --
Keymap('n', '<Leader>tt', function() vim.cmd [[
  if !exists("t:terminal_id") || !win_gotoid(t:terminal_id)
    belowright 15%split term://$SHELL
    let t:terminal_id = win_getid()
  endif
]]
end, Silent)

-- Goto terminal and exec last command --
Keymap('n', '<Leader>te', function() vim.cmd [[
  let t:cur_win_id = win_getid()
  if exists("t:terminal_id") && win_gotoid(t:terminal_id)
    call win_gotoid(t:terminal_id)
    call feedkeys("a\<Up>\<CR>\<C-\>\<C-N>G\<C-W>p")
  endif
]]
end, Silent)


-- Alias for command mode --
local function cabbrev(lhs, rhs) -- {{{
  -- only working on ':' mode
  local command = "cnoreabbrev <expr> %s ((getcmdtype() is# ':' && getcmdline() is# '%s')?('%s'):('%s'))"
  vim.cmd(command:format(lhs, lhs, rhs, lhs))
end

-- }}}

cabbrev('sudow', 'w !sudo tee %')
cabbrev('za', '!zathura')
cabbrev('pa', 'so % \\| PackerCompile')

Keymap('n', '<Leader><Leader>ng', ':!sudo rm -rf /usr/share/nginx/html<CR>:!sudo cp -rf /home/ui/.local/share/web /usr/share/nginx/html<CR>')
