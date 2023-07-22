
local function d_else(args, snip)
  return

end

return {

  s({
    trig = 'fn',
    name = 'Function',
    dscr = 'Create a normal function',
  }, fmta([[
      def <>:
      <><>
    ]], {
      i(1, 'name'), t('\t'), i(2, 'pass'),
    })
  ),

  s({
    trig = 'f',
    name = 'For loop',
    dscr = 'Create a for loop',
  }, {
      c(1, {
        fmta('for <> in <>:', {
          i(1, 'i'), i(2, 'list') }),
        fmta('for <> in range(<>):', {
          i(1, 'i'), i(2, 'num') }),
        fmta('for <>, <> in enumerate(<>):', {
          i(1, 'i'), i(2, 'j'), i(3, 'list') }),
        fmta('for <>, <> in zip(<>, <>):', {
          i(1, 'i'), i(2, 'j'), i(3, 'list'), i(4, 'list') }),
      }),
      t({'', '\t'}), i(2, 'pass'),
    }
  ),

}
