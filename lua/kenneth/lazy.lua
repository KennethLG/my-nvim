return require("lazy").setup({
  -- Autocompletado
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              results_width = 0.4,
              preview_width = 0.6,
            },
          },
          path_display = { "truncate" },
          dynamic_preview_title = true,
          file_ignore_patterns = {
            "node_modules/",
            "%.git/",
            "dist/",
            "build/",
            "coverage/",
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>fs", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      -- New API: setup() only accepts install_dir; highlight/indent are native
      require("nvim-treesitter").setup()
      -- Install parsers on startup (async, won't block)
      require("nvim-treesitter.install").install({
        "tsx", "javascript", "typescript", "c", "lua", "vim", "vimdoc",
        "query", "markdown", "markdown_inline", "graphql", "cpp", "html", "css", "java",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local select = require("nvim-treesitter-textobjects.select")
      local maps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
      for key, query in pairs(maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query, "textobjects")
        end)
      end
    end,
  },

  -- Navigation / utils
  {
    "theprimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        disable_keymaps = true,
        under_cursor = false,
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "tab",
        close_on_exit = true,
        shell = vim.o.shell,
      })
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
  },

  -- Mini plugins
  {
    "echasnovski/mini.surround",
    branch = "main",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup()
    end,
  },

  -- DAP (debugging)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
        },
      }

      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node)",
            cwd = "${workspaceFolder}",
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to running process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end

      vim.keymap.set("n", "<leader>d", "<Nop>", { desc = "Debugging" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })

      vim.fn.sign_define("DapBreakpoint",          { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint",            { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped",             { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected",  { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

      vim.api.nvim_set_hl(0, "DapBreakpoint",          { fg = "#e51400" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#ffcc00" })
      vim.api.nvim_set_hl(0, "DapLogPoint",            { fg = "#00b7ff" })
      vim.api.nvim_set_hl(0, "DapStopped",             { fg = "#00ff9f" })
      vim.api.nvim_set_hl(0, "DapStoppedLine",         { bg = "#005f87" })
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 100,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
      })
    end,
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort = { sorter = "case_sensitive" },
        view = { adaptive_size = false, width = 50 },
        renderer = { group_empty = true },
        filters = { dotfiles = false },
        update_focused_file = { enable = true },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          api.config.mappings.default_on_attach(bufnr)

          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          vim.keymap.set("n", "h", function()
            local node = api.tree.get_node_under_cursor()
            if node.type == "directory" and node.open then
              api.node.open.edit()
            else
              api.node.navigate.parent_close()
            end
          end, opts("Close Directory"))

          vim.keymap.set("n", "l", function()
            api.node.open.edit()
          end, opts("Open File or Expand Directory"))

          vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
        end,
      })

      vim.keymap.set("n", "<leader>e", function()
        local api = require("nvim-tree.api")
        local view = require("nvim-tree.view")
        if view.is_visible() then
          api.tree.close()
        else
          api.tree.open({ find_file = false, focus = true })
        end
      end, { noremap = true, silent = true, desc = "NvimTree fullscreen like `nvim .`" })

      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NvimTreeAutoClose", { clear = true }),
        callback = function()
          local tree_win = vim.fn.bufwinnr("NvimTree")
          if tree_win ~= -1 and vim.fn.winnr() ~= tree_win then
            vim.cmd("NvimTreeClose")
          end
        end,
      })
    end,
  },

  -- UI
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { globalstatus = true },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            { "filename", path = 1 },
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              sections = { "error", "warn", "info" },
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
              },
            },
          },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = {
            "location",
            {
              function()
                return " " .. os.date("%H:%M:%S")
              end,
              color = function()
                local hour = tonumber(os.date("%H"))
                if hour < 6 then
                  return { fg = "#ff5555", bg = "#222222", gui = "bold" }
                elseif hour < 12 then
                  return { fg = "#fab387", bg = "#222222", gui = "bold" }
                elseif hour < 18 then
                  return { fg = "#89b4fa", bg = "#222222", gui = "bold" }
                else
                  return { fg = "#cba6f7", bg = "#222222", gui = "bold" }
                end
              end,
            },
          },
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").enabled = true
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier", "eslint_d" },
          typescript = { "prettier", "eslint_d" },
          javascriptreact = { "prettier", "eslint_d" },
          typescriptreact = { "prettier", "eslint_d" },
          json = { "prettier" },
          lua = { "stylua" },
          cpp = { "clang_format" },
          c = { "clang_format" },
        },
        notify_on_error = true,
      })

      vim.keymap.set("", "<leader>F", function()
        require("conform").format({ async = true }, function(err)
          if not err then
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(string.lower(mode), "v") then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end
          end
        end)
      end, { desc = "Format code" })
    end,
  },

  -- Web dev
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Themes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          bufferline = true,
          mini = { enabled = true, indentscope_color = "" },
        },
      })
    end,
  },
  { "folke/tokyonight.nvim", opts = { transparent = true } },
  { "rebelot/kanagawa.nvim", opts = { transparent = true } },
  {
    "sainnhe/everforest",
    init = function()
      vim.g.everforest_transparent_background = 1
    end,
  },
  { "ellisonleao/gruvbox.nvim", opts = { transparent_mode = true } },
  { "rose-pine/neovim", name = "rose-pine", opts = { disable_background = true } },
  { "dracula/vim", name = "dracula" },
})
