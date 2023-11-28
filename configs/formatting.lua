-- https://github.com/stevearc/conform.nvim
require("conform").setup {
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    -- Use a sub-list to run only the first available formatter
    html = { { "prettier" } },
    javascript = { { "prettier" } },
    javascriptreact = { { "prettier" } },
    typescript = { { "prettier" } },
    typescriptreact = { { "prettier" } },
    go = { { "gofmt" } },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}
