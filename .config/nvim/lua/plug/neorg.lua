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
            gtd = "~/gtd"
          }
        }
      },

      ["core.gtd.base"] = {
        config = {
          workspace = "gtd",
        },
      },

      ["core.keybinds"] = {
        config = {
          keybind_presets = {
            neorg = function(keybinds)
              local leader = keybinds.leader

              -- Map all the below keybinds only when the "norg" mode is active
              keybinds.map_event_to_mode("norg", {
                n = {
                  -- Switches the task under the cursor between a select few states
                  { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },


                  -- Captures a task
                  -- ^Task Capture
                  { leader .. "tc", "core.gtd.base.capture" },

                  -- Short for "task views", show a view selection menu
                  -- ^Task View
                  { leader .. "tv", "core.gtd.base.views" },

                  -- Short for "task edit", lets you edit a task
                  -- ^Task Edit
                  { leader .. "te", "core.gtd.base.edit" },

                  -- Creates a new .norg file to take notes in
                  -- ^New Note
                  { leader .. "nn", "core.norg.dirman.new.note" },


                  -- Hop to the destination of the link under the cursor
                  { "<CR>", "core.norg.esupports.hop.hop-link" },
                  { "gd", "core.norg.esupports.hop.hop-link" },

                  -- Same as `<CR>`, except opens the destination in a vertical split
                  { "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit" },
                  { "gD", "core.norg.esupports.hop.hop-link", "vsplit" },

                  -- Telescope
                  { "<C-s>", "core.integrations.telescope.find_linkable" },


                  -- Move to the next heading in the document
                  { "J", "core.integrations.treesitter.next.heading" },
                  -- Move to the previous heading in the document
                  { "K", "core.integrations.treesitter.previous.heading" },

                },

                i = {
                  -- Telescope
                  { "<C-l>", "core.integrations.telescope.insert_link" },
                }
              }, {
                  silent = true,
                  noremap = true,
              })

              keybinds.map_event_to_mode("toc-split", {
                n = {
                  -- Hop to the target of the TOC link
                  { "<CR>", "core.norg.qol.toc.hop-toc-link" },
                  { "gd", "core.norg.qol.toc.hop-toc-link" },

                  -- Closes the TOC split
                  -- ^Quit
                  { "q", "core.norg.qol.toc.close" },

                  -- Closes the TOC split
                  -- ^escape
                  { "<Esc>", "core.norg.qol.toc.close" },
                },
              }, {
                  silent = true,
                  noremap = true,
                  nowait = true,
              })

              -- Map the below keys on gtd displays
              keybinds.map_event_to_mode("gtd-displays", {
                n = {
                  { "<CR>", "core.gtd.ui.goto_task" },

                  -- Keys for closing the current display
                  { "q", "core.gtd.ui.close" },
                  { "<Esc>", "core.gtd.ui.close" },

                  { "e", "core.gtd.ui.edit_task" },
                  { "<Tab>", "core.gtd.ui.details" },
                },
              }, {
                  silent = true,
                  noremap = true,
                  nowait = true,
              })

              -- Map the below keys on presenter mode
              keybinds.map_event_to_mode("presenter", {
                n = {
                  { "<CR>", "core.presenter.next_page" },
                  { "l", "core.presenter.next_page" },
                  { "h", "core.presenter.previous_page" },

                  -- Keys for closing the current display
                  { "q", "core.presenter.close" },
                  { "<Esc>", "core.presenter.close" },
                },
              }, {
                  silent = true,
                  noremap = true,
                  nowait = true,
              })

              -- Apply the below keys to all modes
              keybinds.map_to_mode("all", {
                n = {
                  { leader.."toc", ":Neorg toc split<CR>" },
                  { leader.."tan", ":Neorg tangle current-file<CR>" },
                  { leader.."pow", ":Neorg presenter start<CR>" },
                },
              }, {
                  silent = true,
                  noremap = true,
              })
            end,
          },
        }
      },

      ["core.highlights"] = {
        config = {
          highlights = {
          },

          dim = {
            tags = {
              ranged_verbatim = {
                code_block = {
                  reference = "CursorLine",
                  percentage = 30,
                  affect = "background",
                },
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
            padding = {
              left = 2,
              right = 2,
            },
            adaptive = false,
            content_only = false,
            conceal = false,
          },
        }
      },

      ["core.norg.completion"] = {
        config = {
          engine = 'nvim-cmp'
        }
      },

      ["core.norg.qol.todo_items"] = {
        config = {
          -- The order of cycling between todo items
          order = {
            { "undone",    " " },
            { "done",      "x" },
            { "pending",   "-" },
            { "on_hold",   "=" },
            { "cancelled", "_" },
            { "important", "!" },
            { "recurring", "+" },
          },
        }
      },

      ["core.norg.qol.toc"] = {
        config = {
          close_split_on_jump = false,
        }
      },

      ["core.presenter"] = {
        config = {
          zen_mode = "truezen",
        }
      },

      ["core.integrations.telescope"] = {

      },

    }
  }
end
