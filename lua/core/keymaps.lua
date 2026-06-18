-- ~/.config/nvim/lua/core/keymaps.lua
-- General (non-plugin) keymaps

local map = vim.keymap.set

-- Save
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save" })
map("v", "<C-s>", "<Esc>:w<CR>", { desc = "Save" })

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })

-- Scroll with cursor centred
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, recenter" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, recenter" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
