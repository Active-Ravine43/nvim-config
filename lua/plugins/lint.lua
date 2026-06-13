-- ~/.config/nvim/lua/plugins/lint.lua
-- Async linting — companion to conform.nvim.
-- conform formats; nvim-lint reports errors. Both feed vim.diagnostic.

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Assign linters per filetype (mirrors conform's formatters_by_ft)
		lint.linters_by_ft = {
			python = { "ruff" },
			typescript = { "eslint" },
			javascript = { "eslint" },
			lua = { "selene" },
		}

		-- Resolve ruff from the project's .venv first, fall back to PATH.
		-- eslint already resolves from node_modules/.bin/ automatically.
		lint.linters.ruff.cmd = function()
			local root = vim.fs.root(0, {
				".git",
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				".venv",
			})
			if root then
				local venv_ruff = vim.fs.joinpath(root, ".venv", "bin", "ruff")
				if vim.uv.fs_stat(venv_ruff) then
					return venv_ruff
				end
			end
			-- Only return "ruff" if it actually exists on PATH
			if vim.fn.executable("ruff") == 1 then
				return "ruff"
			end
			return nil -- linter not available; nvim-lint will skip silently
		end

		-- Run linting on these events (errors suppressed so missing linters don't interrupt)
		local augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = augroup,
			callback = function()
				pcall(lint.try_lint)
			end,
		})
	end,
}
