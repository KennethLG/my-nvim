require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				results_width = 0.4,
				preview_width = 0.6,
			},
		},
		path_display = { "truncate" },
		dynamic_preview_title = true,

    file_ignore_patterns = {
      "node_modules/",
      "%.git/",
      "dist/",
      "build/",
      "coverage/"
    }
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
