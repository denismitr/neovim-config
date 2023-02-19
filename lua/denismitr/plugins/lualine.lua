
-- Set lualine as statusline
-- See `:help lualine.txt`
local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local nightfly_theme_ok, nightfly_theme = pcall(require, "lualine.themes.nightfly")
if not nightfly_theme_ok then
  return
end

local my_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

nightfly_theme.normal.a.bg = my_colors.blue
nightfly_theme.insert.a.bg = my_colors.green
nightfly_theme.visual.a.bg = my_colors.violet
nightfly_theme.command = {
  a = {
    gui = "bold",
    bg = my_colors.yellow,
    fg = my_colors.black,
  },
}

lualine.setup({
  options = {
    icons_enabled = false,
    theme = nightfly_theme,
    component_separators = '|',
    section_separators = '',
  },
})
