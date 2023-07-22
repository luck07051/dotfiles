return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  keys = {
    { '<PageDown>', mode = { 'i', 's' }, function()
        require('luasnip').expand_or_jump()
    end },
    { '<PageUp>', mode = { 'i', 's' }, function()
        require('luasnip').jump(-1)
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

  opts = {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    delete_check_events = "TextChanged",
    enable_autosnippets = true,
    store_selection_keys="<Tab>",

    -- ext_opts = {
    --   [require("luasnip.util.types").choiceNode] = {
    --     active = {
    --       virt_text = { { "●", "MatchParen" } },
    --     },
    --   },
    -- },
  },

  init = function()
    require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets/' })
  end
}
