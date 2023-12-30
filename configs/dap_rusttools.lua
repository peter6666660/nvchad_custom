HOME_PATH = os.getenv "HOME" .. "/"
MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"
local codelldb_path = MASON_PATH .. "codelldb/extension/adapter/codelldb"
local liblldb_path = MASON_PATH .. "codelldb/extension/lldb/lib/liblldb"
local this_os = vim.loop.os_uname().sysname
local rt = require "rust-tools"

if this_os == "Linux" then
  liblldb_path = liblldb_path .. ".so"
else
  -- macOS
  liblldb_path = liblldb_path .. ".dylib"
end

local opts = {
  -- debugging stuff
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
  -- server = {
  --   on_attach = function(_, bufnr)
  --     -- Hover actions
  --     vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
  --     -- Code action groups
  --     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
  --   end,
  -- },
}

rt.setup(opts)
