return {
  'jose-elias-alvarez/null-ls.nvim',
  event = "BufReadPre",
  dependencies = {
    'jay-babu/mason-null-ls.nvim'
  },
  config = function()
    require('mason-null-ls').setup {
      ensure_installed = { 'stylua', 'jq' },
      automatic_setup = true,
    }

    require 'null-ls'.setup {
      sources = { }
    }

    require 'mason-null-ls'.setup_handlers()
  end
}
