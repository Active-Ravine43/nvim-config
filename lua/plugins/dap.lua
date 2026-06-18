---@diagnostic disable: undefined-field
-- DAP debugger: nvim-dap (core) + dap-ui (visual) + dap-python (debugpy) + mason-nvim-dap (auto-install)

return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: start/continue",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: step over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: step into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: step out",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: toggle breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Debug: continue",
			},
		},
		config = function() end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dapui = require("dapui")
			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.50 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
						},
						position = "right",
						size = 45,
					},
					{
						elements = {
							{ id = "repl", size = 0.50 },
							{ id = "console", size = 0.50 },
						},
						position = "bottom",
						size = 12,
					},
				},
				floating = { max_height = 0.9, max_width = 0.9 },
			})
			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local mason_debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(mason_debugpy)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "debugpy" },
				automatic_installation = true,
			})
		end,
	},
}
