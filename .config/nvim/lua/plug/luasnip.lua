local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    return
end

-- Use snip from friendly-snippets --
require("luasnip.loaders.from_vscode").lazy_load()


luasnip.config.set_config {
    --updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
}


-- Keymapping --
local silent = { noremap = true, silent = true }

vim.keymap.set({ 'i', 's' }, '<C-J>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, silent)

vim.keymap.set({ 'i', 's' }, '<C-K>', function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, silent)

vim.keymap.set('i', '<c-l>', function()
    if luasnip.choice_active() then
        luasnip.choice(1)
    end
end, silent)

-- reload snippets
vim.keymap.set('n', '<Leader><Leader>s',
    '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>')
