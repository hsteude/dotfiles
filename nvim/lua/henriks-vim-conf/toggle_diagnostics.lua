local status_ok, td = pcall(require, "toggle_lsp_diagnostics")
if not status_ok then
	vim.notify("failed to load toggle diagnostics")
	return
end

td.init()
