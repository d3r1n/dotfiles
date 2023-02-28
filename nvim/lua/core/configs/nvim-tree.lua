-- Description: Configuration for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
	view = {
		mappings = {
			list = {
                {key = {'l'}, action='edit', mode = 'n'},
                {key = {'h'}, action='cd',   mode = 'n'},
			}
		}
	},
	actions = {
		change_dir = {
			enable = true,
            global = true,
		}
	},
    diagnostics = {
        enable = true
    },
}
