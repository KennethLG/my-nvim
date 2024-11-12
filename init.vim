" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Example plugins
Plug 'tpope/vim-sensible'            " Basic default settings
Plug 'junegunn/fzf.vim'              " Fuzzy finder (requires fzf)
Plug 'scrooloose/nerdtree'           " File explorer
Plug 'airblade/vim-gitgutter'        " Git diff in the gutter

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

