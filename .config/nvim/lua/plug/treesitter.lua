if not pcall(require, "nvim-treesitter.configs") then return end
local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
    ensure_installed = "all",
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        --additional_vim_regex_highlighting = true,
    },
    --indent = { enable = true, disable = { "yaml" } },
    playground = {
        enable = true,
    },
    query_linter = {
        enable = true,
    },
}

-- fix
vim.cmd [[ hi! link TSVariable Identifier ]]
vim.cmd [[ hi! link TSNamespace Identifier ]]
