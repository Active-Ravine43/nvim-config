-- ~/.config/nvim/lua/plugins/autopairs.lua
-- Auto-close brackets, quotes, etc. — insert ( gives () with cursor between

return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({})

        -- If you ever add blink.cmp, uncomment this to prevent
        -- autopairs from fighting with the completion menu:
        -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        -- require("blink.cmp").setup({ on_confirm_done = cmp_autopairs.on_confirm_done() })
    end,
}
