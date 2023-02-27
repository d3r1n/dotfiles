-- Description: Telescope configuration
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = true,
				['<C-d>'] = true,
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