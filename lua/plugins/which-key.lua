-- ~/.config/nvim/lua/plugins/which-key.lua
-- Explicit cheat sheet — press <leader>k to see all keymaps

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>k",
			function()
				require("which-key").show({ keys = "<leader>" })
			end,
			desc = "Cheat sheet (keymaps)",
		},
	},
	opts = {
		preset = "modern",
		spec = {
			-- Find
			{ "<leader>f",  group = "Find" },
			{ "<leader>ff", desc = "Find files" },
			{ "<leader>fg", desc = "Live grep" },
			{ "<leader>fb", desc = "Buffers" },
			{ "<leader>fp", desc = "Projects" },
			{ "<leader>fh", desc = "Help tags" },
			{ "<leader>fk", desc = "Keymaps" },
			{ "<leader>fo", desc = "Recent files" },
			{ "<leader>fs", desc = "Git status" },
			{ "<leader>fc", desc = "Git commits" },

			-- Diagnostics
			{ "<leader>x",  group = "Diagnostics" },
			{ "<leader>xx", desc = "Toggle diagnostics" },
			{ "<leader>xX", desc = "Buffer diagnostics" },

			-- Git
			{ "<leader>g",  group = "Git" },
			{ "<leader>gg", desc = "Status (Neogit)" },
			{ "<leader>gl", desc = "Git graph (terminal)" },

			-- Hunk
			{ "<leader>h",  group = "Hunk" },
			{ "<leader>hs", desc = "Stage hunk" },
			{ "<leader>hr", desc = "Reset hunk" },
			{ "<leader>hp", desc = "Preview hunk" },
			{ "<leader>hb", desc = "Blame line" },

			-- Refactor
			{ "<leader>r",  group = "Refactor" },
			{ "<leader>rn", desc = "Rename" },
			{ "<leader>re", desc = "Extract function" },
			{ "<leader>rf", desc = "Extract to file" },
			{ "<leader>ri", desc = "Inline variable" },
			{ "<leader>rv", desc = "Extract variable" },
			{ "<leader>sr", desc = "Search and replace" },

			-- Code
			{ "<leader>c",  group = "Code" },
			{ "<leader>ca", desc = "Code action" },
			{ "<leader>cs", desc = "Symbols (Trouble)" },
			{ "<leader>cl", desc = "LSP references (Trouble)" },

			-- Debug (DAP)
			{ "<leader>d",  group = "Debug" },
			{ "<leader>db", desc = "Toggle breakpoint" },
			{ "<leader>dc", desc = "Continue" },

			-- Search (flash.nvim: s = jump to text, S = treesitter)
			{ "<leader>s",  group = "Search" },
			{ "<leader>sr", desc = "Search and replace" },
			{ "s",          desc = "Flash jump to text" },
			{ "S",          desc = "Flash treesitter" },

			-- Toggles
			{ "<leader>e",  desc = "Toggle file tree" },
			{ "<leader>k",  desc = "Cheat sheet" },
			{ "<C-\\>",     desc = "Toggle terminal" },

			-- Comment
			{ "gc",  group = "Comment" },
			{ "gb",  group = "Block comment" },

			-- Diagnostics navigation
			{ "[d",  desc = "Prev diagnostic" },
			{ "]d",  desc = "Next diagnostic" },

			-- Git hunk navigation
			{ "[c",  desc = "Prev hunk" },
			{ "]c",  desc = "Next hunk" },

			-- Overseer
			{ "<leader>o",  group = "Overseer" },
			{ "<leader>or", desc = "Run task" },
			{ "<leader>ol", desc = "List tasks" },
			{ "<leader>ot", desc = "Toggle panel" },

			-- AI
			{ "<leader>9",  group = "AI" },
			{ "<leader>9v", desc = "AI visual" },
			{ "<leader>9s", desc = "AI search" },
			{ "<leader>9x", desc = "Stop AI" },

			-- Mini
			{ "<leader>m",  group = "Mini" },
			{ "<leader>mf", desc = "File manager" },

			-- Function keys (DAP)
			{ "<F5>",  desc = "Debug start/continue" },
			{ "<F10>", desc = "Debug step over" },
			{ "<F11>", desc = "Debug step into" },
			{ "<F12>", desc = "Debug step out" },
		},
	},
}
