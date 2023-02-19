local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Packer not found")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "nvim-telescope/telescope.nvim" })

	-- Color schemes!!!!
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- use({ "rmehri01/onenord.nvim" }) -- Some colours :)
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "Shatur/neovim-ayu" })
    use({ "marko-cerovac/material.nvim" })
    use({ "savq/melange-nvim" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	--use({ "windwp/nvim-autopairs"}) -- Autopairs, integrates with both cmp and treesitter

	-- Mason: LSP, null-ls, linter, debugger...
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/null-ls.nvim",
	})

    use({"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"})

	-- Nice syntax highliting in pretty much all languages
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Surround!!
	use({"kylechui/nvim-surround"})

	-- Tree
	use({ "kyazdani42/nvim-tree.lua" })

	-- Commnt Toggler
	use({ "numToStr/Comment.nvim" })
	-- use({'b3nj5m1n/kommentary'})

	-- Bufferline
	use({ "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    })

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Starting Dashboard
	use({ "goolord/alpha-nvim",
        requires = "kyazdani42/nvim-web-devicons"
    })

	-- Git magic
	use({ "lewis6991/gitsigns.nvim" })
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Show keymappings
	use({ "folke/which-key.nvim" })

	-- Markdown perview
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

    use({"xiyaowong/nvim-transparent"})






	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
