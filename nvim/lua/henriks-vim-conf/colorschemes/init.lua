-- this is the place to change the color theme
-- note that it expetcs a script in the module colorschemes, which is named
-- like the string ColorSchme
-- We have a global variable here, since we also use it for the plugin lualine
-- later on
local colorscheme = "melange" -- gloab variable also used in lualine later

require("henriks-vim-conf.colorschemes." .. colorscheme)
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
