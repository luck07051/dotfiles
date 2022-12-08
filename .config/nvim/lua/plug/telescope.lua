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

  map('<M-e>', 'find_files')
  map('<Leader>fj', 'projects')
  map('<Leader>fb', 'buffers')
  map('<Leader>fs', 'grep_string')
  map('<Leader>fq', 'quickfix')

  map('<Leader>gd', 'diagnostics')
  map('gd', 'lsp_definitions')
  map('gD', 'lsp_type_definitions')
  map('gi', 'lsp_implementations')
  map('gr', 'lsp_references')

  -- lists command history
  Keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

  -- lists function names, variables
  map('<Leader>ft', 'treesitter')

  map('<Leader>bb', 'builtin')
  map('<Leader>br', 'reloader')
  map('<Leader>bs', 'symbols')



  Find_file_under_cursor = function() -- {{{
    require 'telescope.builtin'.find_files({
      find_command = { 'fd', vim.fn.expand("<cword>") },
      on_complete = {
        function(picker)
          -- remove this on_complete callback
          picker:clear_completion_callbacks()
          -- if we have no match, dont open menu
          if picker.manager.linked_states.size == 0 then
            require("telescope.actions").close(picker.prompt_bufnr)
          -- if we have exactly one match, select it
          -- elseif picker.manager.linked_states.size == 1 then
          --   require("telescope.actions").select_default(picker.prompt_bufnr)
          end
        end,
      },
    })
  end -- }}}
  -- Keymap('n', 'gf', ':lua Find_file_under_cursor()<CR>', Silent)

end
