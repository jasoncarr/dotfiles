return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = function(l, r, desc)
        vim.keymap.set("n", l, r, { buffer = bufnr, desc = desc })
      end
      map("]h", function() gs.nav_hunk("next") end, "Next change")
      map("[h", function() gs.nav_hunk("prev") end, "Previous change")
      map("<leader>gp", gs.preview_hunk, "Preview change")
      map("<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
      map("<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")
    end,
  },
}
