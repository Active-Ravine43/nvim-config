-- ~/.config/nvim/lua/plugins/telescope.lua

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local map = vim.keymap.set
		map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
		map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
		map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffers" })
	end,
}
