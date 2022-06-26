local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

-- Use snip from friendly-snippets --
require("luasnip.loaders.from_vscode").lazy_load()


-- Setup keymapping --
local keymap = vim.api.nvim_set_keymap
local silent = { noremap = true, silent = true }

keymap("i", "<Space><Space>",
    "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '  '",
    { silent = true, expr = true} )
keymap("i", "<S-Space><S-Space>", "<cmd>lua require('luasnip').jump(-1)<Cr>", silent)
keymap("s", "<Space><Space>", "<cmd>lua require('luasnip').jump(1)<Cr>", silent)
keymap("s", "<S-Space><S-Space>", "<cmd>lua require('luasnip').jump(-1)<Cr>", silent)
