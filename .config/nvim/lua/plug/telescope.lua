return function()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'

  require("project_nvim").setup {}
  require('telescope').load_extension('projects')

  telescope.setup {
    defaults = {
      path_display = { 'smart' },

      mappings = {
        i = { --{{{
          ["<Esc>"] = actions.close,
          ["<C-c>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-/>"] = actions.which_key,
        },
        --}}}
        n = { --{{{
          ["<Esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,
          ["s"] = actions.select_horizontal,
          ["v"] = actions.select_vertical,
          ["t"] = actions.select_tab,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,

          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["?"] = actions.which_key,
        },
        --}}}
      },
    },

    pickers = {

    },

    extensions = {

      file_browser = { --{{{
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
          },
          ["n"] = {
            -- your custom normal mode mappings
          },
        },
      },
      --}}}

    }
  }

  local map = function(key, opt)
    vim.keymap.set('n', key, ':Telescope ' .. opt .. '<CR>', { noremap = true, silent = true })
  end

  map('<Leader>ff', 'find_files')
  map('<Leader>fe', 'find_files')
  map('<Leader>fb', 'buffers')
  map('<Leader>fs', 'grep_string')
  map('<Leader>fq', 'quickfix')

  map('<Leader>ge', 'diagnostics')
  -- LSP stuff
  map('gd', 'lsp_definitions')
  map('gD', 'lsp_type_definitions')
  map('gi', 'lsp_implementations')
  map('gr', 'lsp_references')

  -- lists command history
  Keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

  -- lists function names, variables
  map('<leader>ft', 'treesitter')

  map('<leader>bb', 'builtin')
  map('<leader>br', 'reloader')
  map('<leader>bs', 'symbols')

  map('<leader>fj', 'projects')

  map('<leader>fl', 'file_browser')

end
