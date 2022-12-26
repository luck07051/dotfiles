local M = {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
}

M.config = function()
  local lualine = require "lualine"

  -- Customize module
  local function workdir()
    local dir = vim.fn.getcwd()
    dir = dir:gsub(os.getenv('HOME'), '~')
    if dir:len() > 20 then
      dir = '../' .. dir:match('([^/]*/[^/]*)$')
    end
    return ' ' .. dir
  end

  local function relative_path()
    if vim.fn.expand('%'):match('^term://') then
      return ''
    end
    local dir = vim.fn.getcwd()
    return vim.fn.expand('%:' .. dir .. ':.')
  end

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
      lualine_b = { relative_path },
      lualine_c = {
        'branch',
        'diff',
        { 'diagnostics',
          symbols = { error = '✗', warn = '', info = '', hint = '' }
        },
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

return M
