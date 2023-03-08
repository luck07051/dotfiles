local M = {
  'jose-elias-alvarez/null-ls.nvim',
  event = "BufReadPre",
}

M.config = function()
  require 'null-ls'.setup {
    sources = { }
  }
end

return M
