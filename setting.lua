local M = {}
M.load_options = function()
  local opt = vim.opt
  -- 折叠配置
  opt.foldenable = false
  opt.foldlevel = 99
  opt.foldmethod = "expr"
  opt.foldexpr = "nvim_treesitter#foldexpr()"
  -- 无法自动启折叠功能临时解决方案 https://github.com/nvim-telescope/telescope.nvim/issues/699
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "normal zx",
  })

  -- voldikss/vim-translator
  vim.g.translator_default_engines = { "bing" }
  vim.g.translator_window_type = "popup"
end
return M
