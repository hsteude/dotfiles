local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("failed to load cmp")
	return
end

-- alpha.setup(require'alpha.themes.startify'.config)
alpha.setup(require'alpha.themes.dashboard'.config)

