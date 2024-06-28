local options = require("configs.lspconfig").on_attach
local capabilities = require("configs.lspconfig").capabilities


return options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}
