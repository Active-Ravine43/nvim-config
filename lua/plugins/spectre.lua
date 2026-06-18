return {
	"windwp/nvim-spectre",
	cmd = "Spectre",
	keys = { { "<leader>sr", "<cmd>Spectre<CR>", desc = "Search and replace (Spectre)" } },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("spectre").setup({})
	end,
}
