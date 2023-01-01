local M = {
  'L3MON4D3/LuaSnip',
  event = 'VeryLazy',
}

-- snippets collection:
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/molleweide/LuaSnip-snippets.nvim
M.config = function()
  local ls = require "luasnip"

  require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets/' })
  -- require('luasnip.loaders.from_vscode').lazy_load()

  ls.setup({
    history = true,
    -- updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
    -- ext_opts = {
    --   [ls.util.types.choiceNode] = {
    --     active = {
    --       virt_text = { { "●", "Type" } },
    --     },
    --   },
    --   -- [types.insertNode] = {
    --   --   active = {
    --   --     virt_text = { { "●", "Statement" } },
    --   --   },
    --   -- },
    -- },
  })

  -- vim.keymap.setping --
  vim.keymap.set({ 'i', 's' }, 'jj', function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true } )

  vim.keymap.set({ 'i', 's' }, 'JJ', function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true } )

  vim.keymap.set('i', '<C-l>', function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true } )

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

return M
