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

			-- Diagnostic display
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				virtual_text = { source = "if_many", spacing = 2 },
				underline = { severity = vim.diagnostic.severity.ERROR },
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
					map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
					map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

					-- Document highlights (auto-highlight references under cursor)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local hl_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = args.buf,
							group = hl_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = args.buf,
							group = hl_augroup,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			-- Enable LSP servers
			vim.lsp.config("pyright", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = { enable = false },
					},
				},
			})
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
				accept = {
					auto_brackets = { enabled = false }, -- let nvim-autopairs own bracket handling
				},
				sources = {
					default = { "lsp", "path", "buffer", "snippets" },
				},
				signature = { enabled = true },
			})
		end,
	},
}
