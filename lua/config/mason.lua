require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "biome", "ts_ls", "eslint", "lua_ls" },
})
