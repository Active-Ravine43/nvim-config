-- ~/.config/nvim/lua/core/keymaps.lua
-- General (non-plugin) keymaps

local map = vim.keymap.set

-- Save
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save" })
map("v", "<C-s>", "<Esc>:w<CR>", { desc = "Save" })

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Scroll with cursor centred
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, recenter" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, recenter" })
