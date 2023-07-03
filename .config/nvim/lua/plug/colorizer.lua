return {
  'norcalli/nvim-colorizer.lua',
  -- event = 'VeryLazy',
  event = "BufReadPre",
  config = function()
    require('colorizer').setup(
      {
        '*';
        css = {
          css = true;
          css_fn = true;
        };
      },
      {
        RRGGBBAA = true;
        rgb_fn = true;
        hsl_fn = true;
      }
    )
  end
}
