local dap = require('dap')
local dapui = require('dapui')
dapui.setup()

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}", --let both ports be the same for now...
  executable = {
    command = "node",
    -- -- 💀 Make sure to update this path to point to your installation
    args = { vim.fn.stdpath('data') .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
    -- command = "js-debug-adapter",
    -- args = { "${port}" },
  },
}

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Current File (pwa-node)',
      cwd = "${workspaceFolder}", -- vim.fn.getcwd(),
      args = { '${file}' },
      sourceMaps = true,
      protocol = 'inspector',
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach to running process',
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}"
    },
  }
end

vim.keymap.set("n", "<leader>d", "<Nop>", { desc = "Debugging" }) -- Reserve `<leader>d`
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })


-- 🧩 Custom DAP signs (íconos visuales)
vim.fn.sign_define('DapBreakpoint',          { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint',            { text = '', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped',             { text = '', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected',  { text = '', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })

-- 🎨 Colores (puedes ajustar a tu esquema actual)
vim.api.nvim_set_hl(0, 'DapBreakpoint',          { fg = '#e51400' })  -- rojo
vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#ffcc00' })  -- amarillo
vim.api.nvim_set_hl(0, 'DapLogPoint',            { fg = '#00b7ff' })  -- celeste
vim.api.nvim_set_hl(0, 'DapStopped',             { fg = '#00ff9f' })  -- verde-menta
vim.api.nvim_set_hl(0, 'DapStoppedLine',         { bg = '#1e1e2e' })  -- fondo sutil para la línea actual

vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#3b4252' })
vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#005f87' })


require('nvim-dap-virtual-text').setup()
