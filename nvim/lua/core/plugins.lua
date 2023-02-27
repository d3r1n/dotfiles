-- Lazy.nvim Bootstrapping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Plugin Setup
require("lazy").setup({
	-- Gruvbox theme
	{
		'ellisonleao/gruvbox.nvim',
		lazy = false, 		-- Load immediately
		priority = 10000, 	-- Load before other plugins
	},

	'lukas-reineke/indent-blankline.nvim', 	-- Indentation lines
	'nvim-tree/nvim-tree.lua' ,				-- Tree/File Explorer
	'nvim-tree/nvim-web-devicons', 			-- devicons for neovim
	'nvim-lualine/lualine.nvim',			-- Statusline
	'max397574/better-escape.nvim',			-- Better escape

	{
		"folke/which-key.nvim",
		lazy = false,
		config = function()
		  vim.o.timeout = true
		  vim.o.timeoutlen = 300
		  require("which-key").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		  })
		end,
	  },

	-- Treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',	-- telescope
		version = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- fzf-native
		}
	},
	'romgrk/barbar.nvim', 					-- Bufferline
	'windwp/nvim-autopairs',				-- Autopairs

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp', 	-- LSP support for nvim-cmp
			'L3MON4D3/LuaSnip', 		-- Snippets
			'saadparwaiz1/cmp_luasnip' 	-- Snippets support for nvim-cmp
		},
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs
			-- to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',
		}
	},

	-- Comment
	{
		'numToStr/Comment.nvim',
		-- TS/JSX supports
		dependencies = 'JoosepAlviste/nvim-ts-context-commentstring'
	},

	'folke/neodev.nvim',	-- Neodev
	'folke/trouble.nvim', -- Trouble
})