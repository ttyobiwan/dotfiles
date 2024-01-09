local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'pyright',
	'ruff_lsp',
	'gopls',
	'templ',
	'html',
})

local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true })
	}),
})

-- Setup autosave
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
  vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vi", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrf", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rrf", function() vim.lsp.buf.rename() end, opts)
	lsp_format_on_save(bufnr)
end)

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.ruff_lsp.setup{}

lspconfig.pyright.setup{
	filetypes = {"python"}
}

lspconfig.gopls.setup{
	cms = {"gopls"},
	filetypes = {"go", "gomod", "gowork"},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		}
	}
}


lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

lsp.setup()
