local M = {
  'glepnir/dashboard-nvim',
  name = 'dashboard',
  lazy = false,
}

-- FIX: dont work now

M.opts = {
  custom_center = {
    -- {
    --   icon = '  ',
    --   desc = 'Find  File                              ',
    --   action = 'FzfLua files',
    --   shortcut = 'f  '
    -- },
    -- {
    --   icon = '  ',
    --   desc = 'Find  Project                           ',
    --   action = 'Telescope projects',
    --   shortcut = 'p  '
    -- },
    {
      icon = '  ',
      desc = 'New File                                ',
      action = 'DashboardNewFile',
      shortcut = 'e  '
    },
    {
      icon = '  ',
      desc = 'Quit                                    ',
      action = 'quit',
      shortcut = 'q  '
    },
  },

  custom_header = {
    '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  },

  custom_footer = {},

  header_pad = 3,
  center_pad = 3,
}

return M
