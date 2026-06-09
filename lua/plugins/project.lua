-- ~/.config/nvim/lua/plugins/project.lua

return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			detection_methods = { "pattern" },
			patterns = { ".git", "package.json", "pyproject.toml", "requirements.txt" },
		})
		require("telescope").load_extension("projects")
		vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Find projects" })
	end,
}
