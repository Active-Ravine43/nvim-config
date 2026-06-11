-- ~/.config/nvim/init.lua
-- Entry point — leader, bootstrap lazy.nvim, load config modules

-- Leader must be set before anything else
vim.g.mapleader = " "

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Core settings
require("core.options")
require("core.keymaps")

-- Plugins (each file returns a spec or list of specs)
require("lazy").setup({
	require("plugins.colorscheme"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.neo-tree"),
	require("plugins.lualine"),
	require("plugins.conform"),
	require("plugins.project"),
	require("plugins.gitsigns"),
	require("plugins.comment"),
	require("plugins.surround"),
	require("plugins.ts-context-commentstring"),
	require("plugins.lint"),
	require("plugins.trouble"),
	require("plugins.alpha"),
	require("plugins.neogit"),
	require("plugins.which-key"),
	require("plugins.autopairs"),
	require("plugins.indent-blankline"),
	require("plugins.todo-comments"),
	require("plugins.toggleterm"),
	require("plugins.auto-session"),
	require("plugins.flash"),
})
