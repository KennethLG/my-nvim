require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	update_focused_file = {
		enable = true,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		vim.keymap.set("n", "h", function()
			local node = api.tree.get_node_under_cursor()
			if node.type == "directory" and node.open then
				api.node.open.edit()
			else
				api.node.navigate.parent_close()
			end
		end, opts("Close Directory"))

		vim.keymap.set("n", "l", function()
			local node = api.tree.get_node_under_cursor()
			if node.type == "directory" then
				api.node.open.edit()
			else
				api.node.open.edit()
			end
		end, opts("Open File or Expand Directory"))
    vim.keymap.set("n", "<CR>", require("nvim-tree.api").node.open.edit, opts("Open"))

	end,
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeAutoClose", { clear = true }),
	callback = function()
		local tree_win = vim.fn.bufwinnr("NvimTree")
		if tree_win ~= -1 and vim.fn.winnr() ~= tree_win then
			vim.cmd("NvimTreeClose")
		end
	end,
})
