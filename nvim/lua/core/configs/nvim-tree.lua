-- Description: Configuration for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
	view = {
		mappings = {
			list = {
				{ key='h', action='cd'}
			}
		}
	},
	actions = {
		change_dir = {
			enable = true
		}
	},
}