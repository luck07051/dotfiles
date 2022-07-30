-- Coolest stuff {{{
local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

local snippets, autosnippets = {}, {}
local cs = function(tri, body, opt)
  local snip = s(tri, body)
  if not opt then
    table.insert(snippets, snip)
  else
    table.insert(opt, snip)
  end
end
--}}}


cs("link", { t("["), i(1, "Text"), t("]("), i(2, "URL"), t(")") })
cs("img", { t("!["), i(1, "Text"), t("]("), i(2, "URL"), t(")") })


return snippets, autosnippets
