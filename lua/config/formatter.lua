require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
  },
})

-- Format on save using BufWritePre for async formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.tsx", "*.jsx", "*.json" },
  callback = function()
    require("conform").format({ async = true })
  end,
})
