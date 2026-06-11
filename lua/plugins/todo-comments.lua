-- ~/.config/nvim/lua/plugins/todo-comments.lua
-- Highlight TODO, FIXME, HACK, and other keywords in comments

return {
    "folke/todo-comments.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({})
    end,
}
