local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("nvim_tree not loaded")
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	vim.notify("nvim_tree_config not loaded")
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
            show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
                git = {
                  unstaged = "✗",
                  staged = "✓",
                  unmerged = "",
                  renamed = "➜",
                  untracked = "★",
                  deleted = "",
                  ignored = "◌",
                },
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "h",
			info = "i",
			warning = "w",
			error = "e",
		},
	},
	view = {
		width = 30,
		side = "left",
	},
})

U.map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end



vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

