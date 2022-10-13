return function()
  local db = require('dashboard')

  db.custom_center = {
    {
      icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files',
      shortcut = 'f  '
    },
    {
      icon = '  ',
      desc = 'Find  Project                           ',
      action = 'Telescope projects',
      shortcut = 'p  '
    },
    {
      icon = '  ',
      desc = 'Quit                                    ',
      action = 'quit',
      shortcut = 'q  '
    },
  }

  db.custom_header = {
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  }

  db.custom_footer = {}

  db.header_pad = 3
  db.center_pad = 3

end
