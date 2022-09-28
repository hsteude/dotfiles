-- This file can be loaded by calling `lua require('plugins')` from your
-- init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- key mapping viz
  use {'folke/which-key.nvim',
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }



local null_ls = require("null-ls")

-- using register method
null_ls.register({ autopep8 })
  -- Markdown preview
  -- Did not run on new macbook
  --use { 'iamcco/markdown-preview.nvim', ft = 'markdown', run = 'cd app && yarn install' }
  -- install without yarn or npm
  use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

  -- git diff in sign column
  --use 'airblade/vim-gitgutter'
  --use 'lewis6991/gitsigns.nvim'

  -- status line at the buttom
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- fancy tab line
  use {'akinsho/bufferline.nvim', tag = "v2.*",
      requires = 'kyazdani42/nvim-web-devicons'}

  -- git plugins
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {'lewis6991/gitsigns.nvim'}
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- colorschemes
  --use 'Shatur/neovim-ayu'
  --use  "ellisonleao/gruvbox.nvim"
  --use "savq/melange"
  --use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use 'rmehri01/onenord.nvim'

  -- proper folding for python
  use 'tmhedberg/SimpylFold'

  -- easy commenting out of code
  use 'scrooloose/nerdcommenter'

  -- prettier status line
  --use 'vim-airline/vim-airline-themes'
  --use 'vim-airline/vim-airline'

  -- LaTeX plugin
  use 'lervag/vimtex'

  -- file explorer
  use 'scrooloose/nerdtree'

  -- git indications in nerdtree
  use 'Xuyuanp/nerdtree-git-plugin'

  -- super important icons in nerdtree!!!
  use 'ryanoasis/vim-devicons'

  -- Fancy start screen
  use 'mhinz/vim-startify'

  -- telescope is a fuzz finder for filenames, their contents and more
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'  -- dependency of telescope

  -- Shows register overview
  use 'gennaro-tedesco/nvim-peekup'

  -- Move current selection up (down) with Alt-k (Alt-j)
  use 'matze/vim-move'

  --Cchange/add/delete `sourroundings`
  use 'tpope/vim-surround'

  -- NeoVim LpSP config
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- lsp toggle
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'

  -- Zen Mode
  use 'folke/zen-mode.nvim'

end)


