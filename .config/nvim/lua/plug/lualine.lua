local M = {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}

M.config = function()
  local lualine = require "lualine"

  -- Customize module
  local function tabsize()
    return ' '..vim.o.tabstop
  end

  local function line_count()
    return '' .. vim.api.nvim_buf_line_count(0)
  end

  lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'uicolors',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },

    -- | A | B | C         X | Y | Z |
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { { 'filename', path = 1 } },
      lualine_c = {
        'branch',
        'diff',
        { 'diagnostics',
          symbols = { error = '✗', warn = '', info = '', hint = '' }
        },
        'navic',
      },

      lualine_x = {
        -- workdir,
        tabsize,
        'encoding',
        { 'filetype', colored = false },
        line_count,
      },
      lualine_y = {},
      lualine_z = { 'progress', 'location' }
    },

    inactive_sections = {
      lualine_a = { { 'filename', path = 1 } },
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

return M
