-- Initialize vim-plug for plugins
vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')
]]

vim.g.mapleader = "\\"  -- Set leader key

-- Example plugins
vim.cmd [[
Plug 'tpope/vim-sensible'            " Basic default settings
Plug 'junegunn/fzf.vim'              " Fuzzy finder (requires fzf)
Plug 'scrooloose/nerdtree'           " File explorer
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'        " Git diff in the gutter
Plug 'neovim/nvim-lspconfig'         " LSP support
Plug 'hrsh7th/nvim-cmp'              " Completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'          " LSP completion for nvim-cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'akinsho/toggleterm.nvim'
Plug 'L3MON4D3/LuaSnip'              " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'ray-x/lsp_signature.nvim'
Plug 'numToStr/Comment.nvim'
call plug#end()
]]

-- Basic Neovim Configuration
vim.opt.number = true                    -- Enable line numbers
vim.opt.relativenumber = true            -- Enable relative line numbers
vim.opt.syntax = "on"                    -- Enable syntax highlighting
vim.opt.tabstop = 4                      -- Number of spaces a <Tab> represents
vim.opt.shiftwidth = 4                   -- Number of spaces for auto-indent
vim.opt.expandtab = true                 -- Use spaces instead of tabs
vim.opt.autoindent = true                -- Copy indent from the current line
vim.opt.mouse = "a"                      -- Enable mouse support
vim.opt.clipboard = "unnamedplus"        -- Enable clipboard integration
vim.cmd [[colorscheme desert]]           -- Set color scheme
vim.opt.hlsearch = true                  -- Highlight search results
vim.opt.incsearch = true                 -- Incremental search
vim.opt.ignorecase = true                -- Case-insensitive search
vim.opt.smartcase = true                 -- Case-sensitive if uppercase is used
vim.opt.wrap = true                      -- Enable line wrapping
vim.opt.showcmd = true                   -- Show command in bottom bar
vim.opt.laststatus = 2                   -- Set up basic status line
vim.opt.ruler = true                     -- Show cursor position in status line
vim.opt.termguicolors = true             -- Enable 24-bit RGB color in the TUI
vim.opt.splitright = true                -- Vertical splits to the right
vim.opt.splitbelow = true                -- Horizontal splits to the bottom

-- Mappings
vim.api.nvim_set_keymap("n", "<leader>e", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })

-- Lua Plugin Configuration
local nvim_lsp = require('lspconfig')

nvim_lsp.ts_ls.setup {
  on_attach = function(client, bufnr)
    -- nvim-cmp setup for completion
    local cmp = require'cmp'
    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
      },
    }
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  end,
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "html", "json", "css", "lua" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require("toggleterm").setup {
  open_mapping = [[<C-\>]],
  direction = 'horizontal',
  shade_terminals = true,
}

vim.api.nvim_set_keymap('n', '<leader>1', ':1ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':2ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':3ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':4ToggleTerm<CR>', { noremap = true, silent = true })

require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "slant",
  }
}

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {"node_modules", ".git/", "dist", "build"}
  }
}

require('Comment').setup()

