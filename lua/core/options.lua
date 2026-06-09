-- ~/.config/nvim/lua/core/options.lua
-- All vim.opt settings live here

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = false
opt.autoindent = true

-- Display
opt.wrap = false
opt.termguicolors = true
opt.scrolloff = 8 -- keep 8 lines visible above/below cursor
opt.signcolumn = "yes" -- always show the gutter (stops layout jumping)
