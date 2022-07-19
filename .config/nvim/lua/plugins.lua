local function conf(name)
  return require(string.format('plug.%s', name))
end

local plugins = {
  { -- Color --
    'luck07051/ui-colors',
  },
  { -- Treesitter --
    'nvim-treesitter/nvim-treesitter',
    config = conf 'treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground'
    },
  },
  { -- LSP --
    'neovim/nvim-lspconfig',
    config = conf 'lsp',
    requires = {
      'williamboman/nvim-lsp-installer',
      'jose-elias-alvarez/null-ls.nvim',
      -- Highlighting other uses of the current word under the cursor
      'RRethy/vim-illuminate',
      -- Function hint
      'ray-x/lsp_signature.nvim',
    },
  },
  { -- CMP --
    'hrsh7th/nvim-cmp',
    config = conf 'cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
    },
  },
  { -- Snipptes --
    'L3MON4D3/LuaSnip',
    config = conf 'luasnip',
    requires = {
      'rafamadriz/friendly-snippets',
    },
  },
  { -- Fuzzy finder --
    'nvim-telescope/telescope.nvim',
    config = conf 'telescope',
    requires = {
      'nvim-lua/plenary.nvim',
      'airblade/vim-rooter',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    config = conf 'lualine',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  },
  {
    'vimwiki/vimwiki',
    config = function()
      vim.cmd [[
        " use markdown syntax
        let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
        " makes vimwiki markdown links ad [text](text.md) instead of [text](text)
        let g:vimwiki_markdown_link_ext = 1
      ]]
    end
  },
  {
    'numToStr/Comment.nvim',
    config = conf 'comment',
  },
  {
    'tpope/vim-surround',
    requires = {
      'tpope/vim-repeat',
    },
  },
  {
    'christoomey/vim-tmux-navigator',
  },
  {
  {
    'norcalli/nvim-colorizer.lua',
    config = conf 'colorizer',
  },
    'akinsho/toggleterm.nvim',
    config = conf 'toggleterm',
  },
  {
    'lewis6991/gitsigns.nvim',
    config = conf 'gitsigns',
  },
}



-- Automatically install packer --{{{
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.cmd [[packadd packer.nvim]]
end
--}}}
-- Autocmd that sync packer whenever you save the plugins.lua file -- {{{
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
--}}}

local ok, packer = pcall(require, 'packer')
if ok then
  -- Packer using popup window -- {{{
  packer.init {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'rounded' }
      end,
    },
  }
  --}}}

  return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
  end)
end
