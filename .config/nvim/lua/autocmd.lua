local au = vim.api.nvim_create_autocmd

-- Clear nonessential files when leave Tex file
au('VimLeave', { pattern = '*.tex', command = [[ !latexmk -c % ]] })

-- Update xresource when write the xresource file
au('BufWritePost',
  { pattern = { 'xresources', '.Xresources' },
    command = [[ !xrdb -merge %; $XDG_CONFIG_HOME/X11/sync_xrdb ]] })

au('BufEnter',
  { pattern = {'*manuscript/*.txt' },
    command = [[ set ft=markdown ]] } )
