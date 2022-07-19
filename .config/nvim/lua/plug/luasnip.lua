if not pcall(require, 'luasnip') then return end
local ls = require "luasnip"


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
Keymap({ 'i', 's' }, '<C-J>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, Silent)

Keymap({ 'i', 's' }, '<C-K>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, Silent)

Keymap('i', '<C-L>', function()
  if ls.choice_active() then
    ls.choice(1)
  end
end, Silent)

-- reload snippets
Keymap('n', '<Leader><Leader>s',
  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>')
