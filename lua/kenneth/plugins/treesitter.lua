require("nvim-treesitter").setup()
require("nvim-treesitter.install").install({
  "tsx", "javascript", "typescript", "c", "lua", "vim", "vimdoc",
  "query", "markdown", "markdown_inline", "graphql", "cpp", "html", "css", "java",
  "gdscript",
})

local select = require("nvim-treesitter-textobjects.select")
local maps = {
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["ac"] = "@class.outer",
  ["ic"] = "@class.inner",
}
for key, query in pairs(maps) do
  vim.keymap.set({ "x", "o" }, key, function()
    select.select_textobject(query, "textobjects")
  end)
end
