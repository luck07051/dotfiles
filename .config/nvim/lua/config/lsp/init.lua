local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

require("config.lsp.installer")
require("config.lsp.lspconfig").setup()

-- Setup for each sever --{{{
local config = require("config.lsp.lspconfig")

for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local opts = {
        on_attach = config.on_attach,
        capabilities = config.capabilities,
    }
    local has_opts, server_opts = pcall(require, "config.lsp.settings."..server.name)
    if has_opts then
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end
    lspconfig[server.name].setup(opts)
end
--}}}
