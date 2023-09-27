local theme = require("modules.base16").get_theme_table "base16"

return {
  -- LSP References
  LspReferenceText = { fg = theme.base00, bg = theme.base07 },
  LspReferenceRead = { fg = theme.base00, bg = theme.base07 },
  LspReferenceWrite = { fg = theme.base00, bg = theme.base07},

  -- Lsp Diagnostics
  DiagnosticHint = { fg = theme.base0E },
  DiagnosticError = { fg = theme.base08 },
  DiagnosticWarn = { fg = theme.base0A },
  DiagnosticInformation = { fg = theme.base0B},
  LspSignatureActiveParameter = { fg = theme.base00, bg = theme.base0B },

  RenamerTitle = { fg = theme.base00, bg = theme.base08},
  RenamerBorder = { fg = theme.base08},
}
