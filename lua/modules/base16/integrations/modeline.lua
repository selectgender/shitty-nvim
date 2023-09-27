local theme = require("modules.base16").get_theme_table "base16"

local statusline_bg = theme.base01
local light_grey = theme.base02

local lsp_highlights = {
  St_lspError = {
    fg = theme.base08,
    bg = statusline_bg,
  },

  St_lspWarning = {
    fg = theme.base0A,
    bg = statusline_bg,
  },

  St_LspHints = {
    fg = theme.base0E,
    bg = statusline_bg,
  },

  St_LspInfo = {
    fg = theme.base0B,
    bg = statusline_bg,
  },
}

local default = {
  StatusLine = {
    bg = statusline_bg,
  },

  St_gitIcons = {
    fg = light_grey,
    bg = statusline_bg,
    bold = true,
  },

  St_LspStatus = {
    fg = theme.base0D,
    bg = statusline_bg,
  },

  St_LspProgress = {
    fg = theme.base0B,
    bg = statusline_bg,
  },

  St_LspStatus_Icon = {
    fg = theme.base00,
    bg = theme.base0D,
  },

  St_EmptySpace = {
    fg = theme.base03,
    bg = theme.base02,
  },

  St_EmptySpace2 = {
    fg = theme.base03,
    bg = statusline_bg,
  },

  St_file_info = {
    -- bg = theme.base02,
    bg = statusline_bg,
    fg = theme.base07,
  },

  St_file_sep = {
    bg = statusline_bg,
    fg = theme.base02,
  },

  St_cwd_icon = {
    fg = theme.base03,
    bg = theme.base08,
  },

  St_cwd_text = {
    fg = theme.base07,
    bg = theme.base01,
  },

  St_cwd_sep = {
    fg = theme.base08,
    bg = statusline_bg,
  },

  St_pos_sep = {
    fg = theme.base0B,
    bg = theme.base01,
  },

  St_pos_icon = {
    fg = theme.base00,
    bg = theme.base0B,
  },

  St_pos_text = {
    fg = theme.base0B,
    bg = theme.base01,
  }
}

default = vim.tbl_deep_extend("force", default, lsp_highlights)

local function gen_mode_hl(modename, color)
  default["St_" .. modename .. "Mode"] = { fg = theme.base00, bg = theme[color], bold = true }
  default["St_" .. modename .. "ModeSep"] = { fg = theme[color], bg = theme.base01, bold = true }
end

gen_mode_hl("Normal", "base0D")
gen_mode_hl("Visual", "base0C")
gen_mode_hl("Insert", "base0E")
gen_mode_hl("Terminal", "base0B")
gen_mode_hl("NTerminal", "base0A")
gen_mode_hl("Replace", "base09")
gen_mode_hl("Confirm", "base0C")
gen_mode_hl("Command", "base0B")
gen_mode_hl("Select", "base0D")

return default
