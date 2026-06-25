-- ~/.config/nvim/lua/plugins/toggleterm.lua
-- Persistent terminal that floats or splits, toggled with a key

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
        { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
        {
            "<leader>gl",
            function()
                require("toggleterm").exec(
                    "git log --graph --oneline --all --decorate",
                    1 -- float
                )
            end,
            desc = "Git graph (terminal)",
        },
    },
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<leader>tt]],
            direction = "float",
            float_opts = {
                border = "curved",
            },
        })
    end,
}
