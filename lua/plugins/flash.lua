-- ~/.config/nvim/lua/plugins/flash.nvim
-- Fast jump navigation with instant labels for visible text

-- ~/.config/nvim/lua/plugins/flash.nvim
-- Fast jump navigation with instant labels for visible text
-- s → jump to any text  |  S → jump to treesitter node
-- f/t/F/T get labels automatically (char mode)  |  / search also gets labels

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
        { "s",  mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash jump" },
        { "S",  mode = { "n", "x", "o" }, function() require("flash").treesitter() end,       desc = "Flash treesitter" },
    },
    config = function()
        require("flash").setup({
            search = { multi_window = false },
            modes = {
                search = { enabled = true },  -- labels during / and ? search
                char = { enabled = true, jump_labels = true },  -- labels on f / F / t / T motions
            },
        })
    end,
}
