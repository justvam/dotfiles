local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.rust_analyzer.setup({
--     on_attach=on_attach,
--     capabilities=capabilities,
--     filetypes={"rust"},
--     root_dir = lspconfig.util.root_pattern("Cargo.toml"),
--     settings = {
--       ['rust_analyzer'] = {
--         cargo = {
--           allFeatures = true,
--         },
--       },
--     },
-- })

-- 
-- lspconfig.pyright.setup { blabla}
