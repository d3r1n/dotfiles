require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    highlight = {
        enable = true,
        disable = '',
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true, -- ! experimental
        disable = {},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}
