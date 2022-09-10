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

if not pcall(require, 'packer') then return end
local packer = require 'packer'

-- Autocmd that sync packer whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

local function conf(name)
  return require(string.format('plug.%s', name))
end

--}}}

-- https://github.com/pwntester/octo.nvim
-- Edit and review GitHub issues and pull requests from the comfort of your favorite editor

-- https://github.com/kevinhwang91/nvim-bqf#quickstart
-- Better quickfix window in Neovim, polish old quickfix window.

-- https://github.com/danymat/neogen
-- A better annotation generator. Supports multiple languages and annotation conventions.

-- https://github.com/simrat39/rust-tools.nvim
-- Tools for better development in rust using neovim's builtin lsp

-- https://github.com/TimUntersberger/neogit
-- magit for neovim

-- https://github.com/mfussenegger/nvim-dap
-- Debug Adapter Protocol client implementation for Neovim
--
-- https://github.com/rcarriga/nvim-dap-ui
-- https://github.com/Pocco81/dap-buddy.nvim

-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- Syntax aware text-objects, select, move, swap, and peek support


return packer.startup(function(use)
  use {
    'wbthomason/packer.nvim'
  }

  use { -- Speed up startup time --
    'lewis6991/impatient.nvim'
  }

  use { -- Color --
    'luck07051/ui-colors'
  }

  use { -- Treesitter --
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
      'RRethy/nvim-treesitter-endwise',
    },
    config = conf 'treesitter',
    run = ':TSUpdate',
  }

  use { -- LSP --
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
      'jose-elias-alvarez/null-ls.nvim',
      'ray-x/lsp_signature.nvim', -- Function hint
    },
    config = conf 'lsp',
  }

  use { -- CMP --
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
    },
    config = conf 'cmp',
  }

  use { -- Snipptes --
    'L3MON4D3/LuaSnip',
    config = conf 'luasnip'
  }

  use { -- Fuzzy finder --
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = conf 'telescope',
  }

  use{ -- Auto cd to project dir --
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end,
  }

  use { -- Status Line --
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = conf 'lualine',
  }

  use { -- Note --
    'nvim-neorg/neorg',
    requires = "nvim-lua/plenary.nvim",
    config = conf 'neorg',
  }

  -- use { -- Tmux --
  --   "aserowy/tmux.nvim",
  --   config = conf 'tmux'
  -- }

  use { -- gc to comment text --
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  use { -- Surround selections --
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  use { -- Enhanced <C-A> and <C-X> --
    'monaqa/dial.nvim',
    config = conf 'dial'
  }

  use {
    'junegunn/vim-easy-align',
    config = function()
      Keymap('n', 'ga', '<Plug>(EasyAlign)')
      Keymap('x', 'ga', '<Plug>(EasyAlign)')
    end
  }

  use { -- <C-t> to use terminal --
    'akinsho/toggleterm.nvim',
    config = conf 'toggleterm'
  }

  use { -- git sign --
    'lewis6991/gitsigns.nvim',
    config = conf 'gitsigns'
  }

  use { -- scroll animation --
    'karb94/neoscroll.nvim',
    config = conf 'neoscroll'
  }

  use { -- Spell checker with TS support --
    'lewis6991/spellsitter.nvim',
    config = function() require('spellsitter').setup() end
  }

  use { -- Display color on color code --
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

  use {
    'ziontee113/color-picker.nvim',
    config = function()
      require("color-picker")
      vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", Silent)
      vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", Silent)
    end
  }

  use { -- Visualize latex in nvim --
    'jbyuki/nabla.nvim',
    config = function()
      vim.cmd [[nnoremap <leader>na :lua require("nabla").popup()<CR>]]
      vim.cmd [[nnoremap <leader>nv :lua require("nabla").toggle_virt()<CR>]]
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
