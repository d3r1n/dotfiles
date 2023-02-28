-- Description: Indentation lines for Neovim
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#928374 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#928374 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#928374 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#928374 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#928374 gui=nocombine]]

require("indent_blankline").setup {
    char = '┇',
	buftype_exclude = {"terminal"},
	filetype_exclude = {"help", "packer", "NvimTree", "Trouble"},
	space_char_blankline = " ",
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	show_current_context = true,
	use_treesitter = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
    },
}
