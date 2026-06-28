local function conf(name)
  return function() require("kenneth.plugins." .. name) end
end

return require("lazy").setup({
  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "mfussenegger/nvim-jdtls" },
  { "ray-x/lsp_signature.nvim" },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua" },
    config = function() require("lsp-file-operations").setup() end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = conf("telescope"),
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = conf("treesitter"),
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Navigation
  { "theprimeagen/harpoon",  config = conf("harpoon") },
  { "mbbill/undotree",       config = function() vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) end },
  { "tpope/vim-fugitive" },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({ disable_keymaps = true, under_cursor = false })
    end,
  },
  { "mg979/vim-visual-multi", branch = "master" },

  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*", config = conf("toggleterm") },

  -- Mini
  { "echasnovski/mini.surround", branch = "main", config = function() require("mini.surround").setup() end },
  { "echasnovski/mini.pairs",                     config = function() require("mini.pairs").setup() end },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = conf("dap"),
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function() require("nvim-dap-virtual-text").setup() end,
  },

  -- Git
  { "lewis6991/gitsigns.nvim", config = conf("gitsigns") },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = conf("nvimtree"),
  },

  -- UI
  { "nvim-lualine/lualine.nvim",       dependencies = { "nvim-tree/nvim-web-devicons" }, config = conf("lualine") },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = function() require("ibl").setup() end },
  { "folke/which-key.nvim",            config = function() require("which-key").setup() end },
  { "sphamba/smear-cursor.nvim",       config = function() require("smear_cursor").enabled = true end },

  -- Formatting
  { "stevearc/conform.nvim", config = conf("conform") },

  -- Web dev
  { "windwp/nvim-ts-autotag", config = function() require("nvim-ts-autotag").setup() end },

  -- Themes
  { "catppuccin/nvim",       name = "catppuccin", config = conf("catppuccin") },
  { "folke/tokyonight.nvim", opts = { transparent = true } },
  { "rebelot/kanagawa.nvim", opts = { transparent = true } },
  { "sainnhe/everforest",    init = function() vim.g.everforest_transparent_background = 1 end },
  { "ellisonleao/gruvbox.nvim", opts = { transparent_mode = true } },
  { "rose-pine/neovim",      name = "rose-pine", opts = { disable_background = true } },
  { "dracula/vim",           name = "dracula" },
})
