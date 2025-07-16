return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({})
				end,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",  -- Geändert von jose-elias-alvarez/null-ls.nvim
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")  -- API bleibt gleich
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.prettier,
				},
			})
		end,
	},
}
