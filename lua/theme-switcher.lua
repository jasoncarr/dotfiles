local M = {}

local themes = {
  { name = "Gruvbox", colorscheme = "gruvbox", background = "dark" },
  { name = "Vague",   colorscheme = "vague",   background = "dark" },
  { name = "Melange", colorscheme = "melange", background = "dark" },
  { name = "Tender",  colorscheme = "tender",  background = "dark" },
}

local function current_index()
  local current = vim.g.colors_name

  for index, theme in ipairs(themes) do
    if theme.colorscheme == current then
      return index
    end
  end

  return 1
end

local function apply(index, notify)
  local theme = themes[index]
  vim.o.background = theme.background

  local ok, err = pcall(function()
    vim.cmd.colorscheme(theme.colorscheme)
  end)

  if not ok then
    vim.notify(
      ("Could not load theme %s: %s"):format(theme.name, err),
      vim.log.levels.ERROR
    )
    return
  end

  if notify ~= false then
    vim.notify("Theme: " .. theme.name)
  end
end

function M.next()
  local index = current_index()
  apply((index % #themes) + 1)
end

function M.previous()
  local index = current_index()
  apply(((index - 2) % #themes) + 1)
end

function M.choose()
  vim.ui.select(themes, {
    prompt = "Choose Neovim theme:",
    format_item = function(theme)
      return theme.name
    end,
  }, function(theme)
    if not theme then
      return
    end

    for index, candidate in ipairs(themes) do
      if candidate.colorscheme == theme.colorscheme then
        apply(index)
        return
      end
    end
  end)
end

function M.setup()
  -- Keep Gruvbox as the startup default.
  apply(1, false)

  vim.keymap.set("n", "<leader>tt", M.next, {
    desc = "Next theme",
  })

  vim.keymap.set("n", "<leader>tT", M.previous, {
    desc = "Previous theme",
  })

  vim.keymap.set("n", "<leader>tc", M.choose, {
    desc = "Choose theme",
  })

  vim.api.nvim_create_user_command("Theme", M.choose, {
    desc = "Choose Neovim theme",
  })
end

return M
