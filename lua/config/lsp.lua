local lspconfig = require("lspconfig")

-- General on_attach function for shared key mappings and settings
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- Disable formatting in tsserver and eslint to avoid conflicts with conform.nvim
  if client.name == "tsserver" or client.name == "eslint" then
    client.server_capabilities.documentFormattingProvider = false
  end
end

-- Configure TypeScript and ESLint servers with Mason-LSPconfig
require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup { on_attach = on_attach }
  end,
})

-- Special configuration for ESLint to auto-fix lint errors on save
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- Enable real-time diagnostics in Insert mode
vim.diagnostic.config({
  virtual_text = true,          -- Show diagnostic messages inline
  signs = true,                 -- Show signs in the sign column
  update_in_insert = true,      -- Update diagnostics while in Insert mode
  severity_sort = true,         -- Sort diagnostics by severity
})
