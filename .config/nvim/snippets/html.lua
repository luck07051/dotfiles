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

cs("html", fmt([[
<!DOCTYPE html>
<html lang="en">
\t<head>
\t\t<meta charset="UTF-8">
\t\t<meta name="viewport" content="width=device-width, initial-scale=1">
\t\t<link href="{}" rel="stylesheet">
\t\t<title>{}</title>
\t</head>
\t<body>
\t\t{}
\t</body>
</html>
]], {
    i(1, "title"),
    i(2, "css/style.css"),
    i(3, "<p>Hello!</p>")
  }))


return snippets, autosnippets
