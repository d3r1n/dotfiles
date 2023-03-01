-- Description: Indentation lines for Neovim

vim.opt.list = false
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_current_context = true,
    space_char_blankline = " ",
    show_trailing_blankline_indent = false,
}
