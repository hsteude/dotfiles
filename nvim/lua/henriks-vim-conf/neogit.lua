local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
	vim.notify("neogit not loaded")
	return
end

neogit.setup({})
