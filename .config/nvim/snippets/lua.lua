return {

  s({
    trig = 'sn',
    name = 'Snipets',
    dscr = 'Create a snippet',
  }, fmta([[
    <>({
      trig = '<>',
      <>name = '<>',
      dscr = '<>',
    }, <><>),
    ]], {
      c(1, { i(nil, 's'), i(nil, 'postfix') }),
      i(2, 'Trig'),
      c(3, { t(''), t({'regTrig = true,', '\t'}), }),
      i(4, 'Name'),
      i(5, 'Dscr'),
      c(6, {
        sn(nil, { t({'{'}), i(1), t({'}'}) }),
        sn(nil, {
          t({'fmta([[', ''}),
          t('\t\t'), i(1, 'Text'),
          t({'', '\t]], {', ''}),
          t('\t'), i(2, 'Node'),
          t({'', '})'}),
        }),
      }),
      c(7, {
        t(''),
        sn(nil, {
          t({', {', '\tcondition = '}),
          i(1, 'cond'),
          t({',', '}'}),
        }),
      }),
    })
  ),

  s({
    trig = 'lf',
    name = 'Local Function',
    dscr = 'Create a local function',
  }, fmta([[
    local function <>(<>)
    <><><>
    end
    ]], {
      i(1, 'name'), i(2),
      t('\t'), f(require('luasnip-util').get_visual), i(3),
    })
  ),

  s({
    trig = 'f',
    name = 'For loop',
    dscr = 'Create a for loop',
  }, {
      c(1, {
        fmta('for <> in <> do', {i(1, 'i'), i(2, 'table')}),
        fmta('for <>, <> in pairs(<>) do', {i(1, 'i'), i(2, 'j'), i(3, 'table')}),
        fmta('for <>, <> in ipairs(<>) do', {i(1, 'i'), i(2, 'j'), i(3, 'table')}),
        fmta('for <>=<>,<> do', {i(1, 'i'), i(2, '0'), i(3, '10')}),
        fmta('for <>=<>,<>,<> do', {i(1, 'i'), i(2, '0'), i(3, '10'), i(4, '2')}),
      }),
      t({'', '\t'}), f(require('luasnip-util').get_visual), i(2),
      t({'', 'end'})
    }
  ),

  s({
    trig = 'w',
    name = 'While loop',
    dscr = 'Create a while loop',
  }, {
      t('while '), i(1, 'cond'), t(' do'),
      t({'', '\t'}), f(require('luasnip-util').get_visual), i(2),
      t({'', 'end'})
    }
  ),

}
