return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")
		local sorters = require("telescope.sorters")
		local telescope = require("telescope")
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
	end,
}
