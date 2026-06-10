-- ~/.config/nvim/lua/plugins/neogit.lua
-- Visual git interface — stage, commit, push, pull without leaving Neovim

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim", -- side-by-side diff on demand
    },
    cmd = "Neogit",
    keys = {
        { "<leader>gg", "<cmd>Neogit<CR>", desc = "Git status (Neogit)" },
    },
    config = function()
        require("neogit").setup({
            integrations = {
                diffview = true, -- use diffview.nvim for diffs instead of fugitive
            },
        })
    end,
}
