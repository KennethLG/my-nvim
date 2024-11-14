
local util = require "formatter.util"
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    },
  },
})


vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.js", "*.ts" },
    command = "FormatWriteLock"
})

