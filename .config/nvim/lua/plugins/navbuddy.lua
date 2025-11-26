return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>nav", ":Navbuddy<cr>", { desc = "Open navbuddy" })
	end
}
