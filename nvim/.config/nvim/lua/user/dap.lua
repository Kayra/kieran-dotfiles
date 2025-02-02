require('nvim-dap-virtual-text').setup()
require('dapui').setup()
require('user.dbg.init')

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open();
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close();
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close();
end
