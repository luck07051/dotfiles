if not pcall(require, "nvim-lsp-installer") then return end
local lsp_installer = require "nvim-lsp-installer"

lsp_installer.setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
