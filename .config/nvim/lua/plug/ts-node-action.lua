return {
  'ckolkey/ts-node-action',
  dependencies = { 'nvim-treesitter', 'tpope/vim-repeat' },
  keys = {
    -- { '<enter>', function() require('ts-node-action').node_action() end, desc = 'Trigger Node Action' }
    { '<enter>',  function()
      local has_ufo, ufo = pcall(require, 'ufo')
        if has_ufo then
          local winid = ufo.peekFoldedLinesUnderCursor()
          if not winid then require('ts-node-action').node_action() end
        else
          require('ts-node-action').node_action()
        end
      end,
      desc = 'Ufo fold peek or trigger node action'
    },
  },
  opts = {}

  -- TODO: toggle and/or, ||/&&
}
