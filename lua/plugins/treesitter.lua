-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- stable old API; new "main" branch requires tree-sitter-cli >= 0.26.1
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "python", "typescript", "javascript" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
