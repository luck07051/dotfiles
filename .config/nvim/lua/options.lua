-------------------------------
--          OPTIONS          --
-------------------------------

Opt.number = true
-- Opt.relativenumber = true
Opt.signcolumn = 'yes'
Opt.cursorline = true
Opt.scrolloff = 5
Opt.conceallevel = 0
Opt.laststatus = 3    -- global statusline

-- Indent --
Opt.shiftwidth = 2
Opt.tabstop = 2
Opt.softtabstop = 2
Opt.expandtab = true
Opt.autoindent = true
Opt.smartindent = true
Opt.shiftround = true

-- Menu --
Opt.ignorecase = true
Opt.smartcase = true
Opt.wildignorecase = true
Opt.wildignore = { '*.git/*', '*.tags', 'tags', '*.o', '*.class' }
Opt.path:append('**')
Opt.pumheight = 10
-- Opt.inccommand = 'split'

-- Msic --
Opt.splitbelow = true
Opt.splitright = true
Opt.swapfile = false
Opt.updatetime = 100
-- Opt.linebreak = true
-- Opt.clipboard = 'unnamedplus'

-- Special Char Visualization --
Opt.showbreak = '↪'
Opt.fillchars='eob: '    -- hide '~' that fills in blank line
if vim.o.filetype ~= 'dashboard' then
  vim.fn.matchadd('ColorColumn', '\\%81v', 100)   -- Highlight 81 column
  vim.fn.matchadd('ColorColumn', '\\s$', 100)     -- Show extra space
end
