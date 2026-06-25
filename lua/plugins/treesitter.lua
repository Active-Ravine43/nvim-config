-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua", "python", "typescript", "javascript",
				"bash", "html", "css", "json", "yaml", "toml",
				"markdown", "markdown_inline", "diff", "vimdoc",
				"regex", "query",
			},
			highlight = { enable = true },
			indent = { enable = true },
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end,
}
