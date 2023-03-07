local auto_require = function(exclude)
    local files = vim.api.nvim_get_runtime_file("lua/core/configs/*.lua", true)

    -- Remove the exclude files
    if exclude then
        for _, file in ipairs(exclude) do
            for i, f in ipairs(files) do
                if f:match(file) then
                    table.remove(files, i)
                end
            end
        end
    end

    -- Require the files
    for _, file in ipairs(files) do
        local name = file:match("lua/core/configs/(.*).lua")
        if name ~= "init" then
            require("core.configs." .. name)
        end
    end
end

EXCLUDES = {
    -- None
}

auto_require(EXCLUDES)

