return function()
  local neorg = require 'neorg'

  neorg.setup {
    load = {
      ["core.defaults"] = {},

      ["core.norg.completion"] = {
        config = {
          engine = 'nvim-cmp'
        }
      },

      ["core.highlights"] = {
        config = {
          highlights = {
            Heading = { --{{{
              ["1"] = {
                Title = "+NeorgTitle1",
                Prefix = "+NeorgTitle1",
              },
              ["2"] = {
                Title = "+NeorgTitle2",
                Prefix = "+NeorgTitle2",
              },
              ["3"] = {
                Title = "+NeorgTitle3",
                Prefix = "+NeorgTitle3",
              },
              ["4"] = {
                Title = "+NeorgTitle4",
                Prefix = "+NeorgTitle4",
              },
              ["5"] = {
                Title = "+NeorgTitle5",
                Prefix = "+NeorgTitle5",
              },
              ["6"] = {
                Title = "+NeorgTitle6",
                Prefix = "+NeorgTitle6",
              },
            }, --}}}

            Markup = {
              Verbatim = {
                [""] = "+PreProc",
              },
            },
          },
        }
      },

      ["core.norg.concealer"] = {
        config = {

          icons = {
            todo = {
              undone = {
                icon = ' ',
              },
            }
          },
          dim_code_blocks = {
            enabled = true,
            width = "content",
          },

        }
      },

    }
  }
end
