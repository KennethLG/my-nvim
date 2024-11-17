
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = "on"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.cmd([[colorscheme desert]])
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.mapleader = "\\"
require("nvim-autopairs").setup({})

local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
  yellow = '#f9dc5c',
  green  = '#98c379',
}

-- Custom function to display Caps Lock state

local function caps_lock()
  return os.execute("xset q | grep -q 'Caps Lock:   on'") == 0 and "CAPS ON" or ""
end

-- Lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {'filename', path = 1},
      { caps_lock, color = { fg = colors.yellow, bg = colors.black, gui = 'bold' } },
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

vim.cmd[[colorscheme dracula]]
vim.g.dracula_colorterm = 0   -- Disable term colors if using a non-truecolor terminal
vim.g.dracula_italic_comment = true  -- Enable italic comments
-- vim.g.dracula_transparent_bg = true  -- Make the background transparent
vim.g.NERDTreeShowHidden = 1
