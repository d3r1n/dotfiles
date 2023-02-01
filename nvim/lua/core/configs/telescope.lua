-- Description: Telescope configuration
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,                    	-- false will only do exact matching
			override_generic_sorter = true, 	-- override the generic sorter
			override_file_sorter = true,     	-- override the file sorter
			case_mode = "smart_case",       	-- case mode for file sorter
		}
	}
}

-- Load FZF
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
local map = vim.keymap.set

-- Telescope Mappings
map('n', '<leader>ff', builtin.find_files, {desc = 'Find files'})           -- Find files / search files
map('n', '<leader>ft', builtin.live_grep, {desc = 'Find text'})             -- Find text
map('n', '<leader><leader>', builtin.buffers, {desc = 'Find buffers'})      -- Find buffers
map('n', '<leader>fh', builtin.help_tags, {desc = 'Find help'})             -- Find help
map('n', '<leader>?', builtin.oldfiles, {desc = 'Find recent files'})       -- Find recent files	
map('n', '<leader>fc', builtin.builtin, {desc = 'Find builtin commands'})   -- Find builtin commands
map('n', '<leader>fd', builtin.diagnostics, {desc = 'Find diagnostics'})    -- Find diagnostics
