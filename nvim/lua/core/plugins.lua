-- Ensure Packer is installed, if not install Packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim'

		-- Plugins:
		use 'ellisonleao/gruvbox.nvim'		-- Gruvbox Theme
		use 'nvim-tree/nvim-tree.lua' 		-- Tree/File Explorer
		use 'nvim-tree/nvim-web-devicons' 	-- devicons for neovim
		use 'nvim-lualine/lualine.nvim'		-- Statusline
		use {
			'nvim-treesitter/nvim-treesitter',	-- treesitter
			run = function()
				local ts_update = require('nvim-treesitter.install')
				.update({ with_sync = true })
				ts_update()
			end
		}
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- fzf for telescope
		use {
			'nvim-telescope/telescope.nvim',	-- telescope
			tag = '0.1.x',
			requires = {
				'nvim-lua/plenary.nvim',
			}
		}
		use "lukas-reineke/indent-blankline.nvim"	-- Indentation
		use 'romgrk/barbar.nvim' -- Bufferline
		use 'windwp/nvim-autopairs'	-- Autopairs
		use {
			'hrsh7th/nvim-cmp', -- Autocompletion
			requires = { -- Autocompletion plugins
				'hrsh7th/cmp-nvim-lsp', -- LSP support for nvim-cmp
				'L3MON4D3/LuaSnip', -- Snippets
				'saadparwaiz1/cmp_luasnip' -- Snippets support for nvim-cmp
			},
		}
		use {
			'neovim/nvim-lspconfig',	-- LSP
			requires = {
				-- Automatically install LSPs to stdpath for neovim
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',
		  
				-- Useful status updates for LSP
				'j-hui/fidget.nvim',
			}
		}
		use {
			'numToStr/Comment.nvim', -- Comment
			requires = 'JoosepAlviste/nvim-ts-context-commentstring' -- TS/JSX support for Comment
		}
		-- use 'folke/neodev.nvim'	-- Neodev, I don't use this
		use 'folke/trouble.nvim' -- Trouble

		-- end Plugins

		if packer_bootstrap then
			require('packer').sync()
		end

		if packer_bootstrap then
			print '=================================='
			print '    Plugins are being installed'
			print '    Wait until Packer completes,'
			print '       then restart nvim'
			print '=================================='
			return
		  end
	end
)
