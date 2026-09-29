return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
  -- Heading text colour + faint background tint, H1 to H6
  local headings = {
    { fg = "#fabd2f", bg = "#413a29" },  -- H1 yellow
    { fg = "#fe8019", bg = "#423326" },  -- H2 orange
    { fg = "#b8bb26", bg = "#393a28" },  -- H3 green
    { fg = "#8ec07c", bg = "#343a32" },  -- H4 aqua
    { fg = "#83a598", bg = "#333735" },  -- H5 blue
    { fg = "#d3869b", bg = "#3d3336" },  -- H6 purple
  }
    require("gruvbox").setup({
      contrast = "soft",
      transparent_mode = false,
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
