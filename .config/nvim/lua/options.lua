local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.ruler = true
opt.number = true
opt.relativenumber = false
opt.showcmd = true
opt.laststatus = 3    -- global statusline
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
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true

-- Menu --
opt.wildmenu = true
opt.wildignorecase = true
opt.wildignore = { '*.git/*', '*.tags', 'tags', '*.o', '*.class' }
opt.path:append('**')
opt.pumheight = 10
-- opt.pumblend = 10    -- semi-transparent popupmenu

-- Special Char Visualize --
opt.linebreak = true
opt.showbreak = '↪'
-- opt.list = true
-- opt.listchars = { tab = '» ', eol = '↲', trail = '_' }

-- Msic --
opt.splitbelow = true
opt.splitright = true
-- opt.inccommand = 'split'
opt.termguicolors = true
opt.swapfile = false
opt.updatetime = 100
opt.fillchars='eob: '    -- hide '~' for blank line

vim.fn.matchadd('ColorColumn', '\\%81v', 100)   -- Highlight 81 column
vim.fn.matchadd('ColorColumn', '\\s$', 100)     -- Show extra space

-- Fold --
opt.foldmethod = "marker"
vim.cmd [[
function! MyFoldText() "{{{
    let foldedlinecount = v:foldend - v:foldstart
    let line = getline(v:foldstart)
    " remove mark
    let line = substitute(line, '\([#"]\|\(--\)\|\(//\)\)\?\s*{{'.'{\s*$', '', '')
    " add icon at beginning
    let line = substitute(line, '^\(\([#" ]\s\)\|\(--\)\|\(//\)\)', ' ', '')
    " make sure text is not too long
    let line = strpart(line, 0, windowwidth - 8 - len(foldedlinecount))

    let nucolwidth = &foldcolumn + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let fillcharcount = windowwidth - strdisplaywidth(line) - len(foldedlinecount) -3
    return line . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()
"}}}
]]

-- Not auto comment new line --
autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Specify indent width by file type --
vim.api.nvim_create_autocmd('FileType',
  { pattern = { 'c', 'h', 'cpp' },
    command = [[ setlocal sw=4 ts=4 sts=4 ]]
  })

-- Delete trailing spaces and extra line when save file --
local DeleteExtraSpaces = function() --{{{
  vim.cmd [[
    let b:nline= line('.')
    %s/\s\+$//e
    %s/\n\+\%$//e
    execute "to ".b:nline
  ]]
end --}}}
autocmd('BufWrite', { callback = DeleteExtraSpaces })

-- Setting for terminal mode --
-- autocmd('TermOpen', { command = 'startinsert' })
autocmd('TermOpen', { command = 'setlocal nonumber signcolumn=no' })

-- No relativenumber in insert mode --
-- autocmd('InsertEnter', { command = 'set norelativenumber' })
-- autocmd('InsertLeave', { command = 'set relativenumber' })

-- Only focused window have cursorline --
autocmd('WinEnter', { command = 'setlocal cursorline' })
autocmd('WinLeave', { command = 'setlocal nocursorline' })
