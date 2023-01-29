local M = {
  'folke/trouble.nvim',
  cmd = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}

M.keys = {
  { '<Leader>xx', '<cmd>TroubleToggle<cr>',                       desc = 'Toggle the trouble list' },
  { '<Leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'trouble list for workspace diagnostics' },
  { '<Leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>',  desc = 'trouble list for document diagnostics' },
  { '<Leader>xq', '<cmd>TroubleToggle quickfix<cr>',              desc = 'trouble list for quickfix' },
  { '<Leader>xl', '<cmd>TroubleToggle loclist<cr>',               desc = 'trouble list for loclist' },
  { 'gR',         '<cmd>TroubleToggle lsp_references<cr>',        desc = 'trouble list for lsp references' },
}

M.opts = {
  use_diagnostic_signs = true,

  action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example: close = {},
    close = 'q', -- close the list
    cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
    refresh = 'r', -- manually refresh
    jump = { '<cr>', '<tab>' }, -- jump to the diagnostic or open / close folds
    open_split = { '<c-x>' }, -- open buffer in new split
    open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
    open_tab = { '<c-t>' }, -- open buffer in new tab
    jump_close = { 'o' }, -- jump to the diagnostic and close the list
    toggle_mode = 'm', -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = 'P', -- toggle auto_preview
    hover = 'K', -- opens a small popup with the full multiline message
    preview = 'p', -- preview the diagnostic location
    close_folds = { 'zM', 'zm' }, -- close all folds
    open_folds = { 'zR', 'zr' }, -- open all folds
    toggle_fold = { 'zA', 'za' }, -- toggle fold of current file
    previous = 'k', -- previous item
    next = 'j' -- next item
  },
}

return M
