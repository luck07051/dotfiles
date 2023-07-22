return {

  s({
    trig = 'link',
    name = 'Link',
    dscr = '',
  }, fmta([[[<>](<>)]], {
      i(1, 'Text'), i(2, 'URL'),
    })
  ),

  s({
    trig = 'img',
    name = 'Image',
    dscr = '',
  }, fmta([[![<>](<>)]], {
      i(1, 'Text'), i(2, 'URL'),
    })
  ),

}
