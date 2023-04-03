---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>ww"] = { "<cmd> w <CR>", "save file" },
  },
}

-- more keybinds!

return M
