-- LSP configuration
-- Includes:
--      Mason,
--      Neovim LSP Config,
--      LuaSnip,
--      Neovim CMP,
--      Fidget,
--      Bridges (cmp_luasnip, cmp-nvim-lsp, mason-lspconfig)
--      Neodev

require('neodev').setup()

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- Create a command `:Format` local to the LSP buffer
    local formatting_opts = {
        tabSize            = 4,
        insertSpaces       = true,
        insertFinalNewLine = true,
    }
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format(formatting_opts)
    end, { desc = 'Format current buffer with LSP' })
end


-- These language servers are ensured to be installed
-- Reference this site for language servers and their docs:
-- https://langserver.org/
local servers = {
    -- gopls = {},
    volar = {},
    clangd = {},
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = {
                callSnippet = "Replace"
            }
        },
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

-- Turn on lsp status information
require('fidget').setup()
