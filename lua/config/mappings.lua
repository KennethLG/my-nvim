local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>e", ":NERDTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Go to definition
vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Go to declaration
vim.api.nvim_set_keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

-- Go to implementation
vim.api.nvim_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- Go to references
vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>bn", ":let @/ = '' | bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bp", ":let @/ = '' | bprevious<CR>", opts)

-- vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>bp", ":bprevious<CR>", opts)

vim.keymap.set("n", "<C-a>", "ggVG", opts)
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>F", ":FormatWrite<CR>", opts)

