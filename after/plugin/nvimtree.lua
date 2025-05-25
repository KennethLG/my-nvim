require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true
  }
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeAutoClose", { clear = true }),
  callback = function()
    local tree_win = vim.fn.bufwinnr("NvimTree")
    if tree_win ~= -1 and vim.fn.winnr() ~= tree_win then
      vim.cmd("NvimTreeClose")
    end
  end,
})

