local telescope = require('telescope')
telescope.setup({
    defaults = {
        file_ignore_patterns = {"node_modules", ".git/", "dist", "build", ".png", ".jpg", ".jpeg"},
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
    pickers = {
      git_files = {
        theme = "dropdown", -- Optional theme for Git files picker
      },
      git_commits = {
        theme = "dropdown", -- View commits
      },
      find_files = {
        hidden = true,
      },
    },
})

-- Optional keybindings for Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tgf', '<cmd>Telescope git_files<CR>', { noremap = true, silent = true }) -- Git files
vim.api.nvim_set_keymap('n', '<leader>tgc', '<cmd>Telescope git_commits<CR>', { noremap = true, silent = true }) -- Git commits
vim.api.nvim_set_keymap('n', '<leader>tgb', '<cmd>Telescope git_branches<CR>', { noremap = true, silent = true }) -- Git branches
vim.api.nvim_set_keymap('n', '<leader>tgs', '<cmd>Telescope git_status<CR>', { noremap = true, silent = true }) -- Git status

