-- Global options
-- see `:help vim.o` for details

-- Timeout for mappings
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Enable line numbers and relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- set tab sizing
vim.go.shiftwidth = 4
vim.go.smarttab = true
vim.go.expandtab = true
vim.go.tabstop = 4
vim.go.softtabstop = 0

-- Theme options
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd [[highlight EndOfBuffer guifg=bg]] -- Get rid of repeating tildes at the end of the buffer
