-------------------------------
--          PLUGINS          --
-------------------------------

-- Setting -- {{{
-- Automatically install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  Packer_bootstrap = vim.fn.system({
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

local packer_group = vim.api.nvim_create_augroup('packer_user_config', {})

vim.api.nvim_create_autocmd('BufwritePost',
  { group = packer_group,
    pattern = { 'plugins.lua' },
    command = [[ source <afile> | PackerSync ]] })

vim.api.nvim_create_autocmd('BufwritePost',
  { group = packer_group,
    pattern = { '*plug/*.lua' },
    command = [[ PackerCompile ]] })

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end
  }
}

local function conf(name)
  return require(string.format('plug.%s', name))
end

--}}}

return packer.startup(function(use)
  use {
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
  }

  use { -- Color Scheme -- --{{{
    'luck07051/uima-colors.nvim'
  }
  --}}}

  use { -- Treesitter -- --{{{
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground',
      -- 'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
      'RRethy/nvim-treesitter-endwise',
    },
    config = conf 'treesitter',
    run = ':TSUpdate',
  }
  --}}}

  use { -- LSP -- --{{{
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
      'jose-elias-alvarez/null-ls.nvim',
      'ray-x/lsp_signature.nvim', -- Function hint
    },
    config = conf 'lsp',
  }
  --}}}

  use { -- Completion -- --{{{
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',

      'saadparwaiz1/cmp_luasnip',
      'ray-x/cmp-treesitter',

      'hrsh7th/cmp-nvim-lua',
      'kdheepak/cmp-latex-symbols'
    },
    config = conf 'cmp',
  }
  --}}}

  use { -- Fuzzy Finder -- --{{{
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'ahmedkhalf/project.nvim',
    },
    config = conf 'telescope',
  }
  --}}}

  use { -- Snipptes -- --{{{
    'L3MON4D3/LuaSnip',
    config = conf 'luasnip'
  }
  --}}}

  use { -- Dashboard -- --{{{
    'glepnir/dashboard-nvim',
    config = conf 'dashboard'
  }
  --}}}

  use { -- Status Line -- --{{{
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = conf 'lualine',
  }
  --}}}

  -- use { -- Note -- --{{{
  --   'nvim-neorg/neorg',
  --   ft = 'norg',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-neorg/neorg-telescope'
  --   },
  --   run = ":Neorg sync-parsers", -- install treesitter parser for neorg
  --   config = conf 'neorg',
  -- }
  -- --}}}


  ---------------------------
  --    Editing Ability    --
  ---------------------------

  use { -- `gc` to comment text --
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  use { -- Surround selections --
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function() require("nvim-surround").setup() end
  }

  use { -- Enhanced <C-A> and <C-X> --
    'monaqa/dial.nvim',
    config = conf 'dial'
  }

  use { -- Align stuff --
    'junegunn/vim-easy-align',
    config = function()
      Keymap('n', 'ga', '<Plug>(EasyAlign)')
      Keymap('x', 'ga', '<Plug>(EasyAlign)')
    end
  }


  --------------------------
  --    Other Function    --
  --------------------------

  use { -- git sign --
    'lewis6991/gitsigns.nvim',
    config = conf 'gitsigns'
  }

  use { -- Focus mode --
    'Pocco81/true-zen.nvim',
    requires = {
      'folke/twilight.nvim',
    },
    config = conf 'zen'
  }

  use { -- scroll animation --
    'karb94/neoscroll.nvim',
    config = conf 'neoscroll'
  }

  use {
    'ziontee113/neo-minimap',
    config = conf 'minimap'
  }

  use {
    'jghauser/follow-md-links.nvim',
    ft = { 'markdown' }
  }

  use { -- <C-t> to call a terminal --
    'akinsho/toggleterm.nvim',
    config = conf 'toggleterm'
  }

  -- use { -- Tmux --
  --   "aserowy/tmux.nvim",
  --   config = conf 'tmux'
  -- }

  use {
    'uga-rosa/ccc.nvim',
    config = function()
      require('ccc').setup({
        highlighter = {
          auto_enable = true,
          filetypes = {},
          excludes = {},
        },
      })
      Keymap('n', '<Leader>cc', ':CccPick<CR>')
      Keymap('i', '<A-c>', '<Plug>(ccc-insert)')
    end
  }

  use {
    'kevinhwang91/nvim-ufo',
    config = conf 'ufo',
    requires = {
      'kevinhwang91/promise-async'
    }
  }


  ------------------------------
  --    Compiler and Viwer    --
  ------------------------------

  -- use {
  --   'lervag/vimtex',
  --   ft = { 'tex' }
  -- }

  use { -- Live Edit html/css/js --
    'turbio/bracey.vim',
    ft = { 'html', 'css', 'js' },
    config = function()
      Keymap('n', '<Leader>le', '<cmd>Bracey<cr>')
      Keymap('n', '<Leader>ls', '<cmd>BraceyStop<cr>')
      Keymap('n', '<Leader>lr', '<cmd>BraceyReload<cr>')
    end,
    run = 'npm install --prefix server'
  }

  use {
    'ellisonleao/glow.nvim'
  }

  -- use { -- Visualize latex in nvim --
  --   'jbyuki/nabla.nvim',
  --   config = function()
  --     vim.cmd [[nnoremap <leader>na :lua require("nabla").popup()<CR>]]
  --     vim.cmd [[nnoremap <leader>nv :lua require("nabla").toggle_virt()<CR>]]
  --   end
  -- }

  if Packer_bootstrap then
    require('packer').sync()
  end
end)
