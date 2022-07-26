if not pcall(require, 'null-ls') then return end
local null = require "null-ls"

local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics

null.setup({
  sources = {
    --formatting.stylua,
  },
})
