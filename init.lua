-- ===== Notes folder =====
-- Use the local notes folder on Linux and the OneDrive-backed notes folder on Windows.
local is_windows = vim.fn.has("win32") == 1

if is_windows then
  vim.g.notes_dir = vim.fn.expand("~/OneDrive - Mastec/notes")
else
  vim.g.notes_dir = vim.fn.expand("~/notes")
end

-- obsidian.nvim requires the workspace directory to already exist.
vim.fn.mkdir(vim.g.notes_dir, "p")

-- nvim-tree replaces the built-in file browser
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ===== Basics =====
vim.g.mapleader = " "
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.mouse = "a"
opt.clipboard = "unnamedplus"   -- system clipboard via wl-clipboard
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- 2-space indent for web files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "javascript", "json" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Highlight fenced Markdown code blocks using Neovim's built-in syntax files.
-- This is dependency-free and works on Linux and Windows.
-- Aliases map common Markdown fence names to Neovim syntax filetypes.
vim.g.markdown_fenced_languages = {
  "bash=sh",
  "shell=sh",
  "sh",
  "zsh=sh",
  "powershell=ps1",
  "pwsh=ps1",
  "ps1",
  "lua",
  "python",
  "javascript",
  "js=javascript",
  "typescript",
  "ts=typescript",
  "jsx=javascriptreact",
  "tsx=typescriptreact",
  "json",
  "jsonc=json",
  "html",
  "css",
  "scss",
  "sql",
  "yaml",
  "yml=yaml",
  "toml",
  "vim",
  "c",
  "cpp",
}

-- Markdown / notes settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
  end,
})

-- ===== Keymaps =====
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>",     { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>ts", function()
  vim.opt_local.spell = not vim.opt_local.spell:get()
  vim.notify("Spell check " .. (vim.opt_local.spell:get() and "on" or "off"))
end, { desc = "Toggle spell check" })
vim.keymap.set("n", "<leader>fs", function()
  require("telescope.builtin").spell_suggest()
end, { desc = "Spelling suggestions" })

-- Jump between Markdown headings. Only active in Markdown buffers.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(event)
    vim.keymap.set("n", "]m", function()
      vim.fn.search("^\\s*#\\+\\s", "W")
    end, { buffer = event.buf, desc = "Next Markdown heading" })

    vim.keymap.set("n", "[m", function()
      vim.fn.search("^\\s*#\\+\\s", "bW")
    end, { buffer = event.buf, desc = "Previous Markdown heading" })
  end,
})

-- ===== Plugin manager (lazy.nvim) =====
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Theme switching (Gruvbox, Vague, Melange, Tender)
require("theme-switcher").setup()
