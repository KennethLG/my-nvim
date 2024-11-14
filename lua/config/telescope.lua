local telescope = require('telescope')
telescope.setup({
    defaults = {
        file_ignore_patterns = {"node_modules", ".git/", "dist", "build"},
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
})

-- Optional keybindings for Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })

