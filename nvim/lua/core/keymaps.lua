-- Keymaps
-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic navigation
map('n', '<leader>dn', vim.diagnostic.goto_next)
map('n', '<leader>dp', vim.diagnostic.goto_prev)
map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '<leader>q', vim.diagnostic.setloclist)

-- Nvim-tree Mappins
map({'n', 'v'}, '<leader>tf', require('nvim-tree.api').tree.open, {desc = 'Focus/open nvim-tree'})
map({'n', 'v'}, '<leader>tc', require('nvim-tree.api').tree.close, {desc = 'Close nvim-tree'})

-- Bufferline Mappings
-- If you're using alacritty (like me), you need to re-map alt key in alacritty.yml
-- Check out for more info: https://github.com/alacritty/alacritty/issues/93
-- Move to previous/next
map('n', '\x1bh', '<Cmd>BufferPrevious<CR>', { silent = true })
map('n', '\x1bl', '<Cmd>BufferNext<CR>', { silent = true })
-- Re-order to previous/next
map('n', '<leader>lmp', '<Cmd>BufferMovePrevious<CR>', { silent = true })
map('n', '<leader>lmn', '<Cmd>BufferMoveNext<CR>', { silent = true })
-- Pin/unpin buffer
map('n', '<C-p>', '<Cmd>BufferPin<CR>', { silent = true })
-- Close buffer
map('n', '\x1bc', '<Cmd>BufferClose<CR>', { silent = true })