local overrides = require "custom.configs.overrides"
local dap = require "custom.configs.dap"

---@type NvPluginSpec[]
local plugins = {
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
  -- 注释插件
  {
    "numToStr/Comment.nvim",
    config = function()
      -- 支持jsx, tsx, vue
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- formatting
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      require "custom.configs.formatting"
    end,
  },
  -- lint
  {
    "mfussenegger/nvim-lint",
    lazy = false,
    config = function()
      require "custom.configs.linting"
    end,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- 类似easymotion 快查找 vim插件-- 使用 leap替换
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup {}
    end,
  },
  --翻译插件
  {
    "voldikss/vim-translator",
  },
  -- 轻松修改括号，引号等成对符号
  { "tpope/vim-surround", lazy = false },
  -- 快速选中块, 空格键激活
  { "gcmt/wildfire.vim", lazy = false },
  -- 终端配置
  {
    "akinsho/toggleterm.nvim",
    config = true,
  },
  -- 快速选中 类似 vscode 的 c-d
  -- https://github.com/mg979/vim-visual-multi/wiki/Quick-start
  { "mg979/vim-visual-multi", lazy = false },
  -- 自动闭合html等标签
  { "windwp/nvim-ts-autotag", lazy = false },
  -- 注释支持 jsx
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  -- diffview git
  {
    "sindrets/diffview.nvim",
    config = function()
      require("hop").setup {}
    end,
  },

  -- debug - dap - start
  {
    "mfussenegger/nvim-dap",
    config = function()
      dap.setup()
    end,
  },
  { "folke/neodev.nvim" },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  { "LiadOz/nvim-dap-repl-highlights" },
  -- development rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require "custom.configs.dap_rusttools"
    end,
  },

  -- command - plugins
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      require "custom.configs.wilder"
    end,
  },
  -- markdown-preview
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   run = "cd app && npm install",
  --   setup = function()
  --   vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- }
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup {
        chunk = {
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = "#00ffff",
        },

        indent = {
          chars = {
            "․",
          },
          style = {
            { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"), "" },
            "#806d9c",
            "#c06f98",
          },
        },
      }
    end,
  },
}

return plugins
