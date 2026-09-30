return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "soft",
      transparent_mode = false,
    },
  },

  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = false,
        bold = true,
        italic = true,
      })
    end,
  },

  {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "jacoborus/tender.vim",
    lazy = false,
    priority = 1000,
  },
}
