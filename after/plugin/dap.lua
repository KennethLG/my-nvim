local dap = require("dap")
local dapui = require("dapui")

-- Configure nvim-dap for Node.js debugging
require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  adapters = { "pwa-node", "node-terminal" },
})

-- Define Node.js Debugging Adapter
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = 9229,
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch Node.js",
    program = "${file}",
    cwd = vim.fn.getcwd(),
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach to Process",
    processId = require("dap.utils").pick_process,
    cwd = vim.fn.getcwd(),
  },
}

dap.configurations.typescript = dap.configurations.javascript


vim.keymap.set("n", "<leader>d", "<Nop>", { desc = "Debugging" }) -- Reserve `<leader>d`
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })

