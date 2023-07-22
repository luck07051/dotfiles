local M = {
  'L3MON4D3/LuaSnip',
  event = 'VeryLazy',
  keys = {
    -- { '<C-s>', mode = { 'i', 's' }, function()
    { '<PageDown>', mode = { 'i', 's' }, function()
      -- if require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      -- end
    end },
    -- { '<C-S-s>', mode = { 'i', 's' }, function()
    { '<PageUp>', mode = { 'i', 's' }, function()
      -- if require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      -- end
    end },
    { '<C-l>', mode = { 'i', 's' }, function()
      if require('luasnip').choice_active() then
        require('luasnip').change_choice(1)
      end
    end },
    { '<C-S-l>', mode = { 'i', 's' }, function()
      if require('luasnip').choice_active() then
        require('luasnip').change_choice(-1)
      end
    end },
  },
}

M.config = function()
  local ls = require "luasnip"
  local types = require("luasnip.util.types")

  require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets/' })
  -- require('luasnip.loaders.from_vscode').lazy_load()

  ls.setup({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    delete_check_events = "TextChanged",
    enable_autosnippets = true,
    store_selection_keys="<Tab>",

    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "●", "MatchParen" } },
        },
      },
    },

    snip_env = {
    },
  })
end

return M
