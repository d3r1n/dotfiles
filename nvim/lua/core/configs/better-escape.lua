-- Description: Better escape sequence
require("better_escape").setup {
    mapping = { "jk", "jj" },
    timeout = 200,
    clear_empty_lines = false,
    keys = "<Esc>",
}
