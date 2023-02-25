local M = {
  'ibhagwan/fzf-lua',
  cmd = { 'FzfLua' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  }
}

M.keys = {
  { '<Leader>fe', function() require('fzf-lua').files() end,     desc = 'FzfLua for files' },
  { '<Leader>fs', function() require('fzf-lua').live_grep() end, desc = 'FzfLua for live_grep' },

  { '<Leader>gd', function() require('fzf-lua').lsp_declarations() end,    desc = 'FzfLua for lsp_declarations' },
  { 'gd',         function() require('fzf-lua').lsp_definitions() end,     desc = 'FzfLua for lsp_definitions' },
  { 'fD',         function() require('fzf-lua').lsp_typedefs() end,        desc = 'FzfLua for lsp_typedefs' },
  { 'gi',         function() require('fzf-lua').lsp_implementations() end, desc = 'FzfLua for lsp_implementations' },
  { 'gr',         function() require('fzf-lua').lsp_references() end,      desc = 'FzfLua for lsp_references' },

  { '<Leader>man', function() require('fzf-lua').man_pages() end, desc = 'FzfLua for man_pages' },
}

M.opts = {
  winopts = {
    hl = {
      normal         = 'NormalFloat',        -- window normal color (fg+bg)
      border         = 'FloatBorder',   -- border color
      help_normal    = 'Normal',        -- <F1> window normal
      help_border    = 'FloatBorder',   -- <F1> window border
      -- Only used with the builtin previewer:
      cursor         = 'Cursor',        -- cursor highlight (grep/LSP matches)
      cursorline     = 'CursorLine',    -- cursor line
      cursorlinenr   = 'CursorLineNr',  -- cursor line number
      search         = 'IncSearch',     -- search matches (ctags|help)
      title          = 'Normal',        -- preview border title (file/buffer)
      -- Only used with 'winopts.preview.scrollbar = 'float'
      scrollfloat_e  = 'PmenuSbar',     -- scrollbar "empty" section highlight
      scrollfloat_f  = 'PmenuThumb',    -- scrollbar "full" section highlight
      -- Only used with 'winopts.preview.scrollbar = 'border'
      scrollborder_e = 'FloatBorder',   -- scrollbar "empty" section highlight
      scrollborder_f = 'FloatBorder',   -- scrollbar "full" section highlight
    },
  },
}

return M
