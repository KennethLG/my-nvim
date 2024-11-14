local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>e", ":NERDTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-a>", "ggVG", opts)

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>F", ":FormatWrite<CR>", opts)

