-- snippets collection:
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/molleweide/LuaSnip-snippets.nvim
return function()
  local ls = require "luasnip"

  -- My snippets --
  require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets/' })
  -- Use snip from friendly-snippets --
  -- require('luasnip.loaders.from_vscode').lazy_load()


  local types = require("luasnip.util.types")
  ls.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "●", "Type" } },
        },
      },
      -- [types.insertNode] = {
      --   active = {
      --     virt_text = { { "●", "Statement" } },
      --   },
      -- },
    },
  }


  -- Keymapping --
  Keymap({ 'i', 's' }, 'jj', function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, Silent)

  Keymap({ 'i', 's' }, 'JJ', function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, Silent)

  Keymap('i', '<C-l>', function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, Silent)

  -- Autocmd --
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*/snippets/*.lua',
    command = [[
      if (getfsize(expand('%:t'))) == 0
        read template.lua
        1;+1d
        w
      endif
    ]]
  })
end
