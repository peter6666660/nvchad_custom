local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require "lspconfig"

  -- if you just want default config for the servers then put them in a table
  -- "tailwindcss"
  local servers = { "html", "cssls", "tsserver", "clangd", "asm_lsp", "gopls", "vuels" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
  -- lspconfig.pyright.setup { blabla}
end

return M
