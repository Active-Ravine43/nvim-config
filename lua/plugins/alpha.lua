-- ~/.config/nvim/lua/plugins/alpha.lua
-- Dashboard / landing page shown on startup when no file is opened

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- ASCII art header (classic Neovim logo)
        dashboard.section.header.val = {
            "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
            "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
            "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }

        -- Dashboard buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file",     ":Telescope find_files<CR>"),
            dashboard.button("n", "  New file",      ":ene<CR>"),
            dashboard.button("r", "  Recent files",  ":Telescope oldfiles<CR>"),
            dashboard.button("p", "  Projects",      ":Telescope projects<CR>"),
            dashboard.button("g", "  Live grep",     ":Telescope live_grep<CR>"),
            dashboard.button("c", "  Config",        ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", "  Quit",          ":qa<CR>"),
        }

        dashboard.section.footer.val = "   Neovim ready"

        -- Set header and footer to red
        dashboard.section.header.opts.hl = "DashboardHeader"
        dashboard.section.footer.opts.hl = "DashboardFooter"

        -- Define the custom red highlight groups
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#610303" })
        vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#930101" })

        -- Layout: header at top, buttons centered below
        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.config)

        -- Disable folding on the dashboard buffer
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
                vim.opt_local.foldenable = false
            end,
        })
    end,
}
