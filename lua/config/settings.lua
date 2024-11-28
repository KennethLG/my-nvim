
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
vim.opt.swapfiles = false
vim.opt.wrap = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.mapleader = "\\"
require("nvim-autopairs").setup({})
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitGutterAdd', text = '+'},
    change       = {hl = 'GitGutterChange', text = '~'},
    delete       = {hl = 'GitGutterDelete', text = '-'},
    topdelete    = {hl = 'GitGutterDelete', text = '‾'},
    changedelete = {hl = 'GitGutterChange', text = '~'},
  },
  numhl = true,  -- Enable number highlighting for the signs
}

local function caps_lock()
  return os.execute("xset q | grep -q 'Caps Lock:   on'") == 0 and "CAPS ON" or ""
end

local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { { 'filename', path=1 }, 'branch' },
    lualine_c = {
      '%=', caps_lock
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
      {
        function()
          local result = vim.fn.searchcount({ maxcount = 999, timeout = 500 })
          if result.total == 0 then
            return ''
          end
          return string.format('%d/%d', result.current, result.total)
        end,
        icon = ''
      },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
-- Custom function to display Caps Lock state
vim.cmd[[colorscheme dracula]]
vim.g.dracula_colorterm = 0   -- Disable term colors if using a non-truecolor terminal
vim.g.dracula_italic_comment = true  -- Enable italic comments
-- vim.g.dracula_transparent_bg = true  -- Make the background transparent
vim.g.NERDTreeShowHidden = 1

require('nvim-surround').setup({})
