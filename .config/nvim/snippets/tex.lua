
local function mathzone()
  -- return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
  return true
end

return {

  s({
    trig = 'doc',
    name = 'Documentclass',
    dscr = 'Create a documentclass',
  }, {
    t('\\documentclass{article}')
  }),

  s({
    trig = 'beg',
    name = 'Environments',
    dscr = 'Create a begin/end environments',
  }, fmta([[
      \begin{<>}
      <><><>
      \end{<>}
    ]], {
      i(1, 'document'), t('\t'), f(require('luasnip-util').get_visual), i(2), rep(1),
    })
  ),

  s({
    trig='lrv',
    name='left right',
    dscr='left right',
  }, fmta([[
      \left(<>\right)<>
    ]], {
      f(require('luasnip-util').get_visual), i(1),
  }), {
    condition = mathzone,
    show_condition = mathzone
  }),


}, {

  -- s({
  --   trig = '(%a)(%d)',
  --   regTrig = true,
  --   name = 'Auto subscript',
  --   dscr = 'Auto adding underscore if typing a digit after letters',
  -- }, { f(function(_, snip)
  --     return snip.captures[1] .. '_' .. snip.captures[2]
  --   end),
  -- }, {
  --   condition = mathzone,
  -- }),

  s({
    trig = '(%a)([_^])(%d%d+) ',
    regTrig = true,
    name = 'Auto sub/superscript for multi digits',
    dscr = 'Auto adding surround curly brace on multi digits sub/superscript',
  }, { f(function(_, snip)
    return snip.captures[1] .. snip.captures[2] .. '{' .. snip.captures[3] .. '} '
  end),
  }, {
    condition = mathzone,
  }),


  postfix({
    trig = '.hat ',
    name = 'Auto hat',
    dscr = '',
  }, {
    l('\\hat{' .. l.POSTFIX_MATCH .. '} ')
  }, {
    condition = mathzone,
  }),

}
