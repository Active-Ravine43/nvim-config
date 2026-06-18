return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	keys = {
		{
			"<leader>re",
			function()
				require("refactoring").refactor("Extract Function")
			end,
			desc = "Refactor: extract function",
			mode = { "n", "x" },
		},
		{
			"<leader>rf",
			function()
				require("refactoring").refactor("Extract Block To File")
			end,
			desc = "Refactor: extract to file",
			mode = { "n", "x" },
		},
		{
			"<leader>ri",
			function()
				require("refactoring").refactor("Inline Variable")
			end,
			desc = "Refactor: inline variable",
			mode = { "n", "x" },
		},
		{
			"<leader>rv",
			function()
				require("refactoring").refactor("Extract Variable")
			end,
			desc = "Refactor: extract variable",
			mode = { "n", "x" },
		},
	},
	config = function()
		require("refactoring").setup({})
	end,
}
