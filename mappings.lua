---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q<CR>", "退出", opts = { nowait = true } },
    ["<leader>ww"] = { "<cmd> w <CR>", "save file" },
    ["<leader><cr>"] = { "<cmd>nohlsearch<CR>", "清空选中" },
    ["s"] = { ":HopWord<cr>", "快速跳转", opts = { silent = true } },
    ["S"] = { ":HopChar2<cr>", "根据指定文字快速跳转", opts = { silent = true } },
    --vim-translator 翻译
    ["<leader>tt"] = { "<cmd>Translate<cr>", "翻译整行", opts = { silent = true } },
  },
  v = {
    ["<leader>tt"] = { ":Translate<cr>", "选中翻译", opts = { silent = true } },
  },
}
M.lspconfig = {
  n = {},
}

M.gitsigns = {
  n = {
    --toggleterm 终端及lazigit浮窗
    ["<leader>gg"] = {
      "<cmd>lua require('custom/configs/toggleterm_lazygit').toggle_lazygit()<CR>",
      "lazygit",
      opts = {
        silent = true,
      },
    },
  },
}

M.tabufline = {
  n = {
    ["<leader>ba"] = { ":BufCloseAllBufs<CR>", "关闭其他tab", opts = { nowait = true } },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint", opts = { nowait = true } },
    ["<leader>dc"] = { ":lua require'dap'.continue()<CR>", "Continue", opts = { nowait = true } },
    ["<leader>du"] = { ":lua require'dapui'.toggle()<CR>", "Dap UI", opts = { nowait = true } },
    ["<leader>de"] = { ":lua require'dapui'.eval()<CR>", "Eval", opts = { nowait = true } },
  },
}
return M
