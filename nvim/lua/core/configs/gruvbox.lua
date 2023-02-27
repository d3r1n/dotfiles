-- Enable terminal gui colors
vim.o.termguicolors = true
vim.o.background = 'dark'
require('gruvbox').setup {
	italic = true,	
}

-- Change colorscheme/theme
vim.cmd [[ colorscheme gruvbox ]]