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
opt.cursorline = true -- highlight current line

-- Search
opt.ignorecase = true -- case-insensitive search…
opt.smartcase = true -- …unless you type uppercase
opt.incsearch = true -- show matches as you type
opt.hlsearch = true -- highlight all matches

-- System integration
opt.clipboard = "unnamedplus" -- yank/paste to system clipboard
opt.mouse = "a" -- enable mouse in all modes

-- Persistent undo across sessions
opt.undofile = true

-- Completion menu
opt.completeopt = { "menuone", "noselect" }

-- Performance
opt.updatetime = 250 -- faster LSP diagnostic refresh
opt.timeoutlen = 300 -- faster mapped-key timeout

-- Split behaviour
opt.splitright = true
opt.splitbelow = true

-- Live substitution preview
opt.inccommand = "split"

-- Hidden whitespace (disabled by default; toggle with :set list!)
opt.list = false
opt.listchars = { tab = "» ", trail = "·" }

-- Reduce swap/backup clutter (undo covers this)
opt.swapfile = false
opt.writebackup = false
