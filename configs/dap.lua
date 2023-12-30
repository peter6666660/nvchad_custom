local M = {}

M.ui = function()
  local dap, dapui = require "dap", require "dapui"
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
  dapui.setup()
  require("nvim-dap-virtual-text").setup {
    commented = true,
    virt_text_pos = vim.fn.has "nvim-0.10" == 1 and "inline" or "eol",
  }
  -- require("nvim-dap-repl-highlights").setup()
end

M.setup = function()
  vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
  M.ui()
end

return M
