-- https://github.com/akinsho/toggleterm.nvim
local M = {}

M.toggle_lazygit = function(exec)
  local Terminal = require("toggleterm.terminal").Terminal
  local exec_term = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
  }
  exec_term:toggle()
end

return M
