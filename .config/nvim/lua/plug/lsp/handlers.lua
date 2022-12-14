local M = {}

M.setup = function() --{{{
  -- Icon define --
  local function set_sign(name, text)
    vim.fn.sign_define('DiagnosticSign'..name, { texthl = 'DiagnosticSign'..name, text = text, numhl = "" })
  end
  set_sign("Error", "✗")
  set_sign("Warn", "")
  set_sign("Hint", "")
  set_sign("Info", "")

  vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  require 'nvim-lsp-installer'.setup({
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  })

end --}}}

-- on attach
M.on_attach = function(client, bufnr)

  if not pcall(require, 'telescope') then
    Keymap('n', '<space>gd', vim.diagnostic.setloclist)
    Keymap('n', 'gd', vim.lsp.buf.definition)
    Keymap('n', 'gD', vim.lsp.buf.declaration)
    Keymap('n', 'gi', vim.lsp.buf.implementation)
    Keymap('n', 'gr', vim.lsp.buf.references)
  end

  Keymap('n', '<Leader>d', vim.diagnostic.open_float)
  Keymap('n', '[d', vim.diagnostic.goto_prev)
  Keymap('n', ']d', vim.diagnostic.goto_next)

  -- Show help
  Keymap('n', 'K', vim.lsp.buf.hover)
  Keymap('n', '<Leader>k', vim.lsp.buf.signature_help)

  -- Root dir
  Keymap('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder)
  Keymap('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder)
  Keymap('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  Keymap('n', '<Leader>rn', vim.lsp.buf.rename)

  -- Formatting
  Keymap('n', '<Leader>=', vim.lsp.buf.format)

end


-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, 'cmp_nvim_lsp') then
  capabilities = require('cmp_nvim_lsp').default_capabilities()
end
M.capabilities = capabilities


return M
