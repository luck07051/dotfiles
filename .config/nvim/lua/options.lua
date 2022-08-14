local opt = vim.opt

opt.termguicolors = true

opt.ruler = true
opt.number = true
-- opt.relativenumber = true
opt.showcmd = true
opt.laststatus = 3
opt.cursorline = true
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

-- Menu --
opt.wildmenu = true
opt.wildignorecase = true
opt.wildignore = { '*.git/*', '*.tags', 'tags', '*.o', '*.class' }
opt.pumheight = 10
-- opt.pumblend = 10 -- semi-transparent popupmenu

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

-- Highlight 81 column
vim.fn.matchadd('ColorColumn', '\\%101v', 100)
-- Show extra space
vim.fn.matchadd('ColorColumn', '\\s$', 100)

-- Fold --{{{
vim.cmd [[
set foldmethod=marker
function! MyFoldText()
    let foldedlinecount = v:foldend - v:foldstart
    let line = getline(v:foldstart)
    " remove mark
    let line = substitute(line, '\s*{{'.'{\s*', '', '')
    " add icon
    let line = substitute(line, '^\(\([#" ]\s\)\|\(--\)\|\(//\)\)', ' ', '')
    " may sure text not too long
    let line = strpart(line, 0, windowwidth - 8 - len(foldedlinecount))

    let nucolwidth = &foldcolumn + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let fillcharcount = windowwidth - strdisplaywidth(line) - len(foldedlinecount) -3
    return line . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()
]]
--}}}
