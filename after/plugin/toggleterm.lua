require("toggleterm").setup({
  size = 20,                        -- Default terminal size
  open_mapping = [[<C-\>]],         -- Toggle terminal with Ctrl + t
  hide_numbers = true,              -- Hide line numbers in terminal
  shade_filetypes = {},
  shade_terminals = true,           -- Dim inactive terminals
  shading_factor = 2,
  start_in_insert = true,           -- Start terminal in insert mode
  persist_size = true,              -- Remember terminal size
  direction = "float",         -- Terminal opens horizontally (can be "vertical" or "float")
  close_on_exit = true,             -- Close terminal when the process exits
  shell = vim.o.shell,              -- Use the default shell
})

-- Keybindings
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })    -- Exit terminal to normal mode
local function map_toggleterm(id, key)
  vim.keymap.set("n", key, function()
    require("toggleterm.terminal").Terminal
      :new({ id = id, hidden = true })
      :toggle()
  end, { noremap = true, silent = true })
end

-- Bind keys to specific terminal instances
map_toggleterm(1, "<leader>1")  -- Open Terminal 1 with <leader>1
map_toggleterm(2, "<leader>2")  -- Open Terminal 2 with <leader>2
map_toggleterm(3, "<leader>3")  -- Open Terminal 3 with <leader>3
