-------------------------------
--          OPTIONS          --
-------------------------------

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.conceallevel = 0
vim.opt.laststatus = 3    -- global statusline

-- Indent --
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Menu --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.wildignore = { '*.git/*', '*.tags', 'tags', '*.o', '*.class' }
vim.opt.path:append('**')
vim.opt.pumheight = 10
vim.opt.inccommand = 'split'

-- Msic --
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.updatetime = 100
-- vim.opt.linebreak = true
vim.opt.suffixesadd = '.md'

-- Special Char Visualization --
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.fillchars='eob: '


-- Fold --
vim.opt.foldlevel = 9999
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldtext = 'MyFoldText()'
vim.cmd [[
function! MyFoldText() "{{{
  let foldedlinecount = '[ ' . (v:foldend - v:foldstart) . ' ]'
  let startline = getline(v:foldstart)
  let endline = trim(getline(v:foldend))
  let line = startline . ' ... '
  " add end of fold
  if startline !~ ':$'  " dont add if it end with ':'(for py)
      let line = line . endline
  endif
  " remove marker
  let line = substitute(line, '\s*\([#"]\|\(--\)\|\(//\)\)\?\s*{{'.'{\s*', ' ', '')
  let line = substitute(line, '\s*\([#"]\|\(--\)\|\(//\)\)\?\s*}}'.'}\s*', '', '')
  " replace tab to space
  let line = substitute(line, '\t', repeat(' ', &tabstop), '')

  let colwidth = &number * &numberwidth + (&signcolumn=='yes'?1:0) * 2 + &foldcolumn
  let displaywidth = winwidth(0) - colwidth

  let line = strpart(line, 0, displaywidth - len(foldedlinecount) - 8)
  let fillcharcount = displaywidth - strdisplaywidth(line) - len(foldedlinecount)
  return line . repeat(' ', fillcharcount-2) . foldedlinecount . '  '
endfunction "}}}
]]
