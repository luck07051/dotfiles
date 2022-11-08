return function()
  local nm = require("neo-minimap")

  nm.setup_defaults({
    width = 44,
    height = 18,
    height_toggle = { 18, 36 },
    win_opts = {
      scrolloff = 2,
    }
  })


  -- Lua -- {{{
  nm.set({ "zy", "zo", "zu" }, "*.lua", {
    -- events = { "BufEnter" },
    -- win_opts = { scrolloff = 1, winhl = "" },
    win_opts = { scrolloff = 1, winhl = "" },

    query = {
      [[
      ;; query
      ((function_declaration) @cap)
      ((assignment_statement(expression_list((function_definition) @cap))))
      ]] ,
      1,
      [[
      ;; query
      ((function_declaration) @cap)
      ((assignment_statement(expression_list((function_definition) @cap))))
      ((field (identifier) @cap) (#eq? @cap "keymaps"))
      ]] ,
      [[
      ;; query
      ((for_statement) @cap)
      ((function_declaration) @cap)
      ((assignment_statement(expression_list((function_definition) @cap))))
      ((function_call (identifier)) @cap (#vim-match? @cap "^__*" ))
      ((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap)
      ]] ,
      [[
      ;; query
      ((for_statement) @cap)
      ((function_declaration) @cap)
      ((assignment_statement(expression_list((function_definition) @cap))))
      ]] ,
    },

    regex = {
      {},
      { [[^\s*--\s\+\w\+]], [[--\s*=]] },
      { [[^\s*--\s\+\w\+]], [[--\s*=]] },
      {},
    },

    search_patterns = {
      { "function", "<C-j>", true },
      { "function", "<C-k>", false },
      { "keymap", "<A-j>", true },
      { "keymap", "<A-k>", false },
    },
  })
  -- }}}

  -- laTex -- {{{
  nm.set({ "zo", "zu" }, "*.tex", {
    win_opts = { scrolloff = 1, winhl = "" },
    events = { "BufEnter" },

    query = {},
    regex = {
      { [[\\section]], [[\\subsection]], [[\\subsubsection]] },
      { [[\\begin{.*}]] },
    },
  })
  -- }}}

  -- TS and JS -- {{{
  nm.set("zi", { "typescriptreact", "javascriptreact" }, {
    win_opts = { scrolloff = 1, winhl = "" },

    query = [[
    ;; query
    ((function_declaration) @cap)
    ((arrow_function) @cap)
    ((identifier) @cap (#vim-match? @cap "^use.*"))
    ]] ,
  })
  -- }}}

end
