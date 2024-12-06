U = {}

-- Key mapping function
function U.map(mode, key, result, opts)
	opts = vim.tbl_extend("keep", opts or {}, {
		noremap = true,
		silent = true,
		expr = false,
	})

	vim.api.nvim_set_keymap(mode, key, result, opts)
end

---------------------------------------
-- Mappings which don't require plugins
-------------------------------------------
-- don't use ex mode, use Q for formatting (wrapping text in new lines)
-- mapping to write file that needs sudo privileges
U.map("n", "w!!", "%!sudo tee > /dev/null %")
-- make Y work as C or D,
U.map("n", "Y", "y$")
--Uap('v', 'Y', ':"<,">,let @+ = @"<CR>') -- this breaks stuff
-- make ctrl-l remove highlights and re-apply syntax highlighting
U.map("n", "<C-l>", ":nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>")
-- switch to next/previous buffer with Tab/shift+Tab
U.map("n", "L", ":bnext<CR>")
U.map("n", "H", ":bprevious<CR>")
-- shortcut to replace highlighted section with paste register content
U.map("v", "<leader>p", "_dP")
-- insert breakpoint in python
U.map("n", "<leader>pb", "obreakpoint()<ESC>")
-- Toggle explorer (overriden by nvimtree later but useful if not loaded)
U.map("n", "<leader>e", "<cmd>Lex<CR>")
-- Special command to get rid of line numbers and mouse mode
-- U.map("n", "<leader>aa", "<cmd>set nonumber norelativenumber mouse-=a scl=no CR>")
-- U.map("n", "<leader>as", "<cmd>set number relativenumber mouse+=a scl=no<CR>")
