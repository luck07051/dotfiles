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
Opt.inccommand = 'split'

-- Msic --
Opt.splitbelow = true
Opt.splitright = true
Opt.swapfile = false
Opt.updatetime = 100
-- Opt.linebreak = true

-- Special Char Visualization --
Opt.list = true
Opt.listchars = { tab = '▸ ', trail = '·' }
-- Opt.showbreak = '↪'
Opt.fillchars='eob: '    -- disable filler '~' at blank line


-- Fold --
Opt.foldlevel = 9999
Opt.foldmethod = 'expr'
Opt.foldexpr = 'nvim_treesitter#foldexpr()'
Opt.foldtext = 'MyFoldText()'
vim.cmd [[
function! MyFoldText() "{{{
    let foldedlinecount = '[ ' . (v:foldend - v:foldstart) . ' ]'
    let line = getline(v:foldstart)
    " add end of fold
    let line = line . ' ... ' . trim(getline(v:foldend))
    " remove marker
    let line = substitute(line, '\s*\([#"]\|\(--\)\|\(//\)\)\?\s*{{'.'{\s*', ' ', '')
    let line = substitute(line, '\s*\([#"]\|\(--\)\|\(//\)\)\?\s*}}'.'}\s*', '', '')

    let colwidth = &number * &numberwidth + (&signcolumn=='yes'?1:0) * 2 + &foldcolumn
    let displaywidth = winwidth(0) - colwidth

    let line = strpart(line, 0, displaywidth - len(foldedlinecount) - 8)
    let fillcharcount = displaywidth - strdisplaywidth(line) - len(foldedlinecount)
    return line . repeat(' ', fillcharcount-2) . foldedlinecount . '  '
endfunction "}}}
]]
