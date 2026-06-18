return {
	"stevearc/overseer.nvim",
	cmd = { "OverseerRun", "OverseerList", "OverseerToggle" },
	keys = {
		{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer: run task" },
		{ "<leader>ol", "<cmd>OverseerList<CR>", desc = "Overseer: list tasks" },
		{ "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer: toggle panel" },
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
}
