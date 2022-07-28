local M = {}

-- Setup {{{
M.setup = function()
  -- Icon define --
  local function sign(name, text)
    vim.fn.sign_define(name, { texthl = name, text = text, numhl = "" })
  end

  sign("DiagnosticSignError", "✗")
  sign("DiagnosticSignWarn", "")
  sign("DiagnosticSignHint", "")
  sign("DiagnosticSignInfo", "")

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
end
--}}}

-- on attach
M.on_attach = function(client, bufnr)
  -- keymap {{{
  local function map(key, cmd)
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', key, cmd, opts)
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- jump to ...
    -- map('gd', vim.lsp.buf.definition)
    -- map('gD', vim.lsp.buf.type_definition)
    -- map('gi', vim.lsp.buf.implementation)
    -- map('gr', vim.lsp.buf.references)
  -- show help
  map('K', vim.lsp.buf.hover)
  map('<Leader>k', vim.lsp.buf.signature_help)
  -- root dir
  map('<Leader>wa', vim.lsp.buf.add_workspace_folder)
  map('<Leader>wr', vim.lsp.buf.remove_workspace_folder)
  map('<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  -- diagnostics
  map('<Leader>e', vim.diagnostic.open_float)
  map('[d', vim.diagnostic.goto_prev)
  map(']d', vim.diagnostic.goto_next)
  --map('<Leader>q', vim.diagnostic.setloclist)

  map('<Leader>rn', vim.lsp.buf.rename)
  map('g=', vim.lsp.buf.formatting_sync)
  --}}}

  if pcall(require, 'illuminate') then
    require 'illuminate'.on_attach(client)
  end

  if pcall(require, 'lsp_signature') then
    require 'lsp_signature'.on_attach({ --{{{
      floating_window = false,
      doc_lines = 10,
      handler_opts = { border = 'rounded' },
      floating_window_off_x = 0,

      hint_enable = false,
      hint_prefix = '',

      hint_scheme = "String",
      hi_parameter = "LspSignatureActiveParameter",
    }, bufnr)

    -- Show signature uses echo
    local current_signature = function()
      -- if not pcall(require, 'lsp_signature') then return end
      local sig = require("lsp_signature").status_line(vim.fn.winwidth(0))
      if not (sig.label == '') then
        print(sig.label .. '   ' .. sig.hint)
      end
    end
    vim.api.nvim_create_augroup('echo_lsp_sign', {})
    vim.api.nvim_create_autocmd('InsertCharPre', {
      group = 'echo_lsp_sign',
      callback = current_signature
    })
    --}}}
  end

end


-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, 'cmp_nvim_lsp') then
  capabilities = require 'cmp_nvim_lsp'.update_capabilities(capabilities)
end
M.capabilities = capabilities


return M
