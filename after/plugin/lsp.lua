-- Mason setup
require("mason").setup()

-- Mason-LSPConfig setup with automatic installation
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "biome", "rust_analyzer", "clangd" }, -- Auto-install these servers
	automatic_installation = true,
})

-- LSP Configuration
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local telescope_builtin = require("telescope.builtin")
local lsp_signature = require("lsp_signature")

local function on_attach(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	client.server_capabilities.documentFormattingProvider = false -- Disable formatting if needed

  lsp_signature.on_attach({
    bind = true,
    handler_opts = {
      border = "rounded"
    },
    hint_enable = true,
    floating_window = true
  }, bufnr)

	-- Telescope-based LSP navigation
	vim.keymap.set("n", "gd", function() telescope_builtin.lsp_definitions({ show_line = true }) end, opts)
	vim.keymap.set("n", "gr", function() telescope_builtin.lsp_references({ show_line = true }) end, opts)
	vim.keymap.set("n", "gi", function() telescope_builtin.lsp_implementations({ show_line = true }) end, opts)
	vim.keymap.set("n", "gt", function() telescope_builtin.lsp_type_definitions({ show_line = true }) end, opts)

	-- Standard LSP keymaps
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

	-- Diagnostics navigation
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

	-- Navigate only errors
	vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
	vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)

	-- Show diagnostics popup
	vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts)
end

-- Handler for all servers
require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
      on_attach = on_attach,
		})
	end,

  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" }, -- Use Clippy for better linting
          cargo = { allFeatures = true },
          procMacro = { enable = true },
        },
      },
    })
  end,

  ["clangd"] = function ()
    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = function (client, bufnr)
        client.server_capabilities.signatureHelperProvider = false
        on_attach(client, bufnr)
      end,
    })
  end,

})

-- Keybindings for LSP

vim.diagnostic.config({
	virtual_text = true, -- Show diagnostics inline
	signs = true, -- Show icons in sign column
	underline = true, -- Underline problematic code
	update_in_insert = false, -- Delay diagnostics while typing
	severity_sort = true, -- Sort diagnostics by severity
})

-- Setup nvim-cmp
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
		["<Down>"] = cmp.mapping.select_next_item(), -- Next suggestion
		["<Up>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
		["<C-e>"] = cmp.mapping.abort(), -- Abort completion
	},
	sources = {
		{ name = "nvim_lsp" }, -- LSP suggestions
		{ name = "luasnip" }, -- Snippet suggestions
		{ name = "buffer" }, -- Buffer content suggestions
		{ name = "path" }, -- File path suggestions
	},
	experimental = {
		ghost_text = true, -- Shows "ghost" text for suggestions
	},
})
