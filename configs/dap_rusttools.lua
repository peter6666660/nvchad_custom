local M = {}
local utils = require "core.utils"
M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}
M.setup = function()
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
    tools = {
      hover_actions = {
        auto_focus = true,
      },
    },
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = true,
      },
    },
    server = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    },
  }

  rt.setup(opts)
end

return M
