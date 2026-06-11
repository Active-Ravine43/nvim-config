-- ~/.config/nvim/lua/plugins/flash.nvim
-- Fast jump navigation with instant labels for visible text

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>sj", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Jump to any visible position" },
        { "<leader>st", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,       desc = "Jump to treesitter node" },
    },
    config = function()
        require("flash").setup({
            search = {
                multi_window = false,
            },
        })
    end,
}
