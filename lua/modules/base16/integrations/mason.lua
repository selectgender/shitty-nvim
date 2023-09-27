local theme = require("modules.base16").get_theme_table "base16"

return {
  MasonHeader = { bg = theme.base08, fg = theme.base00},
  MasonHighlight = { fg = theme.base0D },
  MasonHighlightBlock = { fg = theme.base00, bg = theme.base0B },
  MasonHighlightBlockBold = { link = "MasonHighlightBlock" },
  MasonHeaderSecondary = { link = "MasonHighlightBlock" },
  MasonMuted = { fg = theme.base04 },
  MasonMutedBlock = { fg = theme.base04, bg = theme.base03},
}
