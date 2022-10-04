-- Some stuff {{{
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

cs("ssnip", fmt([[
-- Coolest stuff {{{{{{
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

local snippets, autosnippets = {{}}, {{}}
local cs = function(tri, body, opt)
  local snip = s(tri, body)
  if not opt then
    table.insert(snippets, snip)
  else
    table.insert(opt, snip)
  end
end
--}}}}}}
{}
return snippet, autosnippets
]], {
    i(1, "")
  }))

cs("lf", fmt([[
local {} = function({})
  {}
end
]], {
    i(1, "Name"),
    i(2, ""),
    i(3, "-- Content this")
  }))

cs("pc", fmt([[
if not pcall(require, '{}') then return end
local {} = require '{}'

]], {
    i(1, "Name"),
    c(2, { rep(1), i(1, "") }),
    rep(1),
  }))


return snippets, autosnippets
