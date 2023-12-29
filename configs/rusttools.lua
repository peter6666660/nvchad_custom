HOME_PATH = os.getenv "HOME" .. "/"
MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"
local codelldb_path = MASON_PATH .. "codelldb/extension/adapter/codelldb"
local liblldb_path = MASON_PATH .. "codelldb/extension/lldb/lib/liblldb"
local this_os = vim.loop.os_uname().sysname

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
}

require("rust-tools").setup(opts)
