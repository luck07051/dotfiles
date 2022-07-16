-- Automatically install packer -- {{{
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end --}}}

-- Safe require --
if not pcall(require, 'packer') then return end
local packer = require 'packer'

-- Packer using popup window -- {{{
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
} --}}}
-- Autocmd that sync packer whenever you save the plugins.lua file -- {{{
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]] --}}}

return require('packer').startup(function(use)
    -- Packer can manage itself --
    use 'wbthomason/packer.nvim'
    -- Colorscheme --
    use 'luck07051/ui-colors'
    -- Dependencies --
    use 'nvim-lua/plenary.nvim'

    use 'vimwiki/vimwiki'
    use 'christoomey/vim-tmux-navigator'
    use 'numToStr/Comment.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'akinsho/toggleterm.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    use { 'LhKipp/nvim-nu', run = ':TSInstall nu' }

    -- Treesitter --
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }
    use 'nvim-treesitter/playground'

    -- LSP --
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use'jose-elias-alvarez/null-ls.nvim'
    -- Highlighting other uses of the current word under the cursor
    use 'RRethy/vim-illuminate'
    -- Function hint
    use 'ray-x/lsp_signature.nvim'

    -- CMP --
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snipptes --
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Fuzzy finder --
    use 'nvim-telescope/telescope.nvim'
    use 'airblade/vim-rooter'


    if packer_bootstrap then
        require('packer').sync()
    end
end)
