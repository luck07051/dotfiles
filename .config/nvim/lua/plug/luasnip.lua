local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
    return
end


-- My snippets --
require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets/' })
-- Use snip from friendly-snippets --
require('luasnip.loaders.from_vscode').lazy_load()


local types = require("luasnip.util.types")
ls.config.set_config {
    --history = true,
    --updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "Type" } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { "●", "Statement" } },
            },
        },
    },
}


-- Keymapping --

local silent = { noremap = true, silent = true }

vim.keymap.set({ 'i', 's' }, '<C-J>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, silent)

vim.keymap.set({ 'i', 's' }, '<C-K>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, silent)

vim.keymap.set('i', '<C-L>', function()
    if ls.choice_active() then
        ls.choice(1)
    end
end, silent)

-- reload snippets
vim.keymap.set('n', '<Leader><Leader>s',
    '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>')
