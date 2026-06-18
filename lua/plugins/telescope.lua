-- ~/.config/nvim/lua/plugins/telescope.lua
-- Fuzzy finder — files, grep, buffers, git, help, keymaps
-- Uses fzf-native for C-compiled sorting (~10× faster than Lua)

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          sorting_strategy = "descending",
          path_display = { "filename_first" },
          file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "__pycache__/",
            "venv/",
            ".venv/",
            "%.lock",
            "dist/",
            "build/",
          },
          layout_strategy = "flex",
          preview_cutoff = 120, -- disable preview on narrow windows
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = { additional_args = { "--hidden" } },
        },
      })

      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("projects")

      -- Keymaps
      local map = vim.keymap.set
      map("n", "<leader>ff", ":Telescope find_files<CR>",  { desc = "Find files" })
      map("n", "<leader>fg", ":Telescope live_grep<CR>",   { desc = "Live grep" })
      map("n", "<leader>fb", ":Telescope buffers<CR>",     { desc = "Buffers" })
      map("n", "<leader>fh", ":Telescope help_tags<CR>",   { desc = "Help tags" })
      map("n", "<leader>fk", ":Telescope keymaps<CR>",     { desc = "Keymaps" })
      map("n", "<leader>fo", ":Telescope oldfiles<CR>",    { desc = "Recent files" })
      map("n", "<leader>fs", ":Telescope git_status<CR>",  { desc = "Git status" })
      map("n", "<leader>fc", ":Telescope git_commits<CR>", { desc = "Git commits" })
    end,
  },
}
