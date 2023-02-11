--- Set colorscheme
local nightfly_loaded, _ = pcall(vim.cmd, "colorscheme nightfly")
if not nightfly_loaded then
  print("Could not load nightfly colorscheme")
  _, _ = pcall(vim.cmd, "colorscheme onedark")
end

local opt = vim.opt

-- general appearence
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

