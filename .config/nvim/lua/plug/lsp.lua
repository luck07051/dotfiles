local M = {
  'neovim/nvim-lspconfig',
  name = "lsp",
  event = "BufReadPre",
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
}

M.config = function()
  local lspconfig = require 'lspconfig'

  -- lsp settings {{{
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
  --}}}

  local on_attach = function(client, bufnr) --{{{
    -- vim.keymap.set('n', '<space>gd', vim.diagnostic.setloclist, { desc = '' } )
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition,           { desc = '' } )
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,          { desc = '' } )
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,       { desc = '' } )
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references,           { desc = '' } )

    vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics in a floating window' } )
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,         { desc = 'Move to the prev diagnostic' } )
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next,         { desc = 'Move to the next diagnostic' } )

    -- Show help
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,                  { desc = 'Displays hover information' } )
    vim.keymap.set('n', '<Leader>k', vim.lsp.buf.signature_help, { desc = 'Displays signature information' } )

    -- Root dir
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder,    { desc = 'Add the folder at path to the workspace folders' } )
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove the folder at path from the workspace folders' } )
    vim.keymap.set('n', '<Leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = 'Print out workspace folders' } )
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { desc = 'Renames all references to the symbol under the cursor' } )

    -- Formatting
    vim.keymap.set('n', '<Leader>=', vim.lsp.buf.format, { desc = 'Formats a buffer using the language server clients' } )
  end --}}}

  local server_settings = {
    ["sumneko_lua"] = { --{{{
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        ['runtime.version'] = "LuaJIT",
        ['workspace.checkThirdParty'] = false,
      }
    }, --}}}
  }

  --[[
  require('mason-lspconfig').setup( {
    ensure_installed = { "sumneko_lua", "rust_analyzer", "bashls" },
  })

  require('mason-lspconfig').setup_handlers({
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = server_settings[server_name],
      }
    end,

    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
  })
  ]]

  -- local server_list = { 'sumneko_lua', 'rust_analyzer', 'bashls' }
  local server_list = { 'bashls' }

  for _, server_name in pairs(server_list) do
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = server_settings[server_name],
    }
  end


end

return M
