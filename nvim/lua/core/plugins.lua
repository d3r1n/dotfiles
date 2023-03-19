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
    'lukas-reineke/indent-blankline.nvim',      -- Indentation lines
    'nvim-tree/nvim-tree.lua',                  -- Tree/File Explorer
    'nvim-tree/nvim-web-devicons',              -- devicons for neovim
    'nvim-lualine/lualine.nvim',                -- Statusline
    'max397574/better-escape.nvim',             -- Better escape
    'andweeb/presence.nvim',                    -- Discord Presence
    'romgrk/barbar.nvim',                       -- Bufferline
    'windwp/nvim-autopairs',                    -- Autopairs
    'folke/neodev.nvim',                        -- Neodev
    'folke/trouble.nvim',                       -- Trouble
    'folke/which-key.nvim',                     -- WhichKey
    'rafamadriz/friendly-snippets',             -- VSCode like built-in snippets
    'wakatime/vim-wakatime',                    -- Wakatime integration
    --'gpanders/editorconfig.nvim',               -- .editorconfig support for neovim

    -- Tokyo Night theme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 10000,
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- fzf-native
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
        }
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP support for nvim-cmp
            'L3MON4D3/LuaSnip', -- Snippets
            'saadparwaiz1/cmp_luasnip', -- Snippets support for nvim-cmp
            'hrsh7th/cmp-buffer', -- Buffer compeletions
            'hrsh7th/cmp-path', -- Filesystem and path compeletions
            'hrsh7th/cmp-cmdline', -- Command line compeletions
            'onsails/lspkind.nvim' -- Icons for compeletion menu
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
})
