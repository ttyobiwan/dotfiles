return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		if vim.fn.argc(-1) == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = false,
			enable_diagnostics = false,
			filesystem = {
				follow_current_file = {
					enabled = true
				},
				filtered_items = {
					show_hidden_count = false
				}
			},
			default_component_configs = {
				indent = {
					with_markers = true,
					with_expanders = true,
				},
			},
			window = {
				position = "left",
				width = 35,
			},
		})
		vim.api.nvim_set_keymap('n', '<leader>q', '<Cmd>Neotree<CR>', { noremap = true, silent = true })
	end
}
