require("toggleterm").setup({
  size = 20,                        -- Default terminal size
  open_mapping = [[<C-\>]],         -- Toggle terminal with Ctrl + t
  hide_numbers = true,              -- Hide line numbers in terminal
  shade_filetypes = {},
  shade_terminals = true,           -- Dim inactive terminals
  shading_factor = 2,
  start_in_insert = true,           -- Start terminal in insert mode
  persist_size = true,              -- Remember terminal size
  direction = "horizontal",         -- Terminal opens horizontally (can be "vertical" or "float")
  close_on_exit = true,             -- Close terminal when the process exits
  shell = vim.o.shell,              -- Use the default shell
})

-- Keybindings
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })    -- Exit terminal to normal mode
-- vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true }) -- Move to the right split
-- vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true }) -- Move to the left split
-- vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true }) -- Move to the bottom split
-- vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true }) -- Move to the top split

