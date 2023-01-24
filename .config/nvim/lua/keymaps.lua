-------------------------------
--          KEYMAPS          --
-------------------------------

-- Make space as leader key --
vim.keymap.set('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Copy paste with clipboard --
vim.keymap.set('', '<Leader>y', '"+y')
vim.keymap.set('', '<Leader>Y', '"+y$')
vim.keymap.set('', '<Leader>p', '"+p')
vim.keymap.set('', '<Leader>P', '"+P')
vim.keymap.set('v', '<C-s-c>', '"+y')
vim.keymap.set('v', '<C-s-v>', '"+p')
vim.keymap.set('', '<Leader><Leader>y', 'gg"+yG\'\'')

-- Delete with black hole --
-- vim.keymap.set('', '<Leader>d', '"_d')
-- vim.keymap.set('', '<Leader>D', '"_D')

-- Paste in visual mode do not change register --
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('v', '<Leader>p', '"_d"+P')

-- Move line in visual mode --
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

-- Quick replace --
vim.keymap.set('n', 's', ':%s/')
vim.keymap.set('v', 's', ':s/')

-- Center the search --
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('c', '<CR>', function()
  return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>'
end, { expr = true })

-- Wizard --
vim.keymap.set('n', '<Leader>r', '!!$SHELL<CR>')
vim.keymap.set('v', '<Leader>r', '!$SHELL<CR>')

-- Spell check --
vim.keymap.set('n', '<Leader>s', ':setlocal spell! spelllang=en_us<CR>')

-- Compiler script --
-- vim.keymap.set('n', '<Leader>dl', ':w | !compiler "%:p"<CR>')
-- vim.keymap.set('n', '<Leader>do', ':!open "%:p"<CR>')

-- Goto prev file --
vim.keymap.set('n', '<BS>', ':edit #<CR>', { silent = true } )

-- Terminal --
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { silent = true } )
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { silent = true } )
-- vim.keymap.set('t', '<CR>', '<CR><C-\\><C-n>', { silent = true } )


-- Navigate windows --
local function win_focus_resize(dir, cmd)
  vim.keymap.set('n', '<A-'..dir..'>', '<C-w>'..dir)
  vim.keymap.set('i', '<A-'..dir..'>', '<C-\\><C-N><C-w>'..dir)
  vim.keymap.set('t', '<A-'..dir..'>', '<C-\\><C-N><C-w>'..dir)
  dir = string.upper(dir)
  vim.keymap.set('n', '<A-'..dir..'>', '3<C-w>'..cmd)
  vim.keymap.set('i', '<A-'..dir..'>', '<C-\\><C-N>3<C-w>'..cmd..'gi')
  vim.keymap.set('t', '<A-'..dir..'>', '<C-\\><C-N>3<C-w>'..cmd..'i')
end
win_focus_resize('h', '<')
win_focus_resize('j', '+')
win_focus_resize('k', '-')
win_focus_resize('l', '>')


-- Switch conceal --
vim.keymap.set("n", "<Leader>zc", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, { silent = true } )

-- Alias for command mode --
local function cabbrev(lhs, rhs)
  -- only working on ':' mode
  local command = "cnoreabbrev <expr> %s ((getcmdtype() is# ':' && getcmdline() is# '%s')?('%s'):('%s'))"
  vim.cmd(command:format(lhs, lhs, rhs, lhs))
end

cabbrev('sudow', 'w !sudo tee %')
cabbrev('f', 'find')
