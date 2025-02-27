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
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- Optional, for file icons
			"MunifTanjim/nui.nvim",
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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"github/copilot.vim",
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
      "nvim-neotest/nvim-nio"
    }
	})
end)
