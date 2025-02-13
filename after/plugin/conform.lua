require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier", "eslint_d" },
		typescript = { "prettier", "eslint_d" },
		javascriptreact = { "prettier", "eslint_d" },
		typescriptreact = { "prettier", "eslint_d" },
		json = { "prettier" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		-- lsp_fallback = true,
		lsp_format = "fallback",
	},
	notify_on_error = true, -- Notify if formatting fails
})

vim.keymap.set("n", "<leader>F", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
