return function()
  local lualine = require "lualine"

  -- Customize module
  local function tabsize()
    return ' '..vim.o.tabstop
  end

  lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'uima-colors',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },

    -- | A | B | C         X | Y | Z |
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'filename' },
      lualine_c = {
        'branch',
        'diff',
        { 'diagnostics',
          symbols = { error = '✗', warn = '', info = '', hint = '' }
        },
      },

      lualine_x = {
        tabsize,
        'encoding',
        { 'filetype', colored = false },
        '%L'
      },
      lualine_y = {},
      lualine_z = { 'progress', 'location' }
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' }
    },
    tabline = {},
    extensions = {}
  }
  vim.opt.showmode = false
end
