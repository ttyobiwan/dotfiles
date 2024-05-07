return {
	{ 'hrsh7th/nvim-cmp' },  -- Required
	{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip"
		},
		config = function()
			local cmp = require('cmp')
			local ls = require('luasnip')

			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node

			ls.add_snippets("python", {
				s("fp", {
					t("print("),
					i(1),
					t(")")
				}),
				s("li", {
					t('logger.info("'),
					i(1),
					t('")')
				}),
				s("le", {
					t('logger.error("'),
					i(1),
					t('")')
				}),
			})

			ls.add_snippets("go", {
				s("ifer", {
					t({ "if err != nil {", "\t" }),
					i(1, "return err"),
					t({ "", "}" })
				}),
				s("fp", {
					t("fmt.Println("),
					i(1),
					t(")")
				}),
				s("ae", {
					t("assert.Equal(t, "),
					i(1, "expected"),
					t(", "),
					i(2, "actual"),
					t(")")
				}),
				s("hf", {
					t("func "),
					i(1),
					t("(w http.ResponseWriter, r *http.Request) {"),
					t({ "\t", "}" }),
				}),
				s("jm", {
					t("data, err := json.Marshal("),
					i(1),
					t(")")
				}),
				s("ju", {
					t("err := json.Unmarshal("),
					i(1, "data"),
					t(", &"),
					i(2, "target"),
					t(")")
				}),
				s("fori", {
					t("for i := 0; i < "),
					i(1),
					t("; i++ {"),
					t({ "\t", "" }),
					t("}")
				}),
				s("ts", {
					t("time.Sleep(time.Second * "),
					i(1, ""),
					t(")")
				}),
				s("ef", {
					t("return fmt.Errorf(\""),
					i(1),
					t(": %w\", err)")
				}),
			})

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
					['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
					['<CR>'] = cmp.mapping.confirm({ select = true })
				}),
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				sources = cmp.config.sources(
					{
						{ name = 'luasnip' },
						{ name = 'nvim_lsp' },
					},
					{
						{ name = 'buffer' },
					}
				),
			})
		end
	},
}
