" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')
let mapleader = " "
" Example plugins
Plug 'tpope/vim-sensible'            " Basic default settings
Plug 'junegunn/fzf.vim'              " Fuzzy finder (requires fzf)
Plug 'scrooloose/nerdtree'           " File explorer
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'        " Git diff in the gutter

" LSP (Language Server Protocol) support
Plug 'neovim/nvim-lspconfig'            " Collection of configurations for the built-in LSP client

" Autocompletion plugin
Plug 'hrsh7th/nvim-cmp'                 " Completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'             " LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'               " Buffer completion source for nvim-cmp
Plug 'hrsh7th/cmp-path'                 " Path completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lua'             " Lua completion source for Neovim's Lua API
Plug 'akinsho/toggleterm.nvim'

" Snippet support
Plug 'L3MON4D3/LuaSnip'                 " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'         " Snippet completions for nvim-cmp

" Treesitter for better syntax highlighting and parsing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Additional TypeScript and JavaScript LSP enhancements
Plug 'jose-elias-alvarez/null-ls.nvim'  " LSP diagnostics, code actions, etc., with ESLint and Prettier support
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'  " Extra utilities for TypeScript LSP

" Tabs
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons' " For file icons

" Pussy finder (Fuzzy Finder)
Plug 'nvim-lua/plenary.nvim' " Required dependency for Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'ray-x/lsp_signature.nvim'

" Comments tool
Plug 'numToStr/Comment.nvim'

" Initialize plugin system
call plug#end()


" Basic Neovim Configuration

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable syntax highlighting
syntax on

" Set tabs and indentation
set tabstop=4         " Number of spaces a <Tab> represents
set shiftwidth=4      " Number of spaces for auto-indent
set expandtab         " Use spaces instead of tabs
set autoindent        " Copy indent from the current line

" Enable mouse support
set mouse=a

" Enable clipboard integration
set clipboard=unnamedplus

" Set a color scheme
colorscheme desert    " Change to any other color scheme you prefer

" Set search options
set hlsearch          " Highlight search results
set incsearch         " Incremental search
set ignorecase        " Case-insensitive search
set smartcase         " Case-sensitive if uppercase is used

" Enable line wrapping
set wrap

" Show command in bottom bar
set showcmd

" Set up basic status line
set laststatus=2
set ruler             " Show cursor position in the status line

" Enable 24-bit RGB color in the TUI
set termguicolors

" Set split options
set splitright        " Vertical splits to the right
set splitbelow        " Horizontal splits to the bottom
set clipboard+=unnamedplus

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-1> :ToggleTerm 1<CR>
nnoremap <C-2> :ToggleTerm 2<CR>
nnoremap <C-3> :ToggleTerm 3<CR>
nnoremap <C-4> :ToggleTerm 4<CR>
nnoremap <C-a> ggVG

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Move current line down with Alt + j

nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv

" Move current line up with Alt + k
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" Lua config
lua << EOF
-- set up LSP config
local nvim_lsp = require('lspconfig')

nvim_lsp.ts_ls.setup {
  on_attach = function(client, bufnr)
    -- Set up completion using nvim-cmp
    local cmp = require'cmp'
    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
      },
    }
    -- Keybinding to go to definition
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_command('autocmd InsertCharPre * lua if vim.fn.pumvisible() == 0 and vim.v.char == "(" or vim.v.char == "," then vim.lsp.buf.signature_help() end')
    require "lsp_signature".on_attach({
        bind = true,
        hint_enable = true,
        floating_window = true,
        handler_opts = { border = "rounded" },
        toggle_key = "<C-k>",   -- Optional: If you want to use this key to toggle signature
        select_signature_key = "<M-n>",
    }, bufnr)
    -- Additional setup for tsserver
    -- require("nvim-lsp-ts-utils").setup {}
    vim.keymap.set('n', '<C-k>', function()
        require('lsp_signature').toggle_float_win()
    end, { silent = true, noremap = true, desc = 'Toggle signature help window' })
  end,
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "html", "json", "css", "lua" }, -- Add any other languages you need
  highlight = {
    enable = true,              -- Enable Treesitter-based highlighting
    additional_vim_regex_highlighting = false,  -- Turn off legacy highlighting
  },
}

require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'horizontal', -- Can be 'horizontal', 'vertical', 'float'
  shade_terminals = true,
}

require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "slant",
  }
}

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules", ".git/", "dist", "build"}
  }
}



require('Comment').setup()

EOF

