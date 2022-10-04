return function()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'

  telescope.setup {
    defaults = {
      -- border = false,

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
      -- find_files = {
      --   theme = "ivy",
      -- }
    },
    extensions = {
    }
  }

  local builtin = '<cmd>lua require("telescope.builtin").'
  Keymap('n', '<CR>', builtin .. 'find_files()<cr>', Silent)
  -- Keymap('n', '<Leader>fb', builtin .. 'buffers()<cr>', Silent)
  -- Keymap('n', '<Leader>fl', builtin .. 'grep_string()<cr>', Silent)

  Keymap('n', '<Leader>fe', builtin .. 'diagnostics()<cr>', Silent)
  Keymap('n', 'gd', builtin .. 'lsp_definitions()<cr>', Silent)
  Keymap('n', 'gD', builtin .. 'lsp_type_definitions()<cr>', Silent)
  Keymap('n', 'gi', builtin .. 'lsp_implementations()<cr>', Silent)
  Keymap('n', 'gr', builtin .. 'lsp_references()<cr>', Silent)
end
