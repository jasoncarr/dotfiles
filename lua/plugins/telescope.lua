return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Search text" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Open buffers" },
    { "<leader>fr", function() require("telescope.builtin").oldfiles() end,   desc = "Recent files" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help" },
    { "<leader>fn", function() require("telescope.builtin").find_files({ cwd = vim.g.notes_dir }) end, desc = "Find notes" },
  },
  opts = {},
}
