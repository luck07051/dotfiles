-- Use md syntax highlight to read the book 'pure bash bible'
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*qmk*/*.def' },
  command = [[ setf c ]]
})
