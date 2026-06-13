-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
	"aparaatti/redish.vim",
	name = "redish",
	priority = 1000,
	config = function()
		vim.g.redish_transparent = 1
		vim.cmd("colorscheme redish")
	end,
}
