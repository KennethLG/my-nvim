require("toggleterm").setup({
    open_mapping = [[<C-\>]],  -- Keybinding to toggle terminal
    direction = 'horizontal',  -- Options: 'horizontal', 'vertical', 'float'
    shade_terminals = true,
    start_in_insert = true,
})

-- Key mappings for specific terminal instances
vim.api.nvim_set_keymap('n', '<leader>1', ':1ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':2ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':3ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':4ToggleTerm<CR>', { noremap = true, silent = true })

-- Escape terminal mode
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

