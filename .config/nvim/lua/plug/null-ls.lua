local M = {
  'jose-elias-alvarez/null-ls.nvim',
  event = "BufReadPre",
}

M.config = function()
  local null_ls = require 'null-ls'

  null_ls.setup {
    sources = {
      -- python
      -- null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.formatting.yapf,
    }
  }
end

return M
