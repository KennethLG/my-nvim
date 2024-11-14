
require("mason").setup()  -- Initializes Mason with default settings

-- Mason-LSPconfig: ensure certain LSP servers are installed and configured
require("mason-lspconfig").setup({
    ensure_installed = { "biome", "ts_ls", "eslint", "lua_ls" }, -- Add the LSP servers you need
})

-- Set up nvim-lspconfig with mason-lspconfig
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {}
    end,
})

