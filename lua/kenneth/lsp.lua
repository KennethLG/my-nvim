local lsp_signature = require("lsp_signature")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf
		local opts = { buffer = bufnr, remap = false }

		client.server_capabilities.documentFormattingProvider = false

		lsp_signature.on_attach({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			hint_enable = true,
			floating_window = false,
		}, bufnr)

		local telescope_builtin = require("telescope.builtin")

		-- Telescope-based LSP navigation
		vim.keymap.set("n", "gd", function()
			telescope_builtin.lsp_definitions({ show_line = true })
		end, opts)
		vim.keymap.set("n", "gr", function()
			telescope_builtin.lsp_references({ show_line = true })
		end, opts)
		vim.keymap.set("n", "gi", function()
			telescope_builtin.lsp_implementations({ show_line = true })
		end, opts)
		vim.keymap.set("n", "gt", function()
			telescope_builtin.lsp_type_definitions({ show_line = true })
		end, opts)

		-- Standard LSP keymaps
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Diagnostics navigation
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

		-- Navigate only errors
		vim.keymap.set("n", "[e", function()
			vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "]e", function()
			vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, opts)

		vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts)

		if client:supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		end

		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

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
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
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
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "lua_ls", "ts_ls", "biome" },
})
