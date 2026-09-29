return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = { width = 32 },
      renderer = { group_empty = true },
      update_focused_file = { enable = true },
      filters = { dotfiles = false },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>",   { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal current file" })
  end,
}
