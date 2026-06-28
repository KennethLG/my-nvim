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

vim.keymap.set("n", "<leader>d",  "<Nop>",                { desc = "Debugging" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint,  { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue,           { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<leader>ds", dap.step_over,          { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into,          { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_out,           { desc = "Step Out" })
vim.keymap.set("n", "<leader>du", dapui.toggle,           { desc = "Toggle Debug UI" })

vim.fn.sign_define("DapBreakpoint",          { text = "", texthl = "DapBreakpoint",         linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint",            { text = "", texthl = "DapLogPoint",            linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped",             { text = "", texthl = "DapStopped",             linehl = "DapStoppedLine", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected",  { text = "", texthl = "DapBreakpointRejected",  linehl = "", numhl = "" })

vim.api.nvim_set_hl(0, "DapBreakpoint",          { fg = "#e51400" })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#ffcc00" })
vim.api.nvim_set_hl(0, "DapLogPoint",            { fg = "#00b7ff" })
vim.api.nvim_set_hl(0, "DapStopped",             { fg = "#00ff9f" })
vim.api.nvim_set_hl(0, "DapStoppedLine",         { bg = "#005f87" })
