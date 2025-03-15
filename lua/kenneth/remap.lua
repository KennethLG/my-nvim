vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "Q", "<nop>")
-- Move between splits (windows) using Ctrl + h/j/k/l
-- vim.keymap.set("n", "<C-h>", "<C-w>h") -- Move to the split on the left
-- vim.keymap.set("n", "<C-l>", "<C-w>l") -- Move to the split on the right
-- vim.keymap.set("n", "<C-j>", "<C-w>j") -- Move to the split below
-- vim.keymap.set("n", "<C-k>", "<C-w>k") -- Move to the split above

vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true })

vim.keymap.set("n", "<leader>bd", ":bp | bd #<CR>", { noremap = true })

vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "zR", function() vim.cmd("set foldlevel=99") end) -- Open all folds
vim.keymap.set("n", "zM", function() vim.cmd("set foldlevel=0") end)  -- Close all folds

