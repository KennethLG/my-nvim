vim.opt.mouse = ""
vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.has("win32") == 1
  and vim.fn.stdpath("data") .. "/undodir"
  or os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99        -- Keep most folds open
vim.opt.foldlevelstart = 99   -- Open all folds on startup
vim.opt.foldenable = true     -- Enable folding
vim.opt.foldcolumn = "1"      -- Show fold markers

