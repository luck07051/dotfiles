-- vim: foldmethod=indent foldlevel=4
return function()
  local neorg = require 'neorg'

  neorg.setup {
    load = {
      ["core.defaults"] = {},

      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            main = "~/notes",
          }
        }
      },

      ["core.highlights"] = {
        config = {
          highlights = {
            headings = {
              ["1"] = {
                title = "+NeorgHeading1",
                prefix = "+NeorgHeading1",
              },
              ["2"] = {
                title = "+NeorgHeading2",
                prefix = "+NeorgHeading2",
              },
              ["3"] = {
                title = "+NeorgHeading3",
                prefix = "+NeorgHeading3",
              },
              ["4"] = {
                title = "+NeorgHeading4",
                prefix = "+NeorgHeading4",
              },
              ["5"] = {
                title = "+NeorgHeading5",
                prefix = "+NeorgHeading5",
              },
              ["6"] = {
                title = "+NeorgHeading6",
                prefix = "+NeorgHeading6",
              },
            },
          },

          dim = {
            tags = {
              ranged_verbatim = {
                code_block = {
                  reference = "NeorgCodeBlock",
                  percentage = 10,
                  affect = "background",
                },
                begin = {
                  reference = "Normal",
                  percentage = 10,
                  affect = "fg",
                },
              }
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
            conceal = true,
          },
        }
      },

      ["core.keybinds"] = {
        config = {

        }
      },

      ["core.norg.completion"] = {
        config = {
          engine = 'nvim-cmp'
        }
      },

    }
  }
end
