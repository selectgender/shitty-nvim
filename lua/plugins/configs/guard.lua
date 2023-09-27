local ft = require('guard.filetype')

ft("lua"):fmt("stylua")
          :lint("selene")

ft("luau"):fmt("stylua")
          :lint("selene")

require('guard').setup({
    fmt_on_save = true,
    lsp_as_default_formatter = false,
})
