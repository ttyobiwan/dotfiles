local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.ruff_lsp.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"}
}
lspconfig.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cms = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true
      }
    }
}

