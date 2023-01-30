local M = {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}

M.opts = {
  -- doom or hyper
  theme = 'hyper',

  config = {
    header = {
      '', '', '',
      '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      '', '', '',
    },

    footer = {},

    shortcut = {
      { desc = ' Find File', key = 'f', group = 'diffFile', action = 'FzfLua files' },
      { desc = ' New File',  key = 'e', group = 'diffFile', action = 'enew', },
      { desc = ' Quit',      key = 'q', group = 'diffFile', action = 'quit' },
    },
    project = { limit = 8, icon = '  ', label = 'Recent Projects:', action = 'FzfLua files cwd=' },
    mru = { limit = 10, icon = '  ', label = 'Most Recent Files:', },

    center = {
      {
        icon = '  ',
        desc = 'Find  File                     ',
        action = 'FzfLua files',
        key = 'f',
      },
      {
        icon = '  ',
        desc = 'Find  Project                  ',
        action = 'Telescope projects',
        key = 'p'
      },
      {
        icon = '  ',
        desc = 'New File                       ',
        action = 'DashboardNewFile',
        key = 'e'
      },
      {
        icon = '  ',
        desc = 'Quit                           ',
        action = 'quit',
        key = 'q'
      },
    },
  },

}

return M
