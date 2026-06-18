return {
	"ThePrimeagen/99",
	keys = {
		{
			"<leader>9v",
			mode = "v",
			function()
				require("99").visual()
			end,
			desc = "AI: run on visual selection",
		},
		{
			"<leader>9s",
			function()
				require("99").search()
			end,
			desc = "AI: search",
		},
		{
			"<leader>9x",
			function()
				require("99").stop_all_requests()
			end,
			desc = "AI: stop generation",
		},
	},
	config = function()
		local _99 = require("99")
		_99.setup({
			provider = _99.Providers.ClaudeCodeProvider,
			completion = { source = "blink" },
		})
	end,
}
