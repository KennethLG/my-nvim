require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    bufferline = true,
    mini = { enabled = true, indentscope_color = "" },
  },
})

require("tokyonight").setup({ transparent = true })
require("kanagawa").setup({ transparent = true })
vim.g.everforest_transparent_background = 1
require("gruvbox").setup({ transparent_mode = true })
require("rose-pine").setup({ disable_background = true })

local themes = {
  "catppuccin",
  "tokyonight-night",
  "kanagawa",
  "everforest",
  "gruvbox",
  "rose-pine",
}

local statefile = vim.fn.stdpath("data") .. "/colorscheme_random.txt"

local function is_random_enabled()
  local f = io.open(statefile, "r")
  if f then
    local val = f:read("*l")
    f:close()
    return val == "1"
  end
  return false
end

local function set_random_enabled(enabled)
  local f = io.open(statefile, "w")
  if f then
    f:write(enabled and "1" or "0")
    f:close()
  end
end

local theme
if is_random_enabled() then
  math.randomseed(os.time())
  theme = themes[math.random(#themes)]
else
  theme = "catppuccin" -- default
end

vim.cmd.colorscheme(theme)
vim.notify("🎨 Colorscheme: " .. theme .. (is_random_enabled() and " (random)" or " (default)"))

vim.api.nvim_create_user_command("ToggleColorschemeRandom", function()
  local enabled = not is_random_enabled()
  set_random_enabled(enabled)
  print("Random colorscheme " .. (enabled and "enabled" or "disabled"))
end, {})

vim.keymap.set("n", "<leader>cr", "<cmd>ToggleColorschemeRandom<CR>", { desc = "Toggle random colorscheme" })

