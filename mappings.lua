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
    ["<leader>tt"] = { "<cmd>TranslateW<cr>", "翻译整行", opts = { silent = true } },
    -- 可以弹出变量所在文件内容，并支持编辑
    -- ["<leader>gd"] = {"<cmd>Lspsaga peek_definition<CR>", "查看属性的定义",opts={ silent = true }}
  },
  v = {
    ["<leader>tt"] = { ":TranslateW<cr>", "选中翻译", opts = { silent = true } },
  }
}

M.gitsigns = {
  n = {
    --toggleterm 终端及lazigit浮窗
    ["<leader>gg"] = { "<cmd>lua require('custom/configs/toggleterm_lazygit').toggle_lazygit()<CR>", "lazygit", opts = {
      silent = true } },
  }
}

M.tabufline = {
  n = {
    ["<leader>bo"] = { ":BufCloseOther<CR>", "关闭其他tab", opts = { nowait = true } },
  }
}

return M
