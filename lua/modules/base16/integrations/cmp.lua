local theme = require("modules.base16").get_theme_table "base16"

local highlights = {
  CmpItemAbbr = { fg = theme.base07 },
  CmpItemAbbrMatch = { fg = theme.base0D, bold = true },
  CmpDoc = { bg = theme.base00},
  CmpDocBorder = { fg = theme.base00, bg = theme.base00 },
  CmpPmenu = { bg = theme.base00},
  CmpSel = { link = "PmenuSel", bold = true },
}

local item_kinds = {
  -- cmp item kinds
  CmpItemKindConstant = { fg = theme.base09 },
  CmpItemKindFunction = { fg = theme.base0D },
  CmpItemKindIdentifier = { fg = theme.base08 },
  CmpItemKindField = { fg = theme.base08 },
  CmpItemKindVariable = { fg = theme.base0E },
  CmpItemKindSnippet = { fg = theme.base08 },
  CmpItemKindText = { fg = theme.base0B },
  CmpItemKindStructure = { fg = theme.base0E },
  CmpItemKindType = { fg = theme.base0A },
  CmpItemKindKeyword = { fg = theme.base07 },
  CmpItemKindMethod = { fg = theme.base0D },
  CmpItemKindConstructor = { fg = theme.base0D },
  CmpItemKindFolder = { fg = theme.base07 },
  CmpItemKindModule = { fg = theme.base0A },
  CmpItemKindProperty = { fg = theme.base08 },
  CmpItemKindEnum = { fg = theme.base0D },
  CmpItemKindUnit = { fg = theme.base0E },
  CmpItemKindClass = { fg = theme.base0C },
  CmpItemKindFile = { fg = theme.base07 },
  CmpItemKindInterface = { fg = theme.base0B },
  CmpItemKindColor = { fg = theme.base07 },
  CmpItemKindReference = { fg = theme.base05 },
  CmpItemKindEnumMember = { fg = theme.base0E },
  CmpItemKindStruct = { fg = theme.base0E },
  CmpItemKindValue = { fg = theme.base0C },
  CmpItemKindEvent = { fg = theme.base0A },
  CmpItemKindOperator = { fg = theme.base05 },
  CmpItemKindTypeParameter = { fg = theme.base08 },
  CmpItemKindCopilot = { fg = theme.base0B },
}

return highlights
