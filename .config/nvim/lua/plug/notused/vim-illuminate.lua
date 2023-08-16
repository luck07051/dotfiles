return { -- Cursor highlight
  'RRethy/vim-illuminate',
  event = 'LspAttach',
  config = function()
    require('illuminate').configure({
      delay = 50
    })
  end
}
