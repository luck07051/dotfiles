local opt = vim.opt

opt.termguicolors = true

opt.ruler = true
opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.cursorline = true
opt.laststatus = 2
opt.scrolloff = 5
opt.signcolumn = 'yes'
opt.conceallevel = 2

-- Search --
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Indent --
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true

-- Wild Menu --
opt.wildmenu = true
opt.wildignorecase = true
opt.wildignore = { '*.git/*', '*.tags', 'tags', '*.o', '*.class' }
opt.pumheight = 10

-- Special Char Visualize --
opt.linebreak = true
opt.showbreak = '↪ '
--opt.list = true
--opt.listchars = { tab = '» ', eol = '↲', trail = '_' }

-- Msic --
opt.splitbelow = true
opt.splitright = true

opt.swapfile = false
opt.path:append('**')

opt.foldmethod = 'marker'
