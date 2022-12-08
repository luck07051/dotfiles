-------------------------------
--          KEYMAPS          --
-------------------------------

-- Make space as leader key --
Keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Swap ';' and ':' --
Keymap('', ';', ':')
Keymap('', ':', ';')
Keymap('n', 'q;', 'q:')

-- Move Quickly --
Keymap('', '<C-E>', '3<C-E>')
Keymap('', '<C-Y>', '3<C-Y>')

-- Copy with clipboard --
Keymap('', '<Leader>y', '"+y')
Keymap('', '<Leader>Y', '"+y$')
Keymap('', '<Leader>p', '"+p')
Keymap('', '<Leader>P', '"+P')
Keymap('v', '<C-c>', '"+y')
Keymap('v', '<C-v>', '"+p')

-- Paste in visual mode do not change register --
Keymap('v', 'p', '"_dP')
Keymap('v', 'gp', '"_d"+P')

-- Quick replace --
Keymap('n', 's', ':%s/')
Keymap('v', 's', ':s/')

-- Copy all file to clipboard --
Keymap('', '<Leader><Leader>y', 'gg"+yG\'\'')

-- Wizard --
Keymap('n', '<Leader>r', '!!$SHELL<CR>')
Keymap('v', '<Leader>r', '!$SHELL<CR>')

-- Spell check --
Keymap('n', '<Leader>s', ':setlocal spell! spelllang=en_us<CR>')

-- Compiler script --
-- Keymap('n', '<Leader>dl', ':w | !compiler "%:p"<CR>')
-- Keymap('n', '<Leader>do', ':!open "%:p"<CR>')

-- Goback prev file --
Keymap('n', '<BS>', ':edit #<CR>', Silent)

-- Terminal --
Keymap('t', '<C-[>', '<C-\\><C-n>', Silent)
Keymap('t', '<C-w>', '<C-\\><C-n><C-w>', Silent)
-- Keymap('t', '<CR>', '<CR><C-\\><C-n>', Silent)


-- Navigate windows --
local function win_focus_resize(dir, cmd)
  Keymap('n', '<A-'..dir..'>', '<C-w>'..dir)
  Keymap('i', '<A-'..dir..'>', '<C-\\><C-N><C-w>'..dir)
  Keymap('t', '<A-'..dir..'>', '<C-\\><C-N><C-w>'..dir)
  dir = string.upper(dir)
  Keymap('n', '<A-'..dir..'>', '3<C-w>'..cmd)
  Keymap('i', '<A-'..dir..'>', '<C-\\><C-N>3<C-w>'..cmd..'gi')
  Keymap('t', '<A-'..dir..'>', '<C-\\><C-N>3<C-w>'..cmd..'i')
end
win_focus_resize('h', '<')
win_focus_resize('j', '+')
win_focus_resize('k', '-')
win_focus_resize('l', '>')


-- Switch conceal --
Keymap("n", "<Leader>zc", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, Silent)

-- Alias for command mode --
local function cabbrev(lhs, rhs)
  -- only working on ':' mode
  local command = "cnoreabbrev <expr> %s ((getcmdtype() is# ':' && getcmdline() is# '%s')?('%s'):('%s'))"
  vim.cmd(command:format(lhs, lhs, rhs, lhs))
end

cabbrev('sudow', 'w !sudo tee %')
cabbrev('za', '!zathura')
cabbrev('pa', 'so % \\| PackerCompile')
