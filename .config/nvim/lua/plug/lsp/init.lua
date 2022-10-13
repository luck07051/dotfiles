return function()
  local lspconfig = require 'lspconfig'
  local lsp_installer = require 'nvim-lsp-installer'
  local handlers = require 'plug.lsp.handlers'

  handlers.setup()

  require 'plug.lsp.null-ls'


  -- Setup for each sever
  for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    }
    -- if have language specific file
    local has_opts, server_opts = pcall(require, "plug.lsp.settings." .. server.name)
    if has_opts then
      opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    lspconfig[server.name].setup(opts)
  end
end
