-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- new API; requires tree-sitter-cli >= 0.26.1
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "python", "typescript", "javascript" },
			modules = {
				---@diagnostic disable-next-line: missing-fields
				highlight = { enable = true },
				---@diagnostic disable-next-line: missing-fields
				indent = { enable = true },
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
		})
	end,
}
