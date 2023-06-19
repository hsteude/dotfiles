local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	vim.notify("nvim_tree not loaded")
	return
end

whichkey.setup({})

local opts = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

whichkey.register({
	["<leader>b"] = { "obreakpoint()<ESC>", "Insert Python breakpoint" },
	["<leader>f"] = {
		name = "Files",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		h = { "<cmd>Telescope help_tags<cr>", "Search Help Tags" },
		n = { "<cmd>enew<cr>", "New File" },
	},
	["<leader>l"] = {
		name = "LSP",
		d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
		D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaraion" },
		h = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Help" },
		f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format buffer" },
		-- t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
		o = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
		p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Go to previous" },
		n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Go to next" },
		l = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Set loclist" },
		e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics in a floating window" },
		t = { "<cmd>ToggleDiag<CR>, Toggle Diagnostics" },
	},
	["<leader>c"] = {
		name = "Comments",
	},
	["<leader>g"] = {
		name = "Git",
		i = { "<cmd>Neogit<CR>", "Interactive staging and others" },
		o = { "<cmd>DiffviewOpen<CR>", "Open Diffview" },
		c = { "<cmd>DiffviewClose<CR>", "Close Diffview" },
		h = { "<cmd>DiffviewFileHistory<CR>", "Open file history tool" },
		b = { "<cmd>Gitsigns blame_line<CR>", "Show Blame info for line" },
	},
	["<leader>a"] = {
		name = "TTYD-Copy-Mode",
		a = { "<cmd>set nonumber norelativenumber mouse-=a scl=no<CR>", "Turn off line numbers and mouse suport" },
		s = { "<cmd>set number relativenumber mouse+=a scl=yes<CR>", "And turn all back on" },
	},
	["<leader>m"] = {
         "<cmd>!make<CR>", "Execute make file in this directory" 
	},
}, opts)
