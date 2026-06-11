-- ~/.config/nvim/lua/plugins/neo-tree.lua

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file tree" })

        -- Inside neo-tree: <leader>cd changes working directory to the hovered folder
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "neo-tree",
            callback = function()
                vim.keymap.set("n", "<leader>cd", function()
                    local node = require("neo-tree.sources.manager")
                        .get_state("filesystem")
                        .tree:get_node()
                    if node and node.type == "directory" then
                        vim.cmd("cd " .. vim.fn.fnameescape(node.path))
                        vim.notify("cd → " .. node.path, vim.log.levels.INFO)
                    end
                end, { buffer = true, desc = "Change directory to folder" })
            end,
        })
    end,
}
