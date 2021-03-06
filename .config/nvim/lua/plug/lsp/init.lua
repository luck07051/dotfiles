if not pcall(require, 'lspconfig') then return end
local lspconfig = require 'lspconfig'

if not pcall(require, 'nvim-lsp-installer') then return end
local lsp_installer = require 'nvim-lsp-installer'


local config = require("plug.lsp.handlers")
config.setup()
require("plug.lsp.null-ls")


lsp_installer.setup({ --{{{
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})
--}}}


-- Setup for each sever
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  local opts = {
    on_attach = config.on_attach,
    capabilities = config.capabilities,
  }
  -- if have language specific file
  local has_opts, server_opts = pcall(require, "plug.lsp.settings." .. server.name)
  if has_opts then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  lspconfig[server.name].setup(opts)
end
