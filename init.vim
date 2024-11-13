" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')
let mapleader = " "
" Example plugins
Plug 'tpope/vim-sensible'            " Basic default settings
Plug 'junegunn/fzf.vim'              " Fuzzy finder (requires fzf)
Plug 'scrooloose/nerdtree'           " File explorer
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

lua << EOF
local nvim_lsp = require('lspconfig')

-- TypeScript and JavaScript LSP setup
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
    -- Additional setup for tsserver
    require("nvim-lsp-ts-utils").setup {}
  end,
}
EOF
lua << EOF
require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'horizontal', -- Can be 'horizontal', 'vertical', 'float'
  shade_terminals = true,
}
EOF

