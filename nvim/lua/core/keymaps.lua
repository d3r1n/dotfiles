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
-- Moved to lua/core/plugins.lua to use lazy.nvim
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
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[DIAG] Next Diagnostic' })
map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[DIAG] Previous Diagnostic' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = '[DIAG] Open Float Diagnostic' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[DIAG] Set Diagnostic To Loclist' })

-- Nvim-tree Mappins
map({'n', 'v'}, '<leader>tf', require('nvim-tree.api').tree.open, 	{desc = '[TREE] Focus/open'})
map({'n', 'v'}, '<leader>tc', require('nvim-tree.api').tree.close, 	{desc = '[TREE] Close'})

-- Bufferline Mappings
-- If you're using alacritty (like me), you need to re-map alt key in alacritty.yml
-- Check out for more info: https://github.com/alacritty/alacritty/issues/93
map('n', '\x1bh', 			'<Cmd>BufferPrevious<CR>', 		{ silent = true, desc = "[BUFFERLINE] Previous Buffer" })
map('n', '\x1bl', 			'<Cmd>BufferNext<CR>', 			{ silent = true, desc = "[BUFFERLINE] Next Buffer" })
map('n', '<leader>lmp', 	'<Cmd>BufferMovePrevious<CR>', 	{ silent = true, desc = "[BUFFERLINE] Move Buffer To Previous" })
map('n', '<leader>lmn', 	'<Cmd>BufferMoveNext<CR>', 		{ silent = true, desc = "[BUFFERLINE] Move Buffer To Next" })
map('n', '<C-p>', 			'<Cmd>BufferPin<CR>', 			{ silent = true, desc = "[BUFFERLINE] Pin/Unpin Buffer" })
map('n', '\x1bc', 			'<Cmd>BufferClose<CR>', 		{ silent = true, desc = "[BUFFERLINE] Close Buffer" })

-- Telescope Mappings
local telescope_builtin = require('telescope.builtin')

map('n', '<leader>ff', 			telescope_builtin.find_files, 	{desc = '[TELESCOPE] [F]ind [F]iles'})
map('n', '<leader>ft', 			telescope_builtin.live_grep, 	{desc = '[TELESCOPE] [F]ind [T]ext'})
map('n', '<leader><leader>', 	telescope_builtin.buffers, 		{desc = '[TELESCOPE] [F]ind buffers'})
map('n', '<leader>fh', 			telescope_builtin.help_tags, 	{desc = '[TELESCOPE] [F]ind [H]elp'})
map('n', '<leader>?', 			telescope_builtin.oldfiles, 	{desc = '[TELESCOPE] [F]ind Recent Files'})
map('n', '<leader>fc', 			telescope_builtin.builtin, 		{desc = '[TELESCOPE] [F]ind Builtin [C]ommands'})
map('n', '<leader>fd', 			telescope_builtin.diagnostics, 	{desc = '[TELESCOPE] [F]ind [D]iagnostics'})

-- LSP Mappings
map('n', '<leader>rn', 	vim.lsp.buf.rename, 								{desc='[LSP] [R]e[n]ame'})
map('n', '<leader>ca', 	vim.lsp.buf.code_action, 							{desc='[LSP] [C]ode [A]ction'})
map('n', 'gd', 			vim.lsp.buf.definition, 							{desc='[LSP] [G]oto [D]efinition'})
map('n', 'gr', 			telescope_builtin.lsp_references, 					{desc='[LSP] [G]oto [R]eferences'})
map('n', 'gI', 			vim.lsp.buf.implementation, 						{desc='[LSP] [G]oto [I]mplementation'})
map('n', '<leader>D', 	vim.lsp.buf.type_definition, 						{desc='[LSP] Type [D]efinition'})
map('n', '<leader>ds', 	telescope_builtin.lsp_document_symbols, 			{desc='[LSP] [D]ocument [S]ymbols'})
map('n', '<leader>ws', 	telescope_builtin.lsp_dynamic_workspace_symbols, 	{desc='[LSP] [W]orkspace [S]ymbols'})
-- See `:help K` for why this keymap
map('n', 'K', 			vim.lsp.buf.hover, 									{desc='[LSP] Hover Documentation'})
map('n', '<C-k>', 		vim.lsp.buf.signature_help, 						{desc='[LSP] Signature Documentation'})
-- Lesser used LSP functionality
map('n', 'gD',			 vim.lsp.buf.declaration, 							{desc='[LSP] [G]oto [D]eclaration'})
map('n', '<leader>wa', 	vim.lsp.buf.add_workspace_folder, 					{desc='[LSP] [W]orkspace [A]dd Folder'})
map('n', '<leader>wr', 	vim.lsp.buf.remove_workspace_folder, 				{desc='[LSP] [W]orkspace [R]emove Folder'})
map('n', '<leader>wl',
	function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end,																{desc='[LSP] [W]orkspace [L]ist Folders'})
