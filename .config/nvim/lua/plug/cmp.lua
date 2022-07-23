if not pcall(require, 'cmp') then return end
local cmp = require 'cmp'

if not pcall(require, 'luasnip') then return end
local luasnip = require 'luasnip'

-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.completeopt = { "menu", "menuone" }

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

-- mapping function
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  mapping = {
    ['<C-n>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<C-p>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ["<C-z>"] = cmp.mapping.abort(),
    ["<C-x>"] = cmp.mapping.close(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }, { "i", "c" }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },

  completion = {
    -- autocomplete = false
    -- keyword_length = 2
  },

  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
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
