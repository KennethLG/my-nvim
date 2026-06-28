require("toggleterm").setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  persist_size = true,
  direction = "tab",
  close_on_exit = true,
  shell = vim.o.shell,
})

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
