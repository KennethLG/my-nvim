vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>bd", ":bp | bd #<CR>", { noremap = true })


vim.keymap.set("n", "zR", function() vim.cmd("set foldlevel=99") end) -- Open all folds
vim.keymap.set("n", "zM", function() vim.cmd("set foldlevel=0") end)  -- Close all folds

