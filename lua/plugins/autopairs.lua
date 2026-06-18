-- ~/.config/nvim/lua/plugins/autopairs.lua
-- Auto-close brackets, quotes, etc. — insert ( gives () with cursor between
-- blink.cmp has accept.auto_brackets disabled (see lsp.lua) so autopairs
-- owns bracket handling without fighting the completion menu.

return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt" },
        })
    end,
}
