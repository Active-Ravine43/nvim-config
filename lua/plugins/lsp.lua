-- ~/.config/nvim/lua/plugins/lsp.lua
-- Mason (LSP installer) + lspconfig + blink.cmp (completion)
-- These are in one file because they're tightly coupled

return {
	-- LSP package manager
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()

			-- Auto-install LSP servers
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "ts_ls", "lua_ls" },
				automatic_installation = true,
			})

			-- LSP keymaps — fired every time a server attaches to a buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf }
					local map = vim.keymap.set
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					map("n", "[d", vim.diagnostic.goto_prev, opts)
					map("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})

			-- Enable LSP servers
			vim.lsp.config("pyright", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("lua_ls", {})
			vim.lsp.enable({ "pyright", "ts_ls", "lua_ls" })
		end,
	},

	-- Autocomplete
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("blink.cmp").setup({
				keymap = { preset = "default" },
				appearance = {
					use_nvim_hl_groups = true,
				},
				sources = {
					default = { "lsp", "path", "buffer", "snippets" },
				},
				signature = { enabled = true },
			})
		end,
	},
}
