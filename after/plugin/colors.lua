require("catppuccin").setup({
	-- flavour = "latte",
	-- flavour = "frappe",
	-- flavour = "macchiato",
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		bufferline = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})

vim.cmd.colorscheme("catppuccin")

-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
