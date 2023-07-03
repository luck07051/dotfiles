return {
  'ggandor/leap.nvim',
  event = 'VimEnter',
  opts = {

  },
  keys = {
    {
      "s",
      mode ={"n", "x", "o"},
      "<Plug>(leap-forward-to)",
      desc = "Leap forward to"
    },
    {
      "S",
      mode = {"n", "x", "o"},
      "<Plug>(leap-backward-to)",
      desc = "Leap backward to",
    },
    {
      "x",
      mode = {"x", "o"},
      "<Plug>(leap-forward-till)",
      desc = "Leap forward till",
    },
    {
      "X",
      mode = {"x", "o"},
      "<Plug>(leap-backward-till)",
      desc = "Leap backward till",
    },
    {
      "gs",
      mode = {"n", "x", "o"},
      "<Plug>(leap-from-window)",
      desc = "Leap from window",
    },
    {
      "gs",
      mode = {"n", "x", "o"},
      "<Plug>(leap-cross-window)",
      desc = "Leap from window",
    },
  },
}
