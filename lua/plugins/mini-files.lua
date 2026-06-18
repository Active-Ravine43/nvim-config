return {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{
			"<leader>mf",
			function()
				require("mini.files").open(vim.fn.getcwd())
			end,
			desc = "Mini files (file manager)",
		},
	},
	config = function()
		require("mini.files").setup({
			mappings = { close = "q", go_in = "L", go_out = "H", go_in_plus = "<CR>" },
			options = { use_as_default_explorer = false },
		})
	end,
}
