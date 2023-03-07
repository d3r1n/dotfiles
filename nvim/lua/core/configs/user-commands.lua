-- Change current file's filetype
local function change_filetype(opts)
    vim.cmd([[set filetype=]] .. opts.args)
end

vim.api.nvim_create_user_command('FileType', change_filetype, { nargs = 1 })
