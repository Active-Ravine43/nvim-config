-- ~/.config/nvim/lua/plugins/conform.lua

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "black" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
