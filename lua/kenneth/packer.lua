vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use({
		"neovim/nvim-lspconfig",
		requires = {
			{ "williamboman/mason.nvim", tag = "v1.*" },
			{ "williamboman/mason-lspconfig.nvim", tag = "v1.*" },
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use({ "akinsho/toggleterm.nvim", version = "*" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use({
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({
		"stevearc/conform.nvim",
	})
	use({
		"mg979/vim-visual-multi",
		branch = "master",
	})
	use({
		"tpope/vim-fugitive",
	})
	use({ "dracula/vim", as = "dracula" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		as = "ibl",
	})
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui", -- UI for debugging
			"mxsdev/nvim-dap-vscode-js", -- VSCode JS DAP adapter
			"nvim-telescope/telescope-dap.nvim", -- Telescope integration
			"nvim-neotest/nvim-nio",
		},
	})
	use({
		"RRethy/vim-illuminate",
	})
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use({
		"ray-x/lsp_signature.nvim",
	})
	use({
		"antosha417/nvim-lsp-file-operations",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})
end)
