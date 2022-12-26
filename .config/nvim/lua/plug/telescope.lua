local M = {
  'nvim-telescope/telescope.nvim',
  cmd = { 'Telescope' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
  }
}

M.config = function()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'

  telescope.setup({
    defaults = {
      path_display = { 'smart' },

      mappings = {
        i = {
          ["<Esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
        },
      },
    },
  })

  require("project_nvim").setup()
  telescope.load_extension('projects')

end

M.keys = {
  { '<M-f>',      function() require('telescope.builtin').find_files() end },
  { '<Leader>fj', ':Telescope projects<CR>' },
  { '<Leader>fb', function() require('telescope.builtin').buffers() end },
  { '<Leader>fq', function() require('telescope.builtin').quickfix() end },
  { '<Leader>fs', function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') }) end },

  { '<Leader>gd', function() require('telescope.builtin').diagnostics() end },
  { 'gd',         function() require('telescope.builtin').lsp_definitions() end },
  { 'gD',         function() require('telescope.builtin').lsp_type_definitions() end },
  { 'gi',         function() require('telescope.builtin').lsp_implementations() end },
  { 'gr',         function() require('telescope.builtin').lsp_references() end },

  { '<Leader>ft', function() require('telescope.builtin').treesitter() end },

  { '<Leader>bb', function() require('telescope.builtin').builtin() end },
  { '<Leader>br', function() require('telescope.builtin').reloader() end },
  { '<Leader>bs', function() require('telescope.builtin').symbols() end },
}

return M
