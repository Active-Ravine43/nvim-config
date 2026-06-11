-- ~/.config/nvim/lua/plugins/auto-session.lua
-- Automatically save and restore your open buffers per project

return {
    "rmagatti/auto-session",
    lazy = false, -- must load at startup to detect sessions
    config = function()
        require("auto-session").setup({
            auto_save = true,
            auto_restore = true,
            auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
        })
    end,
}
