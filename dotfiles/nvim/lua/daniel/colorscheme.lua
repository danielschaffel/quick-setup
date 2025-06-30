-- local colorscheme = require("monokai").setup{}

local colorscheme = "gruvbox"
local colorscheme = "catppuccin"
local colorscheme = "cyberdream"
vim.g.catppuccin_flavour = "latte" -- "mocha" latte, frappe, macchiato, mocha
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.g.gruvbox_contrast_dark = 'soft'

-- Set opening screen theme to gruvbox
vim.guibg=colorscheme
vim.guifg=colorscheme

-- vim.ctermbg=0
-- 
vim.highlight.ColorColumn = true

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
