-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- 加载默认配置
require("custom.setting").load_options()

vim.api.nvim_create_user_command("BufCloseAllBufs", function()
  require("nvchad.tabufline").closeAllBufs()
end, {})
