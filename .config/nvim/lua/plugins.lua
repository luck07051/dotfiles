-- Coolest stuff {{{
-- Automatically install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.cmd [[packadd packer.nvim]]
end

-- require packer in safe way
if not pcall(require, 'packer') then return end
local packer = require 'packer'

-- Autocmd that sync packer whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- init
-- packer.init {
--   display = {
--     open_fn = function()
--       return require('packer.util').float { border = 'rounded' }
--     end,
--   },
-- }

packer.init {
  log = { level = 'trace' },
}

local function conf(name)
  return require(string.format('plug.%s', name))
end

--}}}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use { -- Color --
    'luck07051/ui-colors',
    config = function() print("this didn't work") end,
    run = function() print("this same") end
  }

  use { -- Treesitter --
    'nvim-treesitter/nvim-treesitter',
    config = conf 'treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground'
    },
  }

  use { -- LSP --
    'neovim/nvim-lspconfig',
    config = conf 'lsp',
    requires = {
      'williamboman/nvim-lsp-installer',
      'jose-elias-alvarez/null-ls.nvim',
      'RRethy/vim-illuminate', -- Highlight the keyword under the cursor
      'ray-x/lsp_signature.nvim', -- Function hint
    },
  }

  use { -- CMP --
    'hrsh7th/nvim-cmp',
    config = conf 'cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter'
    },
  }

  use { -- Snipptes --
    'L3MON4D3/LuaSnip',
    config = conf 'luasnip',
    requires = {
      'rafamadriz/friendly-snippets',
    },
  }

  use { -- Fuzzy finder --
    'nvim-telescope/telescope.nvim',
    config = conf 'telescope',
    requires = {
      'nvim-lua/plenary.nvim',
      -- 'airblade/vim-rooter',
      {
        "ahmedkhalf/project.nvim",
        config = require("project_nvim").setup {}
      },
    },
  }

  use { -- Status Line --
    'nvim-lualine/lualine.nvim',
    config = conf 'lualine',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }

  use { -- Note --
    'nvim-neorg/neorg',
    config = conf 'neorg',
    requires = "nvim-lua/plenary.nvim",
  }

  -- use { -- Note --
  --   'vimwiki/vimwiki',
  --   config = vim.cmd[[
  --     " use markdown syntax
  --     let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
  --     " makes vimwiki markdown links ad [text](text.md) instead of [text](text)
  --     let g:vimwiki_markdown_link_ext = 1
  --   ]]
  -- }

  use { -- Tmux --
    "aserowy/tmux.nvim",
    config = require("tmux").setup({
        copy_sync = {
          enable = true,
        },
        navigation = {
          cycle_navigation = false,
          enable_default_keybindings = true,
        },
        resize = {
          enable_default_keybindings = true,
          resize_step_x = 4,
          resize_step_y = 2,
        }
      })
  }

  use { -- gc to comment text --
    'numToStr/Comment.nvim',
    config = require('Comment').setup(),
  }

  use { -- Add ys,cs,ds method --
    'tpope/vim-surround',
    requires = {
      'tpope/vim-repeat',
    },
  }

  use { -- Use <C-a>/<C-x> on date --
    'tpope/vim-speeddating',
  }

  use { -- Preview registers content --
    'tversteeg/registers.nvim',
    config = vim.cmd [[
      let g:registers_delay = 75
      let g:registers_window_border = "rounded"
      let g:registers_window_max_width = 40
    ]]
  }

  use { -- <C-t> to use terminal --
    'akinsho/toggleterm.nvim',
    config = conf 'toggleterm',
  }

  use { --  --
    'lewis6991/gitsigns.nvim',
    config = conf 'gitsigns',
  }

  use { -- stabilize buffer on window open/close --
    'luukvbaal/stabilize.nvim',
    config = require("stabilize").setup(),
  }

  use { -- Display color on color code --
    'norcalli/nvim-colorizer.lua',
    config = require('colorizer').setup(),
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
