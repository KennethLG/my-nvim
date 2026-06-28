require("conform").setup({
  formatters_by_ft = {
    javascript      = { "prettier", "eslint_d" },
    typescript      = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    json            = { "prettier" },
    lua             = { "stylua" },
    cpp             = { "clang_format" },
    c               = { "clang_format" },
  },
  notify_on_error = true,
})

vim.keymap.set("", "<leader>F", function()
  require("conform").format({ async = true }, function(err)
    if not err then
      local mode = vim.api.nvim_get_mode().mode
      if vim.startswith(string.lower(mode), "v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end
    end
  end)
end, { desc = "Format code" })
