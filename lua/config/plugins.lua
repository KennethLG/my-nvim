-- ~/.config/nvim/lua/config/plugins.lua

-- Initialize vim-plug
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'tpope/vim-sensible'             " Basic default settings
  Plug 'junegunn/fzf.vim'               " Fuzzy finder (requires fzf)
  Plug 'scrooloose/nerdtree'            " File explorer
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'         " Git diff in the gutter

  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'mhartington/formatter.nvim'

  Plug 'williamboman/mason.nvim'          " Mason for managing external tools like LSP servers
  Plug 'williamboman/mason-lspconfig.nvim' " Bridge between Mason and nvim-lspconfig
  Plug 'neovim/nvim-lspconfig'          " LSP support
  Plug 'hrsh7th/nvim-cmp'               " Completion plugin
  Plug 'hrsh7th/cmp-nvim-lsp'           " LSP completion for nvim-cmp
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'mfussenegger/nvim-lint'

  Plug 'akinsho/toggleterm.nvim'
  Plug 'L3MON4D3/LuaSnip'               " Snippet engine
  Plug 'saadparwaiz1/cmp_luasnip'       " Snippet completions for nvim-cmp
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'akinsho/bufferline.nvim'
  Plug 'kyazdani42/nvim-web-devicons'   " File icons
  Plug 'nvim-lua/plenary.nvim'          " Required dependency for Telescope
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'numToStr/Comment.nvim'
  
  Plug 'mg979/vim-visual-multi'
  call plug#end()
]])


