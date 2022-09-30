local onenord_status_ok, onenord = pcall(require, "onenord")
if not onenord_status_ok then
	vim.notify("onenord not loaded")
	return
end

onenord.setup({
	-- theme = 'light', -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
	borders = true, -- Split window borders
	fade_nc = false, -- Fade non-current windows, making them more distinguishable
	-- Style that is applied to various groups: see `highlight-args` for options
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "NONE",
		functions = "italic",
		variables = "NONE",
		diagnostics = "underline",
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = false, -- Hide the end-of-buffer lines
	},
	-- Inverse highlight for different groups
	inverse = {
		match_paren = false,
	},
	custom_highlights = {
		--LspDiagnosticsUnderlineError = { style = 'undercurl' },
	},
	custom_colors = {}, -- Overwrite default colors
})
