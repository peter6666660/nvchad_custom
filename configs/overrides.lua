local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  -- windwp/nvim-ts-autotag 支持html闭合
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "xml",
      "markdown",
      "handlebars",
      "hbs",
      "tsx",
      "jsx",
      "rescript",
    },
  },
  -- JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

M.mason = {
  ensure_installed = {
    -- web dev stuff
    "vscode-html-language-server",
    "typescript-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
