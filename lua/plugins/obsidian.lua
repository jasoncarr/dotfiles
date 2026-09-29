return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>",          desc = "New note" },
    { "<leader>ot", "<cmd>Obsidian today<cr>",        desc = "Today's daily note" },
    { "<leader>os", "<cmd>Obsidian search<cr>",       desc = "Search notes" },
    { "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "Jump to note" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>",    desc = "Backlinks" },
  },
  opts = {
    legacy_commands = false,
    workspaces = { { name = "notes", path = vim.g.notes_dir } },
    daily_notes = { folder = "daily", date_format = "%Y-%m-%d" },
    picker = { name = "telescope.nvim" },
    ui = { enable = false },   -- let render-markdown handle the display
  },
}
