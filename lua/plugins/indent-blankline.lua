-- ~/.config/nvim/lua/plugins/indent-blankline.lua
-- Vertical indent guides so nested code is scannable

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    config = function()
        require("ibl").setup({
            scope = { enabled = false },
        })
    end,
}
