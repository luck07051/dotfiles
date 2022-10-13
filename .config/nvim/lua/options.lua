Opt.number = true
-- Opt.relativenumber = true
Opt.signcolumn = 'yes'
Opt.cursorline = true
Opt.scrolloff = 5
Opt.conceallevel = 2
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
Opt.linebreak = true

-- Special Char Visualization --
Opt.showbreak = '↪'
Opt.fillchars='eob: '    -- hide '~' that fills in blank line
if vim.o.filetype ~= 'dashboard' then
  vim.fn.matchadd('ColorColumn', '\\%81v', 100)   -- Highlight 81 column
  vim.fn.matchadd('ColorColumn', '\\s$', 100)     -- Show extra space
end

-- Fold --
Opt.foldmethod = "marker"
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
