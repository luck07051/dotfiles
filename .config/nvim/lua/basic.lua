
-- ==================== BASIC ===================== --

local o = vim.opt

o.ruler = true
o.number = true
o.relativenumber = true
o.showcmd = true
o.cursorline = true
o.laststatus = 2
o.scrolloff = 5
o.signcolumn = "yes"
o.conceallevel = 2

-- ===== Search ==== --
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- ===== Indent ==== --
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.shiftround = true

-- ===== Wild Menu =====--
o.wildmenu = true
o.wildignorecase = true
o.wildignore = "*.git/*,*.tags,tags,*.o,*.class"
o.pumheight = 15

-- ===== Misc ==== --
o.linebreak = true
o.showbreak = "↪ "
-- o.list = true
-- o.listchars = { tab = "» ", eol = "↲", trail = "_" }

o.splitbelow = true
o.splitright = true

o.swapfile = false





vim.cmd [[ source ~/.config/nvim.vim/colors/ui_colors.vim ]]
vim.cmd [[autocmd filetype * set formatoptions-=cro]]
vim.cmd [[set path+=**]]
-- Delete extra space when write the file
vim.cmd [[
    autocmd BufWrite * call DeleteExtraSpaces()
    function DeleteExtraSpaces() "{{{
        :let b:nline= line('.')
        :%s/\s\+$//e
        :%s/\n\+\%$//e
        :execute "to ".b:nline
    endfunction "}}}
]]
-- Fold
vim.cmd [[
    set foldmethod=marker
    "set foldlevel=1
    function! MyFoldText() "{{{
        let foldedlinecount = v:foldend - v:foldstart
        let line = getline(v:foldstart)
        " remove fold mark
        let line = substitute(line, '"\?\s*{{'.'{\s*', '', 'g')
        " remove commend mark
        let line = substitute(line, '^["\#(\*)]\s*', '', '')
        let line = strpart(line, 0, windowwidth - 8 - len(foldedlinecount))
        let showline = " " . line

        let nucolwidth = &foldcolumn + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth
        let fillcharcount = windowwidth - strdisplaywidth(showline) - len(foldedlinecount) -1
        return showline . repeat(" ",fillcharcount) . foldedlinecount . ' '
    endfunction "}}}
    set foldtext=MyFoldText()
]]
