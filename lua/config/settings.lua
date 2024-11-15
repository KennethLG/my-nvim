
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
vim.cmd[[colorscheme dracula]]
vim.g.dracula_colorterm = 0   -- Disable term colors if using a non-truecolor terminal
vim.g.dracula_italic_comment = true  -- Enable italic comments
-- vim.g.dracula_transparent_bg = true  -- Make the background transparent
