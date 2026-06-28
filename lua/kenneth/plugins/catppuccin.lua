require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  integrations = {
    cmp        = true,
    gitsigns   = true,
    nvimtree   = true,
    treesitter = true,
    bufferline = true,
    mini       = { enabled = true, indentscope_color = "" },
  },
})
