local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_set_option('clipboard', 'unnamedplus')

vim.wo.relativenumber = true
vim.opt.number = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<leader>zz",
	function()
		local fcvalue = vim.api.nvim_win_get_option(0, "foldcolumn")
		if fcvalue == "0" then
			vim.cmd("set foldcolumn=9")
		else
			vim.cmd("set foldcolumn=0")
		end
	end,
	{ desc = "Add left margin", remap = true }
)

vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "Next buffer" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

require("lazy").setup("tobi.plugins")
