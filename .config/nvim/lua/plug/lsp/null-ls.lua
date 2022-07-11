local status_ok, null = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics

null.setup({
    sources = {
        -- cargo install stylua
        formatting.stylua,


    },
})
