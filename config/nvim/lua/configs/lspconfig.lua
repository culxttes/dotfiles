-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local ok, ltex_config = pcall(require, "ltex_config")
if not ok then ltex_config = {} end

lspconfig.ltex.setup({
  settings = {
    ltex = {
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "fr",
      },
      languageToolHttpServerUri = "https://api.languagetoolplus.com/",
      languageToolOrg = {
        apiKey = ltex_config.apiKey or "",
        username = ltex_config.username or "",
      },
      language = "fr",
      completionEnabled = true,
      diagnosticSeverity = "warning",
    },
  },
})

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
