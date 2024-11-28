local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>e", ":NERDTreeToggle<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)

vim.api.nvim_set_keymap('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

vim.api.nvim_set_keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR})<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader><space>", ":let @/ = '' | nohlsearch<CR>", { noremap = true, silent = true })
-- Go to definition
vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Go to declaration
vim.api.nvim_set_keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

-- Go to implementation
vim.api.nvim_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- Go to references
vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>x", ":pclose | cclose<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>bn", ":let @/ = '' | bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bp", ":let @/ = '' | bprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bd", ":let @/ = '' | bdelete<CR>", opts)

vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { noremap = true, expr = true, silent = true })
vim.g.copilot_no_tab_map = true


vim.keymap.set("n", "<C-a>", "ggVG", opts)
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>F", ":FormatWrite<CR>", opts)

vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })         -- Git status
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true }) -- Git diff
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })   -- Git push
vim.api.nvim_set_keymap('n', '<leader>gl', ':Git pull<CR>', { noremap = true, silent = true })   -- Git pull
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true }) -- Git commit

