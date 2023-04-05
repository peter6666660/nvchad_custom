local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
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
			require("hop").setup({})
		end,
	},
  --翻译插件
  {
    "voldikss/vim-translator",
    lazy = false,
  },
  -- 轻松修改括号，引号等成对符号
  {"tpope/vim-surround", lazy=false},
  -- 快速选中块, 空格键激活
  { "gcmt/wildfire.vim", lazy=false },
  -- 终端配置
	{
		"akinsho/toggleterm.nvim",
    config=true
	},
  -- 快速选中 类似 vscode 的 c-d
	-- https://github.com/mg979/vim-visual-multi/wiki/Quick-start
	{ "mg979/vim-visual-multi", lazy=false }
}

return plugins
