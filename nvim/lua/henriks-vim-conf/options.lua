-------------
-- Options --
-------------
local global_opts = {
	encoding = "utf-8",
	termguicolors = true,
	mouse = "a",
	smarttab = true,
	ignorecase = true,
	smartcase = true,
	splitbelow = true,
	splitright = true,
	showmode = true,
	history = 5000,
	autowrite = true,
	undofile = true,
	updatetime = 300,
	ttimeoutlen = 10,
	timeoutlen = 500,
	title = true,
	wildmenu = true,
	wildmode = "full",
	hidden = true,
	hlsearch = true,
	incsearch = true,
	backspace = "indent,eol,start",
	completeopt = "menuone,noselect",
	formatoptions = "j,r,o,q", -- see `help fo-table` for meaning
	scrolloff = 8,
	spell = true,
	spelllang = "en_us",
	-- ls = 0, --
	-- ch = 0 -- command height  (works only from version 0.8)
}

local win_opts = {
	cursorline = true,
	number = true,
	relativenumber = true,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldenable = true,
	foldlevel = 10,
	-- colorcolumn = "80",
}

local buf_opts = {
	autoindent = true,
	smartindent = true,
	infercase = true,
	expandtab = true,
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	textwidth = 79,
}

for k, v in pairs(global_opts) do
	vim.o[k] = v
end

for k, v in pairs(buf_opts) do
	vim.o[k] = v
	vim.bo[k] = v
end

for k, v in pairs(win_opts) do
	vim.o[k] = v
	vim.wo[k] = v
end

vim.cmd([[set iskeyword+=-]])


-- don't show diagnostics in virtual text!
vim.diagnostic.config({
	virtual_text = false,
	underline = false,
})


vim.cmd("colorscheme rose-pine")
-- vim.cmd("set background=light")
