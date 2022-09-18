return function()
  local cmp = require 'cmp'

  if not pcall(require, 'luasnip') then return end
  local luasnip = require 'luasnip'

  -- Kind icons --{{{
  local kind_icons = {
    Text = "",
    Variable = "",
    File = "",
    Folder = "",
    Reference = "",

    Snippet = "",
    Function = "",
    Method = "m",
    Value = "",
    Keyword = "",
    Constructor = "",
    Field = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Enum = "",
    Color = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }
  --}}}

  cmp.setup {
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-e>"] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ["<C-y>"] = cmp.mapping(
        cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }, { "i", "c" }),
      ["<C-x>"] = cmp.mapping.close(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
    },

    sources = {
      { name = 'neorg' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'treesitter' },
      { name = 'buffer' },
      { name = 'path' },
    },

    preselect = cmp.PreselectMode.None,
    completion = {
      -- autocomplete = false
      -- keyword_length = 2
    },

    window = {
      -- documentation = {
      --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- },
      documentation = {
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
      },
    },

    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[LUA]",
          luasnip  = "[Snip]",
          buffer   = "[Buff]",
          path     = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },

    --experimental = { ghost_text = true },

    snippet = {
      expand = function(args)
        -- For luasnip --
        luasnip.lsp_expand(args.body)
        -- For UltiSnips --
        --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
  }


  -- Cmdline '/' --{{{
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  --}}}

  -- Cmdline ':' --{{{
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' } })
  })
  --}}}

  -- Close cmp menu when in <C-f> --
  Keymap('c', '<C-f>', '<C-f>i<Esc>')
end
