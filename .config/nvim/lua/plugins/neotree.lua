return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			vim.keymap.set("n", "<leader>q", "<Cmd>Neotree reveal<CR>")
			require("neo-tree").setup({
				window = {
					position = "float"
				},
				filesystem = {
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false
					},
					filtered_items = {
						show_hidden_count = false
					}
				},
			})
		end
	}
}
