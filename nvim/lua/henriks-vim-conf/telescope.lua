local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("telescope not loaded")
	return
end

local actions = require("telescope.actions")
local sorters = require("telescope.sorters")

telescope.setup({
	defaults = {
		--prompt_position = "top",
		prompt_prefix = " ❯ ",
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-o>"] = function() end,
				["<TAB>"] = function() end,
			},
		},
		file_sorter = sorters.get_fzy_sorter,
		generic_sorter = sorters.get_fzy_sorter,
	},
})

-- Ctrl-p = fuzzy finder and stuff
U.map("n", "<C-P>", "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>")
U.map("n", "<leader>fo", "<CMD>Telescope buffers<CR>")
U.map("n", "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
U.map("n", "<leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
U.map("n", "<leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
U.map("n", "<leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
