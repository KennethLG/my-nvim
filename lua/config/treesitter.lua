require("nvim-treesitter.configs").setup({
    ensure_installed = { "typescript", "javascript", "lua", "html" }, -- Include other languages as needed
    highlight = {
        enable = true,            -- Enable Treesitter-based highlighting
        additional_vim_regex_highlighting = false, -- Disable Vim's default regex-based syntax highlighting
    },
})
