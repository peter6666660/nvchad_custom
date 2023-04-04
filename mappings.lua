---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>ww"] = { "<cmd> w <CR>", "save file" },
    ["<leader><cr>"] = { "<cmd>nohlsearch<CR>", "清空选中" },
    ["s"] = { ":HopWord<cr>", "快速跳转", opts={silent=true} },
    ["S"] = { ":HopChar2<cr>", "根据指定文字快速跳转" ,opts={silent=true}},
  },
}

-- more keybinds!

return M
