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

-- Keymapping -- {{{
local silent = { noremap = true, silent = true }

vim.keymap.set({'i', 's'}, '<C-J>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, silent)

vim.keymap.set({'i', 's'}, '<C-K>', function()
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
    '<cmd>source ~/.config/nvim/lua/config/luasnip.lua<cr>')
--}}}



-- some shorthands...
local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")


luasnip.add_snippets("all",{
            s("fn", {
		-- Simple static text.
		t("//Parameters: "),
		-- function, first parameter is the function, second the Placeholders
		-- whose text it gets as input.
		t({ "", "function " }),
		-- Placeholder/Insert.
		i(1),
		t("("),
		-- Placeholder with initial text.
		i(2, "int foo"),
		-- Linebreak
		t({ ") {", "\t" }),
		-- Last Placeholder, exit Point of the snippet.
		i(0),
		t({ "", "}" }),
	}),
    }
)
