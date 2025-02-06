-- Mason setup
require("mason").setup()

-- Mason-LSPConfig setup with automatic installation
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "biome" },  -- Auto-install these servers
  automatic_installation = true,
})

-- LSP Configuration
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Handler for all servers
require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
  
  -- Custom settings for TypeScript/JavaScript
  ["ts_ls"] = function()
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
        client.server_capabilities.documentFormattingProvider = false 
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts )
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) 
	
	-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      end,
    })
  end,

  -- Custom settings for JSON
  ["jsonls"] = function()
    lspconfig.jsonls.setup({
      capabilities = capabilities,
    })
  end,
})

-- Keybindings for LSP

vim.diagnostic.config({
  virtual_text = true,       -- Show diagnostics inline
  signs = true,              -- Show icons in sign column
  underline = true,          -- Underline problematic code
  update_in_insert = false,  -- Delay diagnostics while typing
  severity_sort = true,      -- Sort diagnostics by severity
})


-- Setup nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),         -- Trigger completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<Down>'] = cmp.mapping.select_next_item(),     -- Next suggestion
    ['<Up>'] = cmp.mapping.select_prev_item(),   -- Previous suggestion
    ['<C-e>'] = cmp.mapping.abort(),                -- Abort completion
  },
  sources = {
    { name = 'nvim_lsp' },    -- LSP suggestions
    { name = 'luasnip' },     -- Snippet suggestions
    { name = 'buffer' },      -- Buffer content suggestions
    { name = 'path' },        -- File path suggestions
  },
  experimental = {
    ghost_text = true, -- Shows "ghost" text for suggestions
  },
})
