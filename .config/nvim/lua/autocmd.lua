local au = vim.api.nvim_create_autocmd

au({ 'BufNewFile', 'BufRead' },
  { pattern = '/*.rasi',
    command = [[
      setf css
      LspStop
    ]] })

-- Clear nonessential files when leave Tex file
au('VimLeave', { pattern = '*.tex', command = [[ !latexmk -c % ]] })

-- Update xresource when write the xresource file
au('BufWritePost',
  { pattern = { 'xresources', '.Xresources' },
    command = [[ !xrdb -merge %; $XDG_CONFIG_HOME/X11/sync_xrdb ]] })

-- use md syntax highlight to read the book 'pure bash bible'
au('BufEnter',
  { pattern = {'*manuscript/*.txt' },
    command = [[ set ft=markdown ]] } )
