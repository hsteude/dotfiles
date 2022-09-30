local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	vim.notify("Mason not loaded")
	return
end

mason.setup()

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	vim.notify("Mason-lsp-config not loaded")
	return
end
mason_lspconfig.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("lsp-config not loaded")
	return
end
mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({})
	end,

	-- Next, you can provide targeted overrides for specific servers.
	-- Here ltex and sumneko_lua
	["ltex"] = function()
		lspconfig.ltex.setup({
			settings = {
				ltex = {
					language = "en-US",
				},
			},
		})
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})
	end,
})

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("null_ls not loaded")
	return
end

-- Linting and formatting
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.diagnostics.flake8,
	},
})

-- don't show diagnostics in virtual text!
vim.diagnostic.config({
	virtual_text = false,
})

--Makess diagnostics symbols nicer
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- LSP Mappings
U.map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
U.map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
U.map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
U.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
U.map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
-- These won't work anymore, since <space> is my <leader> now...
-- U.map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- U.map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
-- U.map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
-- U.map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
-- U.map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
U.map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
U.map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
U.map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
