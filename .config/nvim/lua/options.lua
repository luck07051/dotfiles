local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

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
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
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

-- Fold --
opt.foldmethod = "marker"
vim.cmd [[
function! MyFoldText() "{{{
    let foldedlinecount = v:foldend - v:foldstart
    let line = getline(v:foldstart)
    " remove mark
    let line = substitute(line, '\([#"]\|\(--\)\|\(//\)\)\s*{{'.'{\s*$', '', '')
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
"}}}
]]

-- Not auto comment --
autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Indent width by file type --
vim.api.nvim_create_autocmd('FileType',
  { pattern = { 'lua', 'css', 'html' },
    callback = function()
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
      vim.bo.softtabstop = 2
    end })

-- When save file, delete trailing spaces and extra line
local DeleteExtraSpaces = function() --{{{
  vim.cmd [[
    let b:nline= line('.')
    %s/\s\+$//e
    %s/\n\+\%$//e
    execute "to ".b:nline
  ]]
end --}}}
autocmd('BufWrite', { callback = DeleteExtraSpaces })

-- Auto clear nonessential files when leave Tex file --
autocmd('VimLeave', { pattern = '*.tex', command = [[ !latexmk -c % ]] })

-- Setting for terminal mode --
autocmd('TermOpen', { command = 'normal! G' })
autocmd('TermOpen', { command = 'startinsert' })
autocmd('TermOpen', { command = 'set nonumber' })
autocmd('TermEnter', { command = 'set nocursorline' })

-- No relativenumber in insert mode --
-- autocmd('InsertEnter', { command = 'set norelativenumber' })
-- autocmd('InsertLeave', { command = 'set relativenumber' })

-- Only focus window have cursorline --
autocmd('WinEnter', { command = 'set cursorline' })
autocmd('WinLeave', { command = 'set nocursorline' })
