return {
	"neovim/nvim-lspconfig",
	dependencies = { 'saghen/blink.cmp' },
	config = function()
		local navbuddy = require("nvim-navbuddy")

		-- Keymaps
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
		vim.keymap.set("n", "<leader>vi", function() vim.diagnostic.open_float() end)
		vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end)
		vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end)
		vim.keymap.set("n", "<leader>ren", function() vim.lsp.buf.rename() end)

		-- Lsp on attach
		local navbuddy_skip = { 'ruff', 'GitHub Copilot', "copilot" }
		local format_skip = { 'pyright', 'copilot', 'GitHub Copilot' }
		local format_group = vim.api.nvim_create_augroup('LspFormat', { clear = true })

		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local c = vim.lsp.get_client_by_id(args.data.client_id)
				if not c then return end

				if not vim.tbl_contains(navbuddy_skip, c.name) then
					navbuddy.attach(c, args.buf)
				end

				-- pyright handles hover
				if c.name == 'ruff' then
					c.server_capabilities.hoverProvider = false
				end

				if not vim.tbl_contains(format_skip, c.name) then
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = format_group,
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
						end,
					})
				end
			end,
		})

		-- Lua
		vim.lsp.config('lua_ls', {
			filetypes = { "lua" },
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		})
		vim.lsp.enable('lua_ls')

		-- Elixir
		vim.lsp.config('elixirls', {
			cmd = { vim.fn.expand("~/.local/share/mise/installs/elixir-ls/0.30.0/language_server.sh") },
			cmd_env = {
				ASDF_DIR = "",
				ASDF_DATA_DIR = "",
			},
			settings = {
				elixirLS = {
					dialyzerEnabled = false,
					fetchDeps = false,
					suggestSpecs = false,
					enableTestLenses = false,
				},
			},
		})
		vim.lsp.enable('elixirls')

		-- Python
		vim.lsp.config('ruff', {})
		vim.lsp.enable('ruff')

		vim.lsp.config('ty', {
			cmd = { 'uvx', 'ty', 'server' },
			settings = {
				ty = {}
			}
		})
		vim.lsp.enable('ty')

		-- Go
		vim.lsp.config('gopls', {})
		vim.lsp.enable('gopls')

		-- TS
		vim.lsp.enable('vtsls')
	end
}
