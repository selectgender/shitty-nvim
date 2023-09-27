local theme = require("modules.base16").get_theme_table "base16"

local hlgroups = {
  TelescopePromptPrefix = {
    fg = theme.base08,
    bg = theme.base00,
  },

  TelescopeNormal = { bg = theme.base00 },

  TelescopePreviewTitle = {
    fg = theme.base00,
    bg = theme.base0B,
  },

  TelescopePromptTitle = {
    fg = theme.base00,
    bg = theme.base08,
  },

  TelescopeSelection = { bg = theme.base00, fg = theme.base07 },
  TelescopeResultsDiffAdd = { fg = theme.base0B },
  TelescopeResultsDiffChange = { fg = theme.base0A },
  TelescopeResultsDiffDelete = { fg = theme.base08 },
}

return hlgroups
