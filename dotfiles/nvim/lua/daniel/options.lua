local options = {
	showmatch = false,
	relativenumber = true,
	hlsearch = false,
	hidden = true,
	errorbells = false,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,
	nu = true,
	smartcase = true,
	backup = false,
	undodir = "/home/daniel/.vim/undodir",
	undofile = true,
	incsearch = true,
	termguicolors = true,
	scrolloff = 8,
    cmdheight = 1,
	updatetime = 400,
	completeopt = { "menuone", "noselect" },
	colorcolumn = "80",
	background = "dark",
	spell = true,
    swapfile=false,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end
