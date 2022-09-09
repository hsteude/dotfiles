-- This file can be loaded by calling `lua require('plugins')` from your init.vim

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

  -- Markdown preview
  -- Did not run on new macbook
  --use { 'iamcco/markdown-preview.nvim', ft = 'markdown', run = 'cd app && yarn install' }

  -- wiki
  --use'vimwiki/vimwiki'

  -- git diff in sign column
  use 'airblade/vim-gitgutter'

  -- git plugin (commiting, blame, diff, etc.)
  use 'tpope/vim-fugitive'

  -- colorschemes
  use 'Shatur/neovim-ayu'

  -- indenting python properly
  --use 'hynek/vim-python-pep8-indent'

  -- proper folding for python
  use 'tmhedberg/SimpylFold'


  -- easy commenting out of code
  use 'scrooloose/nerdcommenter'

  -- prettier status line
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

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
  --use 'matze/vim-move'

  --Cchange/add/delete `sourroundings`
  use 'tpope/vim-surround'

  -- Better spell checking
  --use 'rhysd/vim-grammarous'

  -- Autoformatting
  --use 'sbdchd/neoformat'

  -- NeoVim LpSP config
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-lint'
  use 'mhartington/formatter.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'

  -- Zen Mode
  use 'folke/zen-mode.nvim'

end)
