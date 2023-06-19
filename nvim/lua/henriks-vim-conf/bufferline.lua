local bl_status_ok, bufferline = pcall(require, "bufferline")
if not bl_status_ok then
	vim.notify("failed to load bufferline")
	return
end

bufferline.setup({
	options = {
		separator_style = "thin",
		offsets = {
			filetype = "NvimTree",
			text = "EXPLORER",
			text_align = "center",
			-- separator = true,
		},
	},
})
