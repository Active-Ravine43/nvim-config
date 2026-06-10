-- ~/.config/nvim/lua/plugins/trouble.lua
-- Structured list panel for diagnostics, LSP references, quickfix, and more.
-- Complements [d / ]d (one-by-one) with a full overview.

return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",       desc = "Diagnostics (Trouble)" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics (Trouble)" },
        { "<leader>cs", "<cmd>Trouble symbols toggle<cr>",            desc = "Symbols (Trouble)" },
        { "<leader>cl", "<cmd>Trouble lsp toggle<cr>",                desc = "LSP references (Trouble)" },
    },
    config = function()
        require("trouble").setup({})
    end,
}
