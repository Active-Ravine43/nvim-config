-- ~/.config/nvim/lua/plugins/which-key.lua
-- Shows available keymaps as you type a prefix (like <leader>, g, y, etc.)

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({})

        -- Register named groups so related keys show up together
        local wk = require("which-key")
        wk.add({
            -- Telescope
            { "<leader>f", group = "Find" },
            -- Git
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Hunk" },
            -- LSP
            { "<leader>r", group = "Rename" },
            { "<leader>c", group = "Code" },
            -- Diagnostics
            { "<leader>x", group = "Diagnostics" },

            -- g-prefix group (comment, etc.)
            { "gc", group = "Comment" },
            { "gb", group = "Block comment" },
        })
    end,
}
