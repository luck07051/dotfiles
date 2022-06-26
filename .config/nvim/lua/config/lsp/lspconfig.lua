local M = {}

M.setup = function() --{{{
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

local function lsp_keymaps(bufnr) --{{{
    local opts = { buffer = bufnr, noremap = true, silent = true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- jump to ...
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- show help
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- root dir
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- diagnostics
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>=', vim.lsp.buf.formatting, opts)
end

--}}}

local function lsp_illuminate(client) --{{{
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
end

--}}}

M.on_attach = function(client, bufnr) --{{{
    lsp_keymaps(bufnr)
    lsp_illuminate(client)
end
--}}}

-- capabilities {{{
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
--}}}

return M
