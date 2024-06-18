return {
	-- LSP Support
	{ 'neovim/nvim-lspconfig' },          -- Required
	{ 'williamboman/mason.nvim' },        -- Optional
	{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

	-- UI
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim"
		}
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
		},
		config = function()
			local lsp = require("lsp-zero")

			lsp.preset("recommended")

			lsp.ensure_installed({
				'lua_ls',
				'ruff_lsp',
				'pyright',
				'gopls',
			})

			-- Autoformatting
			local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
			local lsp_format_on_save = function(bufnr)
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end

			local on_attach = (function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "<leader>vi", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "<leader>ren", function() vim.lsp.buf.rename() end, opts)

				lsp_format_on_save(bufnr)
			end)
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			local navbuddy = require("nvim-navbuddy")

			lspconfig.lua_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "lua" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						},
					},
				},
			}

			lspconfig.ruff_lsp.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "python" },
				init_options = {
					settings = {
						-- Some of those are here because there is too much noise
						-- Others are present because pyright is shit
						args = {
							-- Imports order (shut up)
							"--ignore", "I001",
							-- Unused imports (colision with pyright)
							"--ignore", "F401",
							-- Unused variables (colision)
							"--ignore", "F841",
							-- Missing docstring (noise)
							"--ignore", "D103"
						},
					}
				}
			}

			lspconfig.pyright.setup {
				on_attach = function(client, bufnr)
					navbuddy.attach(client, bufnr)
					on_attach(client, bufnr)
				end,
				capabilities = capabilities,
				filetypes = { "python" },
				settings = {
					pyright = {
						disableOrganizeImports = false,
					},
					python = {
						analysis = {
							autoImportCompletion = true,
							autoSearchPaths = true,
							diagnosticMode = 'openFilesOnly',
							useLibraryCodeForTypes = true,
							typeCheckingMode = 'basic',
							-- This thing fucking sux
							-- Some changes work, some don't
							diagnosticSeverityOverrides = {
								reportUnusedImport = false,
								reportUnusedVariable = false,
								reportUnusedFunction = false,
								reportUnusedClass = false,
								-- Too problematic with Django...
								reportAttributeAccessIssue = false,
								-- Doesn't like Celery tasks...
								reportCallIssue = false,
							},
						},
					}
				}
			}


			lspconfig.gopls.setup {
				on_attach = function(client, bufnr)
					navbuddy.attach(client, bufnr)
					on_attach(client, bufnr)
				end,
				capabilities = capabilities,
				cms = { "gopls" },
				filetypes = { "go", "gomod", "gowork" },
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
				},
			}

			lsp.setup()
		end
	}
}
